require 'spec_helper'

describe Category do
  before :each do
    @attr = { :name => 'Test category'}
  end

  it "should create a new Category given valid attributes" do
    created = Category.create!(@attr)  
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

  it "should have replaced spaces with nbsps" do
    test_category = Category.create!(@attr)
    test_category.name.should include("nbsp")
  end

  it "name should have no whitespaces" do
    test_category = Category.create!(@attr)
    test_category.name.should_not match(/\s/)
  end
end
