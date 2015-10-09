Dir[File.dirname(__FILE__) + '../models/*.rb'].each {|file| require file }

class HighFiveController < ApplicationController
  def welcome
  end

  def lat_lng


    if Valid.new(params['zip']).is_zip?
      session['params'] = [params['zip'],params['number']]
      Zipcode.create(:zipcode => params['zip'],:number_to_return => params['number'])
      redirect_to("/high_five/view")
    else
      flash[:success] = "<b>Please Enter Valid Zip</b>"
      render("/high_five/welcome")
    end

  end

  def view

    session['init'] = true

    if !session['params'].nil?
      @lat_long = Geolocation.new(session['params'][0])
      address = @lat_long.address
      latlong = @lat_long.lat_long << session['params'][1]
      @restaurant_yelper = Yelp.new(latlong).restaurant_yelp
      @insta = Insta.new(latlong).runner
      @twitter = Tweets.new(address,session['params'][1]).results
      render "/high_five/view"
    else
      redirect_to ("/")
    end

  end

  def favorite
  end
end
