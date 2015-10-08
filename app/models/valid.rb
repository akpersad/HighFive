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
		if valid?
			if input.to_region
				return true
			end
		end
		false
	end
end