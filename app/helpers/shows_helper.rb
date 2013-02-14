module ShowsHelper

  # Output the year range for the displayed shows
  # * If the given year is a past year, then return given
  # * If this year is beyond June, return range of this year to next year
  def display_show_year(startYear = Date.today.year)
    today = Date.today
    if startYear < today.year
      startYear
    elsif today.month >= 9
      "#{startYear} - #{today.next_year.year}"
    else
      startYear
    end
  end

end
