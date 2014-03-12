require 'spec_helper'

describe Mall::Promotion do
  subject { Mall::Promotion.new(name: 'Test Promotion')}
  it { should be_valid }
end
