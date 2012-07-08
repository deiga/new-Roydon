require 'spec_helper'

describe Option do
  describe "valiation" do
    it "should not allow empty values array" do
      empty_values = Option.new(:name => "Test")
      empty_values.should_not be_valid
    end

    it "should not allow empty names" do
      empty_name = Option.new(:values => ["foo"])
      empty_name.should_not be_valid
    end

    it "should not allow 1 long names" do
      shortest_name = Option.new(:name => 'a', :values => ["foo"])
      shortest_name.should_not be_valid
    end

    it "should not allow 2 long names" do
      short_name = Option.new(:name => 'ab', :values => ["foo"])
      short_name.should_not be_valid
    end
  end
end
