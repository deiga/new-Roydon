require 'spec_helper'

describe Shop::Category do
  before :each do
    @attr = { :name => 'Test category'}
    @product_attr = { :name => 'Test product', :price => '1.23'}
  end

  it "should create a new Shop::Category given valid attributes" do
    created = Shop::Category.create(@attr)
    created.should_not be_nil
  end

  it "should be empty" do
    all_categories = Shop::Category.all
    all_categories.should be_empty
  end

  it "should not accept zero length name" do
    no_name_category = Shop::Category.new(@attr.merge(:name => ''))
    no_name_category.should_not be_valid
  end

  it "should have a name" do
    no_name_category = Shop::Category.new
    no_name_category.should_not be_valid
  end

  it "should have zero top categories" do
    Shop::Category.top_categories.count.should be 0
  end

  it "should have a top category" do
    Shop::Category.create @attr
    Shop::Category.top_categories.count.should be 1
  end

  it "should generate permalink on create" do
    foo = Shop::Category.create @attr
    foo.permalink.should == foo.name.parameterize
  end

  it "should generate permalink on update" do
    foo = Shop::Category.create @attr
    foo.permalink.should == foo.name.parameterize
    foo.name = 'foo & bar'
    foo.save
    foo.permalink.should == foo.name.parameterize
  end

  describe "all products" do
    it "should return empty when no products available" do
      no_products_category = Shop::Category.create!(@attr)
      no_products_category.should_not have_children
      no_products_category.products.should be_empty
      no_products_category.all_products.should be_empty
    end

    it "should return 5 products when only top category has 5 products" do
      five_product_category = Shop::Category.create!(@attr)
      five_product_category.products.should be_empty
      5.times do
        five_product_category.products << Shop::Product.create!(@product_attr)
      end
      five_product_category.products.length.should be 5
      five_product_category.all_products.length.should be 5
    end
  end
end
