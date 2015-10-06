require "twitter"
require "open-uri"
require "pry"
class Tweets
	attr_reader :string

	def initialize(string)	
		@string = string
	end

	TWITTER = Twitter::REST::Client.new do |config|
		  config.consumer_key        = "suECsPzsMM7V3GoNnIaXXE4hY"
		  config.consumer_secret     = "NoA8RS9o8kpdZiIwtVtQi2RHJIv6idKrTNy8Yv7Wp0H76CPa2S"
		  config.access_token        = "36609245-osCJiHheIlZ6js2JVjQU5IyeXjUmFuDmpkglxpPbB"
		  config.access_token_secret = "RljESz8ssq5owjeveAITWmRNEhkdwDSycyKEyqljcqZkY"
		end


	def search_results
		results = Array.new
		TWITTER.search(string).each do |tweet|
			if results.length < 5
				results << tweet
			else
				break
			end
		end
		results
	end

	def results
		results ||= search_results
	end

	<blockquote class="twitter-tweet" lang="en"><p lang="en" dir="ltr">Have a High Five <a href="https://t.co/ce0TFlAcy5">https://t.co/ce0TFlAcy5</a></p>&mdash;  <a href="https://twitter.com/codeschool/status/651464468233236480">October 2, 2015</a></blockquote>
	<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>


	<blockquote class="twitter-tweet" lang="en"><p lang="en" dir="ltr">Have a High Five <a href="https://t.co/ce0TFlAcy5">https://t.co/ce0TFlAcy5</a></p>&mdash;  <a href="https://twitter.com/codeschool/status/651464468233236480">October 2, 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

	# def get_tweets
	# 	# binding.pry
	# 	results.each do |indiv_tweet|
	# 		indiv_tweet.id
	# 	end
	# end

	@url = "https://twitter.com/statuses/651469730931437568#{id}"


end

a = Tweets.new("Brooklyn, New York City")
a.results
binding.pry