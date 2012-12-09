class PagesController < ApplicationController

  before_filter :set_title

  def home
    # TODO: Add filtering by current language
    @next_show = Show.next_show
    @index_news = Story.active.where( :date.gte => Date.today.prev_month(3) )
  end

  def contact
  end

  def about
  end

  private

    def set_title
      @title = t "pages.#{params[:action]}"
    end

end
