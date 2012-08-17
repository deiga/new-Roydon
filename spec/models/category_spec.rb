require 'spec_helper'

describe Category do
  before :each do
    @attr = { :name => 'Test category'}
    @product_attr = { :name => 'Test product', :price => '1.23'}
  end

  it "should create a new Category given valid attributes" do
    created = Category.create(@attr)  
    created.should_not be_nil
  end

  it "should be empty" do
    all_categories = Category.all
    all_categories.should be_empty
  end

  it "should not accept zero length name" do
    no_name_category = Category.new(@attr.merge(:name => ''))
    no_name_category.should_not be_valid
  end

  it "should have a name" do
    no_name_category = Category.new
    no_name_category.should_not be_valid
  end

  it "should have zero top categories" do
    Category.top_category_ids.count.should be 0
  end

  it "should have a top category" do
    Category.create @attr
    Category.top_category_ids.count.should be 1
  end

  describe "all products" do
    it "should return empty when no products available" do
      no_products_category = Category.create!(@attr)
      no_products_category.should_not have_children
      no_products_category.products.should be_empty
      no_products_category.all_products.should be_empty
    end

    it "should return 5 products when only top category has 5 products" do
      five_product_category = Category.create!(@attr)
      five_product_category.products.should be_empty
      5.times do
        five_product_category.products <<  Product.create!(@product_attr)
      end
      five_product_category.products.length.should be 5
      five_product_category.all_products.length.should be 5
    end
  end
end
