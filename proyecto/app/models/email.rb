class Email < ActiveRecord::Base
  belongs_to :client
  validates :email, presence: true
end
