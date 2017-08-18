class Accountpayable < ActiveRecord::Base
  belongs_to :supplier
  validates :descripcion, presence: true #uniqueness: true
  validates :amountPaid, presence: true
  validates :date, presence: true
  validates :supplier, presence: true
  before_save :validateAmountPaid
def validateAmountPaid
    if amountPaid
      amount = amountPaid.to_s.gsub(',', '.').to_f
      self.amountPaid = ActionController::Base.helpers.number_with_precision(amount, :precision => 2)
      
    end

  end


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

