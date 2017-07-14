class Accountreceivable < ActiveRecord::Base
  belongs_to :client
  before_create :calculate

#validates :username, format: { with: /regex/ }

private
def calculate
	
	self.total = Settings.monthlyPayment + retentioniva
print("YA IMPRIMUUUUU")
	print(client.country)
	self.code = client.country + client.state + profitCode
	print("YA FUE")
end


end
