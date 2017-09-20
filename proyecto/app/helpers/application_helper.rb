module ApplicationHelper
	include ActionView::Helpers::NumberHelper
	def sortable(column, title = nill)
			title ||= column.titleize
			direction = column == sort_column && sort_diection == "asc" ? "desc" : "asc"
			link_to title, params.permit(:direction, :page).merge(:sort => column, :direction => direction, :page => nil)
		end	
end
