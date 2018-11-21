class Auction < ApplicationRecord
	belongs_to :residence
	validates :name, :uniqueness => {:scope => [:in_date]}
end
