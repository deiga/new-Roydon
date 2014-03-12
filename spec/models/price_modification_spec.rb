require 'spec_helper'

describe Mall::PriceModification do

  it "should create with default values" do
    subject.name = 'Test1'
    subject.should be_valid
  end

  it "should not be valid with no name" do
    subject.should_not be_valid
  end

  it "should not be valid with nonnumerical value" do
    invalid_pm = Mall::PriceModification.new(name: 'Test2', value: 'foo')
    invalid_pm.should_not be_valid
  end

  describe "percentage values" do
    it "should be correct addition" do
      subject.name = 'Test3'
      subject.value = 23.0
      subject.add_percentage.should == 1.23
    end
    it "should be correct subtraction" do
      subject.name = 'Test4'
      subject.value = 23.0
      subject.subtract_percentage.should == 0.77
    end
  end
end
