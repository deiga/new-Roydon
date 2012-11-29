require 'spec_helper'

describe Shop::Option do
  describe "validation" do
    it "should not allow empty values array" do
      empty_values = FactoryGirl.build(:option, :name => "Test", values: [])
      empty_values.should_not be_valid
    end

    it "should not allow empty names" do
      empty_name = FactoryGirl.build(:option, name: nil, :values => ["foo"])
      empty_name.should_not be_valid
    end

    it "should not allow 1 long names" do
      shortest_name = FactoryGirl.build(:option, :name => 'a', :values => ["foo"])
      shortest_name.should_not be_valid
    end

    it "should not allow 2 long names" do
      short_name = FactoryGirl.build(:option, :name => 'ab', :values => ["foo"])
      short_name.should_not be_valid
    end
    it "should allow creation" do
      opt = FactoryGirl.create(:option)
      opt.should be_valid
    end
  end
end
