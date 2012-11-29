require 'spec_helper'

describe Shop::ShoppingCart do

  describe "calling empty" do
    it "should do nothing on an empty cart" do
      empty_shopping_cart = Shop::ShoppingCart.create!
      empty_shopping_cart.empty
      empty_shopping_cart.size.should be 0
    end

    it "should empty an non-empty cart" do
      cart = Shop::ShoppingCart.create!
      cart.add FactoryGirl.build(:product, price: Money.new(230), name: 'Test 22')
      cart.size.should be 1
      cart.empty
      cart.size.should be 0
    end
  end

  describe "cart size" do
    it "should have size 0" do
      cart = Shop::ShoppingCart.create!
      cart.size.should be 0
    end

    it "should have size 1 after adding product" do
      cart = Shop::ShoppingCart.create!
      prod = FactoryGirl.create(:product, price: Money.new(420), name: 'Test 19')
      cart.add prod
      cart.size.should be 1
    end

    it "should have size 2 after adding products" do
      cart = Shop::ShoppingCart.create!
      cart.add FactoryGirl.create(:product, price: Money.new(420), name: 'Test 20')
      cart.size.should == 1
      cart.add FactoryGirl.create(:product, price: Money.new(420), name: 'Test 21')
      cart.size.should == 2
    end

    it "should have size 2 after incrementing product" do
      cart = Shop::ShoppingCart.create!
      prod = FactoryGirl.create(:product, price: Money.new(420), name: 'Test 22')
      cart.add prod
      cart.size.should be 1
      cart.items.first.inc(:quantity, 1)
      cart.size.should be 2
    end

  end

  describe "item manipulation" do

    it "should have 1 less item after quantity 0" do
      cart = Shop::ShoppingCart.create!
      cart.add FactoryGirl.create(:product, price: Money.new(420), name: 'Test 23')
      cart.size.should be 1
      cart.add FactoryGirl.create(:product, price: Money.new(420), name: 'Test 24')
      cart.size.should be 2
      cart.items.first.quantity = 0
      cart.size.should be 1
    end

    it "should have 2 items after incrementation" do
      cart = Shop::ShoppingCart.create!
      cart.add FactoryGirl.build(:product, price: Money.new(420), name: 'Test 25')
      cart.size.should be 1
      cart.items.first.quantity = 2
      cart.size.should be 2
    end
  end

  describe "adding to cart" do
    it "should increment quantity if product already in cart w/o options" do
      cart = Shop::ShoppingCart.create!
      prod = FactoryGirl.create(:product, price: Money.new(420), name: 'Test 26')
      cart.add prod
      cart.items.first.quantity.should == 1
      cart.add prod
      cart = Shop::ShoppingCart.find(cart) # Reload cart
      cart.items.first.quantity.should == 2
    end

    it "should increment quantity if product already in cart w/ options" do
      cart = Shop::ShoppingCart.create!
      prod = FactoryGirl.create(:product_with_options, price: Money.new(420), name: 'Test 27')
      opt_hash = {prod.options.first.name => prod.options.first.values.first}
      cart.add prod, opt_hash
      cart.items.first.quantity.should == 1
      cart.add prod, opt_hash
      cart = Shop::ShoppingCart.find(cart) # Reload cart
      cart.items.first.quantity.should == 2
    end
  end

end
