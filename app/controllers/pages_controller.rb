class PagesController < ApplicationController

  caches_page :home, :contact, :about

  def home
  	@title = 'Home'
    @next_show = Show.where( :date.gte => Date.today ).asc(:date).first()
    @index_news = Story.where( :date.gte => Date.today.prev_month(3) )
  end

  def contact
  	@title = 'Contact'
  end

  def about
  	@title = 'About'
  end

  def news
    @title = 'News'
    @all_news = Story.desc(:Date).all();
  end

  def shop
    @title = 'Shop'
  end

end
