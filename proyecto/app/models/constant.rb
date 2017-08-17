class Constant < ActiveRecord::Base
	validates :monthlyPayment, presence: true
	validates :installPayment, presence: true
	validates :completePayment, presence: true
	validates :reactivationPayment, presence: true
	validates :tax, presence: true
  before_save :number_to_currency_br

	def number_to_currency_br
  raise (monthlyPayment).to_yaml
end

end


