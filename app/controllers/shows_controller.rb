class ShowsController < ApplicationController
  def index
    @title = 'Shows'
    @year = params[:year].to_i
    today = Date.today
    @earlier_shows = Show.where( :date.lt => today, 
          :date.gte => Date.new(today.year) )
    
    if @year < today.year
      queried_year = Date.new(@year)
      @upcoming_shows = Show.where( :date.gte => queried_year, 
              :date.lt => queried_year.next_year )
    else
      @upcoming_shows = Show.where( :date.gte => today )
    end
  end

end
