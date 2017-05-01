class Accountreceivable < ActiveRecord::Base
  belongs_to :client
validates :descripcion, presence: true #uniqueness: true
validates :total, presence: true #length: {minimum: 20}
#validates :username, format: { with: /regex/ }
end
