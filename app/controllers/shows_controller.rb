class ShowsController < ApplicationController

  caches_page :index
  
  def index
    @title = 'Shows'
    @year = params[:year].to_i
    today = Date.today
    
    if @year < today.year
      queried_year = Date.new(@year)
      @upcoming_shows = Show.where( :date.gte => queried_year, 
        :date.lt => queried_year.next_year )
    else
      @upcoming_shows = Show.where( :date.gte => today )
      @earlier_shows = Show.where( :date.lt => today, 
        :date.gte => Date.new(today.year) )
    end
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
