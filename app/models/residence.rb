class Residence < ApplicationRecord
	has_many :auctions, dependent: :destroy
	validates :name, :uniqueness => {:scope => [:country, :address, :capacity, :photo,]}
end
