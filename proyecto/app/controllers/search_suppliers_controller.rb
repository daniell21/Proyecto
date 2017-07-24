class SearchSuppliersController < ApplicationController

	def new
		@search_supplier = SearchSupplier.new
		
		#@search_supplier = SearchSupplier.uniq.pluck(:category)
	end
	def create
		@search_supplier = SearchSupplier.create(search_supplier_params)
		redirect_to @search_supplier
	end
	def show
		@search_supplier = SearchSupplier.find(params[:id])
	end
	private
	def search_supplier_params
		params.require(:search_supplier).permit(:keywords, :lastname, :email)
	end
end
