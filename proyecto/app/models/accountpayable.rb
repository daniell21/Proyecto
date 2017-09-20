class Accountpayable < ApplicationRecord
  include ActionView::Helpers::NumberHelper
  belongs_to :supplier, optional: true
  validates :amountPaid, presence: true
  validates :supplier_id, presence: true
  validates :profitNumber, presence: true, length: { minimum: 6 }, uniqueness: true
  validates_numericality_of :profitNumber
  validates_numericality_of :amountPaid
  after_save :setDate
  


  



#validates :username, format: { with: /regex/ }

#simple search total
def self.search(search)
  if search
  where('total LIKE ?', "%#{search}%")
  else
    all
  end
end
private

  def helper
    @helper ||= Class.new do
      include ActionView::Helpers::NumberHelper
    end.new
  end

  def setDate
 
  
      self.update_column(:date, Time.now.strftime("%d/%m/%Y %H:%M"))
  
end

end

