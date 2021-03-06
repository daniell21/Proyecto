class Rate < ActiveRecord::Base
	has_many :accountreceivables
	validates :name, presence: true
	validates :amount, presence: true
	validates_numericality_of :amount
	before_save :validateAmount
	def validateAmount
	    if amount
	      cAmount = amount.to_s.gsub(',', '.').to_f
	      self.amount = ActionController::Base.helpers.number_with_precision(cAmount, :precision => 2)
	      
	    end

	  end
end
