class Apiuser < ActiveRecord::Base
	require 'bcrypt'
	before_create :set_encrypt_password
	validates :email, presence: true, uniqueness: true , length: { minimum: 3, maximum: 20}
	
	def set_encrypt_password
		self.password = BCrypt::Password.create self.password	
	end

	def is_valid_password?(password)
		self.password = BCrypt::Engine.hash_secret(password, self.password)
	end

end
