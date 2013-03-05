require 'spec_helper'

describe Shop::Discount do
  subject { Shop::Discount.new(name: 'Test Discount')}
  it { should be_valid }
end
