require 'spec_helper'

describe Shop::ShoppingCart do

  before(:each) do
    @cart = Shop::ShoppingCart.create!
  end

  describe "calling empty" do
    it "should do nothing on an empty cart" do
      @cart.empty
      @cart.size.should be 0
    end

    it "should empty an non-empty cart" do
      @cart.add FactoryGirl.build(:product, price: Money.new(230), name: 'Test 22')
      @cart.size.should be 1
      @cart.empty
      @cart.size.should be 0
    end
  end

  describe "cart size" do
    it "should have size 0" do
      @cart.size.should be 0
    end

    it "should have size 1 after adding product" do
      prod = FactoryGirl.create(:product, price: Money.new(420), name: 'Test 19')
      @cart.add prod
      @cart.size.should be 1
    end

    it "should have size 2 after adding products" do
      @cart.add FactoryGirl.create(:product, price: Money.new(420), name: 'Test 20')
      @cart.size.should == 1
      @cart.add FactoryGirl.create(:product, price: Money.new(420), name: 'Test 21')
      @cart.size.should == 2
    end

    it "should have size 2 after incrementing product" do
      prod = FactoryGirl.create(:product, price: Money.new(420), name: 'Test 22')
      lambda {
        @cart.add prod
      }.should change(@cart, :size).by(1)
      lambda {
        @cart.items.first.inc(:quantity, 1)
      }.should change(@cart, :size).by(1)

    end

  end

  describe "item manipulation" do

    it "should have 1 less item after quantity 0" do

      lambda {
        @cart.add FactoryGirl.create(:product, price: Money.new(420), name: 'Test 23')
      }.should change(@cart, :size).by(1)
      lambda {
        @cart.add FactoryGirl.create(:product, price: Money.new(420), name: 'Test 24')
      }.should change(@cart, :size).by(1)
      @cart.items.first.quantity = 0
      @cart.size.should be 1
    end

    it "should have 2 items after incrementation" do
      lambda {
        @cart.add FactoryGirl.create(:product, price: Money.new(420), name: 'Test 25')
      }.should change(@cart, :size).by(1)
      @cart.items.first.quantity = 2
      @cart.size.should be 2
    end
  end

  describe "adding to cart" do
    it "should increment quantity if product already in cart w/o options" do
      prod = FactoryGirl.create(:product, price: Money.new(420), name: 'Test 26')
      @cart.add prod
      @cart.items.first.quantity.should == 1
      @cart.add prod
      @cart.reload.items.first.quantity.should == 2
    end

    it "should increment quantity if product already in cart w/ options" do
      prod = FactoryGirl.create(:product_with_options, price: Money.new(420), name: 'Test 27')
      opt_hash = {prod.options.first.name => prod.options.first.values.first}
      @cart.add prod, opt_hash
      @cart.items.first.quantity.should == 1
      @cart.add prod, opt_hash
      @cart.reload.items.first.quantity.should == 2
    end
  end

  describe "price calculation" do
    it "should have price 0 when empty" do
      @cart.should be_empty
      @cart.price.should eq Money.new(0)
    end

    it "should have correct price after adding product" do
      prod = FactoryGirl.create(:product_with_options, price: Money.new(420), name: 'Test 28')
      @cart.add prod
      @cart.price.should eq prod.price
    end

    it "should have correct price after adding 2 products" do
      prod = FactoryGirl.create(:product_with_options, price: Money.new(420), name: 'Test 28')
      @cart.add prod
      @cart.add prod
      @cart.reload.price.should eq prod.price*2
    end
  end

end
