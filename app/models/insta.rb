require 'open-uri'

class Insta

	attr_reader :lat_long


	def initialize(array)	
		@lat_long = array
	end
		
	def get_values	
		latitude = lat_long[0].to_s
		longitude = lat_long[1].to_s
		access = ENV["insta_access"]
		url = "https://api.instagram.com/v1/media/search?lat=#{latitude}&lng=#{longitude}&access_token=#{access}"
		url
		
	end

	def url
		url ||= get_values
	end

	def json_parse
		new_hash = Hash.new
		new_hash1 = Hash.new
		instagram_hash = JSON.load(open(url))
		instagram_hash
	end

	def insta_hash
		insta_hash ||= json_parse
	end

	#not times do but change to while loop should fix :)

	def insta_builder
		final_hash = Hash.new
			insta_hash['data'].each_with_index do |sections,index|
				if index < lat_long[2].to_i
				final_hash[sections['images']['low_resolution']['url'].to_s] = sections['link'].to_s
				end
			end
		final_hash
	end

	def runner
		final_hash ||= insta_builder
	end
end