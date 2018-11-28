class Reservation < ApplicationRecord
	belongs_to :residence
	belongs_to :user
	validates :residence_id, :uniqueness => {:scope => [:in_date]}
	validates :user_id, :uniqueness => {:scope => [:in_date]}
end
