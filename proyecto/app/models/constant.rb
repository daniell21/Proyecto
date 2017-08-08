class Constant < ActiveRecord::Base
	validates :monthlyPayment, presence: true
	validates :installPayment, presence: true
	validates :completePayment, presence: true
	validates :reactivationPayment, presence: true
	validates :tax, presence: true

end
