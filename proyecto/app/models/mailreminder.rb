class Mailreminder < ActiveRecord::Base
after_create :send_mail
   validates :title, presence: true #uniqueness: true
   validates :body, presence: true #length: {minimum: 20}
   
  private
  def send_mail
  	Client.all.each do |client|
  	    #ReminderMailer.delay.new_sendreminder(client)
     
    end
  end


end
