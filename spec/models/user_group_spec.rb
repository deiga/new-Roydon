require 'spec_helper'

describe Mall::UserGroup do
  subject { Mall::UserGroup.new( name: 'test group')}
  it {should be_valid}
end
