class ShowsController < ApplicationController

  before_action :skip_if_cached, only: [:index]

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

  private

    def skip_if_cached
      year = params[:year].nil? ? Date.today.year : params[:year]
      return render :index if fragment_exist?([Show.cache_key, year])
    end
end
