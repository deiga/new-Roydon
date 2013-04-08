class ShowsController < ApplicationController

  caches_action :index, cache_path: (proc do
    year = params[:year].nil? ? Date.today.year : params[:year]
    { tag: "#{Show.cache_key}-#{year}" }
  end)

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
