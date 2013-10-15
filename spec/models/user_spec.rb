require 'spec_helper'

describe User do

  subject(:user) { FactoryGirl.build(:user) }

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

  describe "formatting methods" do
    it "should display email when no first name" do
      user.first_name = ''
      user.display_name.should eq user.email
    end

    it { user.name.should eq "#{user.first_name} #{user.last_name}" }
  end

  describe "callbacks" do
    it "should set password to random if empty" do
      user.should_receive(:set_random_password).and_call_original
      user.password = ''
      user.save!
      user.password.should_not be_blank
    end
  end

end
