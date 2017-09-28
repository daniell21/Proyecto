class Token < ActiveRecord::Base
  belongs_to :user
  before_create :generate_token

  def valid?
    self.expires_at > DateTime.now
  end

 

  def generate_token
    loop do
      self.token = SecureRandom.hex
      break unless Token.where(token: self.token).exists?
    end
    self.expires_at = 3.month.from_now
  end
end
