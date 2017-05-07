class Supplier < ActiveRecord::Base
	has_many :accountpayables
	validates :name, presence: true #uniqueness: true
    validates :lastname, presence: true #length: {minimum: 20}
   #validates :username, format: { with: /regex/ }
end
