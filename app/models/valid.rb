require 'area'
class Valid

	attr_reader :input

	def initialize(input)	
		@input = input
	end

	def valid?
		
		if !(/^\d{5}$/).match input
			return false 
		end
		true
	end

	def is_zip?
		if input.to_region && valid?
			return true
		end
		false
	end


end