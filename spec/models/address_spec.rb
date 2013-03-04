require 'spec_helper'

describe Address do

  subject { FactoryGirl.build(:address) }

  it { should be_valid }

  describe "Phone number validations" do

    it "should not be valid with empty phone number" do
      subject.phone_number = ""
      subject.should_not be_valid
    end

    it "should not be valid with short phone number" do
      subject.phone_number = "12345"
      subject.should_not be_valid
    end

    it "should be valid with valid number" do
      subject.should be_valid
    end

    it "should be valid with long-form valid number" do
      subject.phone_number = "00358445655606"
      subject.should be_valid
    end

    it "should be valid with valid landline number" do
      subject.phone_number = "09123456"
      subject.should be_valid
    end
    it "should not be valid with german prefix number" do
      subject.phone_number = "+49123456"
      subject.should_not be_valid
    end
  end

  describe "Before filters" do
    it "should set name if empty" do
      subject.save
      subject.name.should eq subject.street
    end

    it "should leave name if set" do
      subject.name = 'Foo'
      subject.save
      subject.name.should eq 'Foo'
    end
  end
end
