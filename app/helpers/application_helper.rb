module ApplicationHelper

	#Return a title on a per-page basis.
	def title
		base_title = "Roydon"
		unless @title.nil?
			"#{@title} | #{base_title}".titleize
		end
	end
end
