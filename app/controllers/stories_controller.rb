class StoriesController < ApplicationController
  def index
    @title = 'News'
    @all_news = Story.desc(:Date).all();
  end

end
