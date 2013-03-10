class ShowsController < ApplicationController

  def index
    @title = t 'shows.title'
    today = Date.today
    @year = params[:year] ? params[:year].to_i : today.year

    if @year < today.year
      queried_year = Date.new(@year)
      @upcoming_shows = Show.active.where( :date.gte => queried_year,
        :date.lt => queried_year.next_year )
    else
      @upcoming_shows = Show.upcoming
      @earlier_shows = Show.active.where( :date.lt => today,
        :date.gte => Date.new(today.year) )
    end
  end
end
