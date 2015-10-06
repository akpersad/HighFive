require "pry"
require "twitter"
class Tweets
	attr_reader :lat_long

	def initialize(array)	
		@lat_long = array
	end

	def cli
		client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = "suECsPzsMM7V3GoNnIaXXE4hY"
		  config.consumer_secret     = "NoA8RS9o8kpdZiIwtVtQi2RHJIv6idKrTNy8Yv7Wp0H76CPa2S"
		  config.access_token        = "36609245-osCJiHheIlZ6js2JVjQU5IyeXjUmFuDmpkglxpPbB"
		  config.access_token_secret = "RljESz8ssq5owjeveAITWmRNEhkdwDSycyKEyqljcqZkY"
		end
	end

end

a = Tweets.new([1,2])
a = a.cli
b = a.search("girls")
binding.pry