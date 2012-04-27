class StoriesController < ApplicationController
  def index
    @title = 'News'
    @all_news = Story.desc(:Date).all()
    # TODO: Add filtering by current language
  end

end
