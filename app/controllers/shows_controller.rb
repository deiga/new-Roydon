class ShowsController < ApplicationController

  caches_action :index, cache_path: proc { |c|
    show = Show.desc(:updated_at).limit(1).first
    { tag: show.updated_at.to_i }
  }

  def index
    @title = 'Shows'
    @year = params[:year].to_i
    today = Date.today

    if @year < today.year
      p "Past years"
      queried_year = Date.new(@year)
      @upcoming_shows = Show.where( :date.gte => queried_year,
        :date.lt => queried_year.next_year )
    else
      p "Current years"
      @upcoming_shows = Show.where( :date.gte => today )
      @earlier_shows = Show.where( :date.lt => today,
        :date.gte => Date.new(today.year) )
    end
  end
end
