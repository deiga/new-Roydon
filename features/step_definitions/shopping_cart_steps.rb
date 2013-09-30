Given /^the following products are in the cart:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |product|
    within("#product-#{product['name'].parameterize}") do
      click_on('Lisää ostoskoriin')
    end
  end
end

When /^I add "(.*?)" to shopping cart$/ do |product_name|
  within("#product-#{product_name.parameterize}") do
    click_on('Lisää ostoskoriin')
  end
end
