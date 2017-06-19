class Discount < ActiveRecord::Base
	has_many :has_discounts
	has_many :clients, through: :has_discounts
end
