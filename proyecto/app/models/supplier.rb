class Supplier < ApplicationRecord
	has_many :accountpayables, :dependent => :delete_all
	validates :name, presence: true #uniqueness: true
  validates :email, presence: true #length: {minimum: 20}
  validates :rif, presence: true, length: { minimum: 9 }
  validates :rif, uniqueness: true 
  validates_numericality_of :rif
  validates :socialReason, presence: true
  validates :address, presence: true
  validates :email, uniqueness: true
 
   

  
  #simple search name
  def self.search(search)
  if search
  where('name LIKE ?', "%#{search}%")
  else
    all
  end
end
end
