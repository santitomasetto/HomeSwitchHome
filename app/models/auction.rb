class Auction < ApplicationRecord
	belongs_to :residence
	validates :residence_id, :uniqueness => {:scope => [:in_date]}
end
