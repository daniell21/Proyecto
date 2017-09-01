class SearchAccountpayablesController < ApplicationController
	def new
		@search_accountpayable = SearchAccountpayable.new
		
		#@search_client = SearchClient.uniq.pluck(:category)
	end
	def create
		@search_accountpayable = SearchAccountpayable.create(search_accountpayable_params)
		redirect_to @search_accountpayable
	end
	def show
		@search_accountpayable = SearchAccountpayable.find(params[:id])
	end
	private
	def search_accountpayable_params
		params.require(:search_accountpayable).permit!
	end
end
