class Zipcode < ActiveRecord::Base
	validates :zipcode, presence: true, uniqueness: true
end
