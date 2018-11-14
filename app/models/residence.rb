class Residence < ApplicationRecord
	has_many :auctions, dependent: :destroy
end
