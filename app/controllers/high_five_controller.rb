Dir[File.dirname(__FILE__) + '../models/*.rb'].each {|file| require file }

class HighFiveController < ApplicationController
  def welcome
  end

  def lat_lng
    # need to make a valid class to make sure params valid to_i temp solution
    
    if Valid.new(params['zip']).is_zip?
      Zipcode.create(:zipcode => params['zip'],:number_to_return => params['number'])
      redirect_to("/high_five/view")
    else
      flash[:success] = "<b>Please Enter Valid Zip</b>"
      render("/high_five/welcome")
    end
  end

  def view
    data = Zipcode.order("created_at").last

    @lat_long = Geolocation.new(data.zipcode)
    address = @lat_long.address
    latlong = @lat_long.lat_long << data.number_to_return
    @restaurant_yelper = Yelp.new(latlong).restaurant_yelp
    @bar_yelper = Yelp.new(latlong).bar_yelp
    @insta = Insta.new(latlong).get_values
    @twitter = Tweets.new(address,data.number_to_return).results

    render "/high_five/view"
  end

  def favorite
  end
end
