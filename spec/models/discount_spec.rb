require 'spec_helper'

describe Mall::Discount do
  subject { Mall::Discount.new(name: 'Test Discount')}
  it { should be_valid }
end
