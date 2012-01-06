class PagesController < ApplicationController
  def home
  	@title = 'Home'
    @nextShow = nil
    @news = nil
  end

  def contact
  	@title = 'Contact'
  end

  def about
  	@title = 'About'
  end

  def shows
  	@title = 'Shows'
    @year = params[:year].to_i
    today = Date.today
  	@earlier_shows = Show.all( :date.lt => today.to_mongo, 
      :date.gte => Date.new(today.year).to_mongo)
    
    if @year < today.year
      queried_year = Date.new(@year)
      @upcoming_shows = Show.all( :date.gte => queried_year.to_mongo, 
        :date.lt => queried_year.next_year.to_mongo)
    else
      @upcoming_shows = Show.all( :date.gte => today.to_mongo )
    end
  end

end
