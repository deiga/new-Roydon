class StoriesController < ApplicationController

  caches_action :index, cache_path: { tag: Story.cache_key }

  def index
    @title = t 'stories.title'
    @all_news = Story.active.desc(:Date).all
    # TODO: Add filtering by current language
  end

end
