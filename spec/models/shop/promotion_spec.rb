require 'spec_helper'

describe Shop::Promotion do
  subject { Shop::Promotion.new(name: 'Test Promotion')}
  it { should be_valid }
end
