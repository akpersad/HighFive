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

	def restaurant_yelp
		restaurant = [] 
		get_values
		i = 0
		while i < @array[2].to_i
			restaurant.push(
				@restaurant_data["businesses"][i]["name"], 
				@restaurant_data["businesses"][i]["rating"],
				@restaurant_data["businesses"][i]["rating_img_url_small"],
				@restaurant_data["businesses"][i]["url"],
				@restaurant_data["businesses"][i]["image_url"])
			i += 1
		end
		restaurant
	end
end