class StoriesController < ApplicationController

  def index
    @title = t 'stories.title'
    @all_news = Story.active.desc(:Date).all
    # TODO: Add filtering by current language
  end

end
