class Client < ActiveRecord::Base
	has_many :accountreceivables
    validates :name, presence: true #uniqueness: true
    validates :lastname, presence: true #length: {minimum: 20}
   #validates :username, format: { with: /regex/ }

end
