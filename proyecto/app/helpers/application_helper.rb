module ApplicationHelper
	def sortable(column, title = nill)
			title ||= column.titleize
			direction = column == sort_column && sort_diection == "asc" ? "desc" : "asc"
			link_to title, :sort =>column, :direction => direction
		end	
end
