class Accountpayable < ActiveRecord::Base
  belongs_to :supplier
  validates :descripcion, presence: true #uniqueness: true
validates :total, presence: true #length: {minimum: 20}
#validates :username, format: { with: /regex/ }
end
