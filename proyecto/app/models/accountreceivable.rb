class Accountreceivable < ActiveRecord::Base
  belongs_to :client
  validates :client_id, presence: true
  validates :date, presence: true
  validates :concept, presence: true
  validates :status, presence: true
  validates :paymentType, presence: true
  #validates :monthlyPayment, presence: true	
  validates :paid, presence: true
  before_save :calculateCode
  before_save :calculateBaseAmount
  before_save :calculateBasicAmount
  before_save :calculateAmountWithTax
  before_save :calculateRetentions
  before_save :calculateTotalAmountPerceive

#validates :username, format: { with: /regex/ }

private
def calculateCode
	#self.total = Settings.monthlyPayment + retentioniva
	self.code = client.country + client.state + client.profitCode
end
def calculateBaseAmount
	
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
	if retentionIva
		retention = amountWithoutTax * 0.02
	end
	#raise (retention).to_yaml
	if retentionIsrl
		retention = retention + amountWithoutTax * 0.12 * 1
	end
	self.totalRetentions = retention
	
end

def calculateTotalAmountPerceive
	self.totalAmountPerceive = amountWithtTax - totalRetentions
end


end
