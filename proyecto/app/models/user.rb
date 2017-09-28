class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
         validates :email, presence: true, uniqueness: true
         #simple search name
         def self.search(search)
  if search
  where('email LIKE ?', "%#{search}%")
  else
    all
  end
end




  
  def self.with_token(data)
    User.where(email: data[:email]).first_or_create do |user|
      user.email = data[:email]
      user.name = data[:name]
    end
  end
end
