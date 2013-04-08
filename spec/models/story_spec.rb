require 'spec_helper'

describe Story do

  subject { FactoryGirl.build(:invalid_story) }

  it { should_not be_valid }

  context "Valid story" do
    subject { FactoryGirl.build(:story) }
    it { should be_valid }

    describe "Format date" do
      it { subject.format_date.should eq Time.parse(Date.today.to_s).strftime('%d.%m.%Y') }
    end
  end
end
