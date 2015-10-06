Dir[File.dirname(__FILE__) + '../models/*.rb'].each {|file| require file }

class HighFiveController < ApplicationController
  def welcome
  end

  def lat_lng
    
  	lat_long = Geolocation.new(params['zip'])

    if !lat_long.valid?
      flash[:success] = "<b>Please Enter Valid Zip</b>"
      render("/high_five/welcome")
    else
      # @yelper = Yelper.new(lat_long.lat_long).returning
      @insta = Insta.new(lat_long.lat_long).get_values
      render "/high_five/view"
    end
  end

  def view
    #if we go to /view it renders this .. when app is deployed wont this just be canlced? or issue 404
    @insta = {1=>2,3=>4,5=>6}
    @yelper
  end

  def favorite
  end
end
