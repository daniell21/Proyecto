class SearchDiscount < ApplicationRecord
	def search_discounts
		discounts = Discount.all

		discounts = discounts.where(["name LIKE ?","%#{keywords}%"]) if keywords.present?
		discounts = discounts.where(["percentage LIKE ?",percentage]) if percentage.present?
		
		return discounts
	end
end
