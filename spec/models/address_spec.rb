require 'spec_helper'

describe Address do

  subject(:valid) { FactoryGirl.build(:address) }

  it { valid.should be_valid }

  describe "Phone number validations" do

    subject(:no_phone) { FactoryGirl.build(:address, phone_number: number) }

    context "empty number" do
      let(:number) { "" }
      it { should_not be_valid }
    end

    context "short phone number" do
      let(:number) { "12345" }
      it { should_not be_valid }
    end

    context "valid number" do
      let(:number) { "0445655606" }
      it { should be_valid }
    end

    context "long-form valid number" do
      let(:number) { "00358445655606" }
      it { should be_valid }
    end

    context "valid landline number" do
      let(:number) { "09123456" }
      it { should be_valid }
    end

    context "german prefix" do
      let(:number) { "+49123456" }
      it { should_not be_valid }
    end

  end

  describe "Before filters" do
    it "should set name if empty" do
      valid.name.should be_blank
      valid.save
      valid.name.should eq valid.street
    end

    it "should leave name if set" do
      valid.name = 'Foo'
      valid.save
      valid.name.should eq 'Foo'
    end
  end
end
