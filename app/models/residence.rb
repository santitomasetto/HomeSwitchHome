class Residence < ApplicationRecord
	has_many :auctions, dependent: :destroy
	has_many :reservations, dependent: :destroy
	has_many :hotsales, dependent: :destroy
	validates :name, :uniqueness => {:scope => [:country, :address, :capacity, :photo,]}

	def is_available?(check_in)
        reservations.where(in_date: check_in).empty?
    end
end
