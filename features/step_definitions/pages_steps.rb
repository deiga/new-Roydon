Then /^(?:|the )title should be "([^\"].*)"$/ do |expected|
  page.should have_selector('title')
  page.find('title').native.text.should == expected
end

Then /^(?:|the )"([^\"].*)" should be "([^\"].*)"$/ do |selector, expected|
  page.should have_selector(selector)
  page.should have_selector(selector, :text => expected)
end
