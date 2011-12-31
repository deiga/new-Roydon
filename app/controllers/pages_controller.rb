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
  	@earlier_shows = Show.all( :date.lt => Date.today.to_mongo )
    @upcoming_shows = Show.all( :date.gte => Date.today.to_mongo )
  end

end
