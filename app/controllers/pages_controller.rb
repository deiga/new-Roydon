class PagesController < ApplicationController

  caches_action :home, cache_path: proc { |c|
    show = Show.next_show
    { tag: show.updated_at.to_i }
  }
  caches_page :contact, :about

  def home
  	@title = 'Home'
    # TODO: Add filtering by current language
    @next_show = Show.next_show
    @index_news = Story.where( :date.gte => Date.today.prev_month(3) )
  end

  def contact
  	@title = 'Contact'
  end

  def about
  	@title = 'About'
  end

end
