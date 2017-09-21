class SearchAccountreceivablesController < ApplicationController
	def new
		@search_accountreceivable = SearchAccountreceivable.new
		
		#@search_client = SearchClient.uniq.pluck(:category)
	end
	def create
		@search_accountreceivable = SearchAccountreceivable.create(search_accountreceivable_params)
		redirect_to @search_accountreceivable
	end
	def show
		@search_accountreceivable = SearchAccountreceivable.find(params[:id])
	end
	private
	def search_accountreceivable_params
		params.require(:search_accountreceivable).permit!
	end
end
