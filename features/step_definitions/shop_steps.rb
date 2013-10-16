Given /^the following products exist:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |product|
    Shop::Product.create!(product)
  end
  Shop::Product.count.should eq table.hashes.size
end

Given(/^there are no products$/) do
  Shop::Product.count.should eq 0
end

Then(/^There are no products$/) do
  page.all('.product').count.should eq 0
end

Given(/^there are (\d+) products$/) do |number|
  number = number.to_i
  1.upto(number) { FactoryGirl.create(:product) }
  Shop::Product.count.should eq number
end

Then(/^There are (\d+) products$/) do |number|
  page.all('.product').count.should eq number.to_i
end

Given(/^the shopping cart is empty$/) do
  page.should have_content "Ei tuotteita"
end

Then(/^fill in the order form$/) do
  fill_in 'Email', with: 'test@tester.com'
  fill_in 'Street', with: 'Testikatu 1'
  fill_in 'City', with: 'Helsinki'
  fill_in 'Postal number', with: '00100'
  fill_in 'Country', with: 'Finland'
  fill_in 'Phone number', with: '0123456789'
  select 'Cash', from: Shop::Order.human_attribute_name('payment')
end
