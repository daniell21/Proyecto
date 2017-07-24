class SearchClientsController < ApplicationController
	def new
		@search_client = SearchClient.new
		
		#@search_client = SearchClient.uniq.pluck(:category)
	end
	def create
		@search_client = SearchClient.create(search_client_params)
		redirect_to @search_client
	end
	def show
		@search_client = SearchClient.find(params[:id])
	end
	private
	def search_client_params
		params.require(:search_client).permit!
	end
end
