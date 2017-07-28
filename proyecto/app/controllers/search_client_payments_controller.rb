class SearchClientPaymentsController < ApplicationController
	def new
		@search_client_payment = SearchClientPayment.new
		
		#@search_client_payment = SearchClientPayment.uniq.pluck(:category)
	end
	def create
		@search_client_payment = SearchClientPayment.create(search_client_payment_params)
		redirect_to @search_client_payment
	end
	def show
		@search_client_payment = SearchClientPayment.find(params[:id])
	end
	private
	def search_client_payment_params
		params.require(:search_client_payment).permit!
	end
end
