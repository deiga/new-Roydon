require 'spec_helper'

describe Shop::GroupDiscount do
  subject { FactoryGirl.build(:group_discount)}
  it {should be_valid}
end
