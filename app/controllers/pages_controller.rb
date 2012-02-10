class PagesController < ApplicationController
  def home
  	@title = 'Home'
    @next_show = Show.desc(:date).first()
    @index_news = Story.where( :date.gte => Date.today.prev_month(3) )
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

  def news
    @title = 'News'
    @all_news = Story.desc(:Date).all();
  end

end
