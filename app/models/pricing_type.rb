class PricingType < ApplicationRecord
	has_many :dishes
	BY_WEIGHT = 1
	BY_PORTION = 2
	def is_by_weight?
		if self.id == BY_WEIGHT 
			return true
		end
	end
end
