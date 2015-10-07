require 'rubygems'
require 'oauth'
require 'pry'
require 'json'

class Yelp
	def initialize(array)
		@array = array
	end

	def get_values
		consumer_key = 'h-PhZkg6N-RV08KQAoHbkQ'
		consumer_secret = '6NIvfs6CW2KPTxjRzjna42LkYBc'
		token = 'M9_KEOzf5dG3i-GDO0WDGSqbeQ92aMwo'
		token_secret = 'aQoGM4JPP-PgQj6k-33tgs99eIU'

		api_host = 'api.yelp.com'

		@food_path = "/v2/search?term=food&ll=#{@array[0]},#{@array[1]}&limit=#{@array[2]}"
		@bar_path = "/v2/search?term=bar&ll=#{@array[0]},#{@array[1]}&limit=#{@array[2]}"
		consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
		access_token = OAuth::AccessToken.new(consumer, token, token_secret)

		@restaurant_data = JSON.parse(access_token.get(@food_path).body)
		@bar_data = JSON.parse(access_token.get(@bar_path).body)
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
		def bar_yelp
		bar = []
		get_values
		i = 0
		while i < @array[2].to_i
			bar.push(
				@bar_data["businesses"][i]["name"], 
				@bar_data["businesses"][i]["rating"],
				@bar_data["businesses"][i]["rating_img_url_small"],
				@bar_data["businesses"][i]["url"],
				@bar_data["businesses"][i]["image_url"])
			i += 1  	
		end  
		bar
	end
end