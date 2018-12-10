class Auction < ApplicationRecord
	belongs_to :residence
	has_many :bids, dependent: :destroy
	validates :residence_id, :uniqueness => {:scope => [:in_date]}
end
