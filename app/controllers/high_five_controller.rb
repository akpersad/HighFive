require_relative "../models/GeoLocation.rb" 

class HighFiveController < ApplicationController
  def welcome
  end

  def lat_lng
  	lat_long = GeoLocation.new(params['zip'])
  	redirect_to("/high_five/view")
  end

  def view
  end

  def favorite
  end
end
