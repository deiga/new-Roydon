require 'spec_helper'

describe User do

  subject { FactoryGirl.build(:user) }

  it { should be_valid }

  describe "dependencies" do
    it "should add addresses" do
      subject.addresses.should be_empty
      subject.addresses << FactoryGirl.build(:address)
      subject.addresses.should_not be_empty
    end

    it "should add orders" do
      subject.orders.should be_empty
      subject.orders << FactoryGirl.build(:order)
      subject.orders.should_not be_empty
    end
  end

  describe "admin" do
    let(:admin) { FactoryGirl.build(:admin) }
    it "should be admin" do
      admin.should be_admin
    end
  end

end
