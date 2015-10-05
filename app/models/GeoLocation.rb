require 'pry'
require 'geocoder'

# this app starts after user sends post request

class GeoLocation

	attr_reader :zip

	def initialize(zip)
		@zip = zip.to_s

		if !(/^\d{5}$/).match @zip
			raise ZipCodeError 
		end


	end

	def get_lat_long
		location = []
		location_data = Geocoder.search(zip.to_i)
		location << location_data[0].data["geometry"]["location"]['lat']
		location << location_data[0].data["geometry"]["location"]['lng']
		location
	end

	def lat_long
		lat_long ||= get_lat_long
	end

	

end

#if it raise error, redirect back to start page, if not continue from 
class ZipCodeError < StandardError
	puts "Please insert zip code"
end
