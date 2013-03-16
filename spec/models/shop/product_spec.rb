require 'spec_helper'

describe Shop::Product do
  subject { FactoryGirl.build(:product) }
  let(:no_name) { FactoryGirl.build(:product, :name => '') }
  let(:negative_price) { FactoryGirl.build(:product, price: Money.new(-550)) }
  let(:with_options) { FactoryGirl.create(:product_with_options) }

  it { should be_valid }

  specify { subject.options.should be_empty}

  it "should not accept zero length name" do
    no_name.should_not be_valid
  end

  it "should have a name" do
    Shop::Product.new.should_not be_valid
  end

  it "should not have negative price" do
    negative_price.should_not be_valid
  end

  specify { subject.categories.should be_empty }

  it "should normalize filename" do
    Shop::Product.any_instance.stub(:save_attached_files => true)
    Paperclip::Attachment.any_instance.stub(:post_process => true)
    FactoryGirl.create(:product_with_image).image_file_name.should eql("test_image_1.jpg")
  end

  specify { with_options.options.should_not be_empty }

  specify { with_options.options.first.values.should include('Red') }

  specify { subject.discount.should_not be_present}

  specify { subject.discounted_price.should eq subject.price }

  describe "discounted products" do
    it "should return discounted price" do
      discount = FactoryGirl.create(:discount, value: 10)
      subject.discount = discount
      subject.discounted_price.should eq(subject.price * 0.9)
    end
  end

end
