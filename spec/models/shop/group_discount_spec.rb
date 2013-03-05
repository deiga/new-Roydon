require 'spec_helper'

describe Shop::GroupDiscount do
  subject { Shop::GroupDiscount.new(name: 'Test grpDiscount')}
  it {should be_valid}
end
