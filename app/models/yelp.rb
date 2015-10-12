require 'rubygems'
require 'oauth'
require 'json'

class Yelp
	def initialize(array)
		@array = array
	end

	def get_values
		consumer_key = ENV["yelp_c_k"]
		consumer_secret = ENV["yelp_c_s"]
		token = ENV["yelp_t"]
		token_secret = ENV["yelp_t_s"]
	
		api_host = 'api.yelp.com'

		@food_path = "/v2/search?term=restaurants&ll=#{@array[0]},#{@array[1]}&limit=#{@array[2]}"
		consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
		access_token = OAuth::AccessToken.new(consumer, token, token_secret)

		@restaurant_data = JSON.parse(access_token.get(@food_path).body)
	end

	def rating(rating)
		rate= Array.new
		
		if rating.class == Float
			if rating == 1.0
				rate << 'http://i.imgur.com/UKYzW9N.png'
			elsif rating == 2.0
				rate << 'http://i.imgur.com/YbczZb3.png'
			elsif rating == 3.0
				rate << 'http://i.imgur.com/AM1zmkP.png'
			elsif rating == 4.0
				rate << 'http://i.imgur.com/qiQGzep.png'
			elsif rating == 5.0
				rate << 'http://i.imgur.com/wuVkrMw.png'
			elsif rating == 1.5
				rate << 'http://i.imgur.com/8QBdPCJ.png'
			elsif rating == 2.5
				rate << 'http://i.imgur.com/cWFPXld.png'
			elsif rating == 3.5
				rate << 'http://i.imgur.com/yeFN6mt.png'
			elsif rating == 4.5
				rate << 'http://i.imgur.com/Jj97Xtr.png'
			end
		end
		rate
	end

	def restaurant_yelp
		restaurant = [] 
		get_values
		i = 0
		while i < @array[2].to_i
			restaurant << [
				@restaurant_data["businesses"][i]["name"],
				@restaurant_data['businesses'][i]['categories'].flatten[0],
				rating(@restaurant_data["businesses"][i]["rating"]),
				@restaurant_data["businesses"][i]["url"],
				@restaurant_data["businesses"][i]["image_url"],
				@restaurant_data["businesses"][i]['snippet_text'] ]
			i += 1
		end
		restaurant
	end

	def runner
		restaurant ||= restaurant_yelp
	end
end