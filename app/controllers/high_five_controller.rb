class HighFiveController < ApplicationController
  def welcome
  end

  def results
    if Valid.new(params['zip']).is_zip?
        @lat_long = Geolocation.new(params['zip'])
        address = @lat_long.address
        latlong = @lat_long.lat_long << params['number']
        @restaurant_yelper = Yelp.new(latlong).runner
        @insta = Insta.new(latlong).runner
        @twitter = Tweets.new(address,params['number']).results
        render "/high_five/view"
        Zipcode.create(:zipcode => params['zip'] )
    else
      flash[:success] = "<b>Please Enter Valid Zip</b>"
      redirect_to ("/")
    end
  end

  def view
      redirect_to ("/")
  end

  def favorite
  end
end
