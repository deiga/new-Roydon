require 'spec_helper'

describe TopCategory do
  before :each do
    @attr = { :name => 'Test top category'}
  end

  it "should create a new TopCategory given valid attributes" do
    created = TopCategory.create!(@attr)  
  end

  it "should be empty" do
    all_top_categories = TopCategory.all
    all_top_categories.should be_empty
  end

  it "should not accept zero length name" do
    no_name_top_category = TopCategory.new(@attr.merge(:name => ''))
    no_name_top_category.should_not be_valid
  end

  it "should have a name" do
    no_name_top_category = TopCategory.new
    no_name_top_category.should_not be_valid
  end
end
