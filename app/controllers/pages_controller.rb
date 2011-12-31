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
  	@shows = nil
  end

end
