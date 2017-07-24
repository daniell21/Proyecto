module ApplicationHelper
	def sortable(column, title = nill)
			title ||= column.titleize
			direction = column == sort_column && sort_diection == "asc" ? "desc" : "asc"
			link_to title, params.merge(:sort =>column, :direction => direction, :page => nil)
		end	
end
