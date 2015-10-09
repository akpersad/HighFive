require 'area'

class Geolocation

	attr_reader :zip

	def initialize(zip)
		@zip = zip.to_s
	end

	def get_lat_long
		zip.to_latlon.split(",").collect {|x| x.to_f}
	end

	def get_address
		zip.to_region
	end

	def address
		address ||= get_address
	end

	def lat_long
		lat_long ||= get_lat_long
	end
end
