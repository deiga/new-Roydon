require 'spec_helper'

describe Shop::ShopHelper do
  include Rails.application.routes.url_helpers

  it "should make correct link for test category" do
    test_category = FactoryGirl.create(:category)
    category_link(test_category).should eq link_to(raw(test_category.name.gsub(/\s/, '&nbsp;')), category_shop_products_path(test_category), id: test_category.permalink)
  end
end
