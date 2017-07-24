class Accountpayable < ActiveRecord::Base
  belongs_to :supplier
  validates :descripcion, presence: true #uniqueness: true
  validates :supplier_id, presence: true
validates :total, presence: true #length: {minimum: 20}
validates_numericality_of :total
#validates :username, format: { with: /regex/ }

#simple search total
def self.search(search)
  if search
  where('total LIKE ?', "%#{search}%")
  else
    all
  end
end

end

