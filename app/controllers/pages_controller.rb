class PagesController < ApplicationController

  caches_page :index, :contact, :about

  def home
  	@title = 'Home'
    # TODO: Add filtering by current language
    @next_show = Show.asc(:date).where( :date.gte => Date.today ).first()
    @index_news = Story.where( :date.gte => Date.today.prev_month(3) )
  end

  def contact
  	@title = 'Contact'
  end

  def about
  	@title = 'About'
  end

end
