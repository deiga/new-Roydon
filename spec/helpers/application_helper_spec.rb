require 'spec_helper'

describe ApplicationHelper do

  it { display_title.should eq 'Roydon' }

  it "should display set title" do
    @title = 'Foo'
    display_title.should eq 'Foo | Roydon'
  end

end
