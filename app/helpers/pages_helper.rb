module PagesHelper
	
	def display_show_rows(collection)
		unless collection.blank?
			html = ''
		  	for show in collection
		  		date = Time.parse(show.date.to_s)
		    	html << "<tr id='#{date.strftime('%Y-%m-%d')}'>"
		    	html << "	<td headers='show_time'>#{date.strftime('%d.%m.')}</td>"
				html << "	<td headers='show_name'>"
				html << "		<a href='#{show.url}'>#{show.title}</a>"
				html << "	</td>"
				html << "	<td headers='show_place'>#{show.location}</td>"
				html << "</tr>"
		  	end

		  	return html.html_safe
		end
	end
end
