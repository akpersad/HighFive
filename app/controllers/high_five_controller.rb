class HighFiveController < ApplicationController
  def welcome
  end
  def lat_lng
    if Valid.new(params['zip']).is_zip?
      
        @lat_long = Geolocation.new(session['params'][0])
        address = @lat_long.address
        latlong = @lat_long.lat_long << session['params'][1]
        @restaurant_yelper = Yelp.new(latlong).restaurant_yelp
        @insta = Insta.new(latlong).runner
        @twitter = Tweets.new(address,session['params'][1]).results
        render "/high_five/view"
    else
      flash[:success] = "<b>Please Enter Valid Zip</b>"
      render("/high_five/welcome")
    end
  end
  def view
      redirect_to ("/")
  end
  def favorite
  end
end
