class Discount < ActiveRecord::Base
	 has_and_belongs_to_many :clients
	 validates :name, presence: true
end
