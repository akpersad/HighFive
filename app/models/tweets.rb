require "twitter"
require "open-uri"
require "pry"
class Tweets
	attr_reader :string, :num

	def initialize(string,num)
		@string = string
		@num = num.to_i
	end

	TWITTER = Twitter::REST::Client.new do |config|
		  config.consumer_key        = "suECsPzsMM7V3GoNnIaXXE4hY"
		  config.consumer_secret     = "NoA8RS9o8kpdZiIwtVtQi2RHJIv6idKrTNy8Yv7Wp0H76CPa2S"
		  config.access_token        = "36609245-osCJiHheIlZ6js2JVjQU5IyeXjUmFuDmpkglxpPbB"
		  config.access_token_secret = "RljESz8ssq5owjeveAITWmRNEhkdwDSycyKEyqljcqZkY"
		end


	def search_results
		# binding.pry
		results = Array.new
		TWITTER.search(string).each do |tweet|
			if results.length < num
				results << tweet
			else
				break
			end
		end
		results
	end

	def results
		array ||= search_results
	end
end