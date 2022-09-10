class Category < ApplicationRecord
	has_many :dishes

	validates :name, presence: true, length: {minimum: 2}
end
