class PagesController < ApplicationController

  before_filter :set_title

  def home
    # TODO: Add filtering by current language
    @next_show = Show.first_upcoming
    @index_news = Story.newest
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
