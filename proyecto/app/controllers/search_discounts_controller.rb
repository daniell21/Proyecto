class SearchDiscountsController < ApplicationController
	def new
		@search_discount = SearchDiscount.new
		
		#@search_discount = SearchDiscount.uniq.pluck(:category)
	end
	def create
		@search_discount = SearchDiscount.create(search_discount_params)
		redirect_to @search_discount
	end
	def show
		@search_discount = SearchDiscount.find(params[:id])
	end
	private
	def search_discount_params
		params.require(:search_discount).permit(:keywords, :percentage)
	end
end
