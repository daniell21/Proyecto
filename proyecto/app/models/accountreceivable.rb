class Accountreceivable < ActiveRecord::Base
  belongs_to :client
  validates :client_id, presence: true
  validates :date, presence: true
  validates :concept, presence: true
  validates :status, presence: true
  validates :paymentType, presence: true
  validates_numericality_of :transferNumber
  validates_numericality_of :accountNumber
    validates_numericality_of :amountPaid, acceptance: { message: 'No es Numérico' }
    validates_numericality_of :accountNumber, acceptance: { message: 'No es Numérico' }
    validates_numericality_of :transferNumber, acceptance: { message: 'No es Numérico' }

  #validates :monthlyPayment, presence: true	
  validates :paid, presence: true
  
  before_save :calculateBaseAmount
  before_save :calculateBasicAmount
  before_save :calculateAmountWithTax
  before_save :calculateRetentions
  before_save :calculateTotalAmountPerceive

#validates :username, format: { with: /regex/ }

private

def calculateBaseAmount
	
	if !self.baseAmount
		if concept == "mensualidad"
	     self.baseAmount  = Settings.monthlyPayment
	 	end
	 	if concept == "instalacion"
	 		self.baseAmount  = Settings.installPayment
	 	end
	 	if concept == "instalacionMensualidad"
	 		self.baseAmount = Settings.completePayment
	 	end
	 	if concept == "reactivacion"
	 		self.baseAmount  = Settings.reactivationPayment
	 	end
 	end
 
end
def calculateBasicAmount
	resultado = 0

	client.discounts.each do |discount|
		
		resultado = resultado + discount.percentage
		
	end
	
	
	self.amountWithoutTax = (baseAmount * ( 1 - (resultado.to_f/100)))
	
	#raise (Settings.monthlyPayment * ( 1 - (client.discounts.find(1).percentage.to_f/100))).to_yaml
	
end

def calculateAmountWithTax
	#raise amountWithoutTax.to_yaml
	
	self.amountWithtTax =  eval(sprintf("%14.4f",(amountWithoutTax * 1.12)))
end

def calculateRetentions
	retention = 0
	#raise retentionIva.to_yaml
	
	if client.specialcontributor
		retention = amountWithoutTax * 0.02
	end
		retention = retention + amountWithoutTax * Settings.tax * 1
	
	self.totalRetentions = retention
	
end

def calculateTotalAmountPerceive
	self.totalAmountPerceive = amountWithtTax - totalRetentions
end


end
