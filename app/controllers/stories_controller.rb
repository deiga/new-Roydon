class StoriesController < ApplicationController

  respond_to :html

  def index
    @all_news = Story.active.desc(:Date)
    # TODO: Add filtering by current language
    if stale? @all_news.first
      @title = t 'stories.title'
      respond_with @all_news
    end
  end

end
