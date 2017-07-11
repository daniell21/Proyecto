class Accountreceivable < ActiveRecord::Base
  belongs_to :client
  before_create :calculate

#validates :username, format: { with: /regex/ }

private
def calculate
	
	self.total = Settings.monthlyPayment + retentioniva
end

end
