class Residence < ApplicationRecord
	has_many :auctions, dependent: :destroy
	has_many :reservations, dependent: :destroy
	has_many :hotsales, dependent: :destroy
	validates :name, :uniqueness => {:scope => [:country, :address, :capacity, :photo,]}

	def is_available?(start_date,end_date)
        reservations.where(:in_date => start_date..end_date).empty?
    end
end
