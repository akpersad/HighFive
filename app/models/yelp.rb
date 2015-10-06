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
		# @bar_path = "/v2/search?term=bar&ll=40.732689,-73.784866&"

		consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
		access_token = OAuth::AccessToken.new(consumer, token, token_secret)

		@yelp_data = JSON.parse(access_token.get(@food_path).body)
	end

	def returning
		rest = [] 
		get_values
		i = 0
		while i < @array[2].to_i
			rest.push(
				@yelp_data["businesses"][i]["name"], 
				@yelp_data["businesses"][i]["rating"],
				@yelp_data["businesses"][i]["rating_img_url_small"],
				@yelp_data["businesses"][i]["url"],
				@yelp_data["businesses"][i]["image_url"])
			i += 1
		end
		rest
	end
end

# array = [40.732689, -73.784866, 5]
# a = Yelp.new(array).returning
