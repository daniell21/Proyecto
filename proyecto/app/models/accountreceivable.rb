class Accountreceivable < ActiveRecord::Base
  belongs_to :client
  before_create :calculateCode
  before_create :calculateBasicAmount

#validates :username, format: { with: /regex/ }

private
def calculateCode
	
	#self.total = Settings.monthlyPayment + retentioniva

	self.code = client.country + client.state + profitCode

end
def calculateBasicAmount
	resultado = 0
	client.discounts.each do |discount|
		resultado = resultado + discount.percentage
	end
	
	
	self.total = (Settings.monthlyPayment * ( 1 - (resultado.to_f/100)))
	
	#raise (Settings.monthlyPayment * ( 1 - (client.discounts.find(1).percentage.to_f/100))).to_yaml



end


end
