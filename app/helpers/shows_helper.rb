module ShowsHelper

  @@time = Date.today
  
  def display_show_rows(collection)
    unless collection.blank?
      html = ''
        for show in collection
          html << "<tr id='#{show.date}'>"
          html << " <td headers='show_time'>#{show.format_date}</td>"
        html << " <td headers='show_name'>"
        html << "   <a href='#{show.url}'>#{show.title}</a>"
        html << " </td>"
        html << " <td headers='show_place'>#{show.location}</td>"
        html << "</tr>"
        end

        return html.html_safe
    end
  end

  def display_show_years(startYear = @@time.year)
    if startYear < @@time.year
      year_text = startYear
    elsif @@time.month >= 6
      year_text = "#{startYear} - #{@@time.next_year.year}"
    else
      year_text = startYear           
    end
  end

  def display_year_list
      year = @@time.year
      prev_year = @@time.prev_year.year
      prev_prev_year = @@time.prev_year(2).year

      html = ''
      html << '<ul id="yearslist">'
      html << '<li>' + link_to(prev_prev_year, shows_path(:year => prev_prev_year), :title => prev_prev_year) + '</li>'
      html << '<li>' + link_to(prev_year, shows_path(:year => prev_year), :title => prev_year) + '</li>'
    html << '<li>' + link_to(year, shows_path(:year => year), :title => year) + '</li>'
    html << '</ul>'

    html.html_safe
  end
end
