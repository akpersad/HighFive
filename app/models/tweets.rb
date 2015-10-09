require "twitter"
require "open-uri"
class Tweets
	attr_reader :string, :num

	def initialize(string,num)
		@string = string
		@num = num.to_i
	end

	TWITTER = Twitter::REST::Client.new do |config|
		  config.consumer_key        = ENV["consumer_key"]
		  config.consumer_secret     = ENV["consumer_secret"]
		  config.access_token        = ENV["access_token"]
		  config.access_token_secret = ENV["access_token_secret"]
	end

	def search_results
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