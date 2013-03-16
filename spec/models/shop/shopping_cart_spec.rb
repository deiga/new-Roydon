require 'spec_helper'

describe Shop::ShoppingCart do

  subject { FactoryGirl.create(:cart) }
  let(:product) { FactoryGirl.build(:product, price: Money.new(230), name: 'Test 1') }
  let(:product2) { FactoryGirl.build(:product, price: Money.new(420), name: 'Test 2') }
  let(:product_with_options) { FactoryGirl.build(:product_with_options, price: Money.new(420), name: 'Test 3') }
  it { should be_valid }

  it { should be_empty }

  it "should empty an non-empty cart" do
    subject.add product
    subject.size.should eq 1
  end

  describe "cart size" do
    it "should have size 2 after adding products" do
      subject.add product
      subject.add product2
      subject.size.should eq 2
    end

    it "should have size 2 after incrementing product" do
      subject.add product
      subject.add product
      subject.size.should eq 2
      subject.items.count.should eq 1
    end
  end

  describe "item manipulation" do

    it "should have 1 less item after quantity 0" do
      subject.add product
      subject.add product2
      subject.items.first.quantity = 0
      subject.size.should be 1
    end

    it "should have 2 items after incrementation" do
      subject.add product
      subject.items.first.quantity = 2
      subject.size.should be 2
    end

    it "should have 2 items after incrementation" do
      subject.add product
      subject.items.first.inc(:quantity, 1)
      subject.size.should be 2
    end
  end

  describe "adding to cart" do
    it "should increment quantity if product already in cart w/o options" do
      subject.add product
      subject.add product
      subject.items.first.quantity.should eq 2
    end

    it "should increment quantity if product already in cart w/ options" do
      opt_hash = {product_with_options.options.first.name => product_with_options.options.first.values.first}
      subject.add product_with_options, opt_hash
      subject.add product_with_options, opt_hash
      subject.items.first.quantity.should eq 2
    end
  end

  describe "price calculation" do
    it { subject.price.should eq Money.new(0) }

    it "should have correct price after adding product" do
      subject.add product
      subject.price.should eq product.price
    end

    it "should have correct price after adding 2 products" do
      subject.add product
      subject.add product
      subject.price.should eq product.price*2
    end
  end

end
