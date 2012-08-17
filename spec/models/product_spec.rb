require 'spec_helper'

describe Product do

  before :each do
    @attr = { :name => 'Test product'}
  end

  it "should create a new Product given valid attributes" do
    created = Product.create!(@attr)  
  end

  it "should be empty" do
    all_products = Product.all
    all_products.should be_empty
  end

  it "should not accept zero length name" do
    no_name_product = Product.new(@attr.merge(:name => ''))
    no_name_product.should_not be_valid
  end

  it "should have a name" do
    no_name_product = Product.new
    no_name_product.should_not be_valid
  end

  it "should not have negative price" do
    negative_price_product = Product.new(@attr.merge(:price => -5.5))
    negative_price_product.should_not be_valid
  end


  it "should have no categories" do
    no_categories_product = Product.new(@attr)
    no_categories_product.categories.should be_empty
  end

end
