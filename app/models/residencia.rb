class Residencia < ApplicationRecord
	has_many :subastas, dependent: :destroy
end
