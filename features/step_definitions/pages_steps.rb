Then /^(?:|the )"([^\"].*)" should be "([^\"].*)"$/ do |selector, expected|
  page.should have_selector(selector, :content => expected)
end
