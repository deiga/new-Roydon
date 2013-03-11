class ShowsController < ApplicationController

  def index
    @title = t 'shows.title'
    today = Date.today
    @year = params[:year] ? params[:year].to_i : today.year

    if @year < today.year
      queried_year = Date.new(@year)
      @upcoming_shows = Show.range(queried_year, queried_year.next_year)
    else
      @upcoming_shows = Show.upcoming
      @earlier_shows = Show.earlier_this_year
    end
  end
end
