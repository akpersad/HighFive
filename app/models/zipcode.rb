class Zipcode < ActiveRecord::Base
	validates :zipcode, presence: true
end
