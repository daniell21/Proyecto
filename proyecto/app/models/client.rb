class Client < ActiveRecord::Base
  #Relaciones
	has_many :accountreceivables, :dependent => :delete_all
  has_many :client_mails, :dependent => :delete_all
  has_many :emails, :dependent => :delete_all

  #Validaciones
  has_and_belongs_to_many :discounts
  validates :name, presence: true
  validates :country, presence: true 
  validates :socialReason, presence: true
  validates :state, presence: true
  validates :localId, presence: true
  validates :rif, presence: true, uniqueness: true , length: { minimum: 9, maximum: 9}
  validates :profitCode, presence: true, length: { minimum: 6 }, uniqueness: true
  validates :localAmount, presence: true
  before_save :generate_token






  
  validates_numericality_of :rif
  validates_numericality_of :localAmount
  validates_numericality_of :profitCode
  validates_numericality_of :specialDiscount, :allow_blank => true

  before_save :calculateCode
 
  

def generate_token
  raise Token.generate_token.to_yaml
end

  #simple search name
 def self.search(search)
  if search
  where('name LIKE ?', "%#{search}%")
  else
    all
  end
end

   private
def calculateCode
  self.code = country + state + profitCode
  
end

  


 

end
