Dir[File.dirname(__FILE__) + '../models/*.rb'].each {|file| require file }

class HighFiveController < ApplicationController
  def welcome
  end

  def lat_lng
    Zipcode.create(:zipcode => params['zip'])
    
  	lat_long = Geolocation.new(params['zip'])

    if !lat_long.valid?
      flash[:success] = "<b>Please Enter Valid Zip</b>"
      render("/high_five/welcome")
    else
      address = lat_long.address
      latlong = lat_long.lat_long << params["number"]
      @restaurant_yelper = Yelp.new(latlong).restaurant_yelp
      @bar_yelper = Yelp.new(latlong).bar_yelp
      @insta = Insta.new(latlong).get_values
      @twitter = Tweets.new(address,params["number"]).results

      render "/high_five/view"
    end
  end

  def view
  end

  def favorite
  end
end
