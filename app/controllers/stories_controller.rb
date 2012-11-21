class StoriesController < ApplicationController

  caches_page :index

  def index
    @title = 'News'
    @all_news = Story.active.desc(:Date).all
    # TODO: Add filtering by current language
  end

end
