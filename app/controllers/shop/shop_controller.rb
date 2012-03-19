class Shop::ShopController < ApplicationController
  def home
    @top_categories = TopCategory.where(:passive => false)
  end

end
