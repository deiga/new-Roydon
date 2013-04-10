When(/^I am on the (.*) page$/) do |page_name|
  visit send(page_name.split(/\s+/).push('path').join('_').to_sym)
end

Then(/^I should see "(.*?)" in the title$/) do |expected|
  page.should have_title(expected)
end

Then(/^I should see "(.*?)" in the selector "(.*?)"$/) do |expected, selector|
  page.should have_selector selector, text: expected
end

Then /^show me the page$/ do
  save_and_open_page
end
