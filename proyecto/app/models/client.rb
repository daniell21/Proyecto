class Client < ActiveRecord::Base
	has_many :accountreceivables
    validates :name, presence: true #uniqueness: true
    validates :lastname, presence: true #length: {minimum: 20}
   #validates :username, format: { with: /regex/ }
   after_create :send_mail
   private
   def send_mail
   	ClientMailer.new_client(self).deliver_later
   end

end
