module ApplicationHelper

	#Return a title on a per-page basis.
	def display_title
		base_title = "Roydon"
		unless @title.nil?
			"#{@title} | #{base_title}".titleize
    else
      base_title
		end
	end
end
