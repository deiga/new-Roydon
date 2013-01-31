require 'spec_helper'

describe Shop::PriceModification do

  it "should create with default values" do
    pm = Shop::PriceModification.create!(name: 'Test1')
    pm.should be_valid
  end

  it "should not be valid with no name" do
    invalid_pm = Shop::PriceModification.new
    invalid_pm.should_not be_valid
  end

  it "should not be valid with nonnumerical value" do
    invalid_pm = Shop::PriceModification.create!(name: 'Test2', value: 'foo')
    invalid_pm.value.should == 0.0
    invalid_pm.should be_valid
  end

  describe "percentage values" do
    it "should be correct addition" do
      pm = Shop::PriceModification.create!(name: 'Test3', value: 23.0)
      pm.add_percentage.should == 1.23
    end
    it "should be correct subtraction" do
      pm = Shop::PriceModification.create!(name: 'Test3', value: 23.0)
      pm.subtract_percentage.should == 0.77
    end
  end
end
