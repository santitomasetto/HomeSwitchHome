class Residence < ApplicationRecord
	has_many :auctions, dependent: :destroy
	has_many :reservations, dependent: :destroy
	validates :name, :uniqueness => {:scope => [:country, :address, :capacity, :photo,]}
end
