Given /^the following products exist:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |product|
    Shop::Product.create!(product)
  end
  Shop::Product.count.should == table.hashes.size
end
