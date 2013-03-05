require 'spec_helper'

describe Shop::UserGroup do
  subject { Shop::UserGroup.new( name: 'test group')}
  it {should be_valid}
end
