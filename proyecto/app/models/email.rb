class Email < ApplicationRecord
  belongs_to :client, optional: true
  validates :email, presence: true
end
