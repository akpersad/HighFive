require_relative "../models/GeoLocation.rb" 
require_relative "../models/Instagram.rb" 

class HighFiveController < ApplicationController
  def welcome
  end

  def lat_lng
  	lat_long = GeoLocation.new(params['zip'])
    # @insta = Instagram.new(lat_long.lat_long)
  	redirect_to("/high_five/view")
  end

  def view
  end

  def favorite
  end
end
