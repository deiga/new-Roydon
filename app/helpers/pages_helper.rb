module PagesHelper

	def display_news_items(collection)
		unless collection.blank?
			html = '<div class="scroller">'
			for story in collection
				html << "<section class='news'>"
				html << "	<h4>#{story.title}</h4><span> - #{story.format_date}</span>"
				html << "	<p>#{story.content}</p>"
				html << "</section>"
			end
			html << '</div>'

			return html.html_safe
		end
	end
end
