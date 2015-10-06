require 'open-uri'

class Insta

	attr_reader :lat_long


	def initialize(array)	
		@lat_long = array
		# binding.pry

	end
		
	def get_values	
		latitude = lat_long[0].to_s
		longitude = lat_long[1].to_s
		access = "328328693.820ad4a.e7188df1eb914a3d825d3055fee849bf"
		@url = "https://api.instagram.com/v1/media/search?lat=#{latitude}&lng=#{longitude}&access_token=#{access}"
		
		json_parse
	end

	def json_parse
		new_hash = Hash.new
		new_hash1 = Hash.new
		instagram_hash = JSON.load(open(@url))
		
		int = 0
		if instagram_hash['meta']['code'] = 200
			enter = instagram_hash['data']
			enter.each do |sections|
				thumbnail_pic = sections['images']['low_resolution']['url'].to_s
				insta_profile = sections['link'].to_s
				new_hash[thumbnail_pic] = insta_profile
			end
		end

		while int < lat_long[2].to_i
		key = new_hash.keys[int]
		value = new_hash.values[int]
			new_hash1[key] = value

		int += 1
		end
		new_hash1
	end
end