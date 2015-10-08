require 'pry'
require 'geocoder'

class Geolocation

	attr_reader :zip

	def initialize(zip)
		@zip = zip.to_s
	end

	def get_lat_long
		location = []
		sleep(1)
		location_data = Geocoder.search(zip)
		location << location_data[0].data["geometry"]["location"]['lat']
		location << location_data[0].data["geometry"]["location"]['lng']
		location
	end

	def get_address
		address = Array.new
		data = Geocoder.search(lat_long)
		address << data[0].data["address_components"][3]["long_name"]
		address << data[0].data["address_components"][5]["long_name"]
		address.join(", ")

	end

	def address
		address ||= get_address
	end

	def lat_long
		lat_long ||= get_lat_long
	end

	

end
