class Clientmail < ActiveRecord::Base
  belongs_to :client
  after_create :send_mail
  validates :title, presence: true #uniqueness: true
   validates :body, presence: true #length: {minimum: 20}
  private
  def send_mail
  	Sendclientmail.delay.new_sendclientmail(client)
  end
end
