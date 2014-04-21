Given(/^I go to the homepage$/) do
  visit '/'
end

When(/^I sign up$/) do
    fill_in 'Email', :with => 'test@email.com'
    fill_in "Password", :with => 'TestPass123'
    fill_in "Password confirmation", :with => 'TestPass123'
    click_button 'Sign up'
end

Then(/^I should be logged in$/) do
  page.should have_content "Worklist"
end

When(/^I edit the homepage CV$/) do
  editable = first('input#title')
  editable.click
  fill_in editable['id'], :with => 'Bugs Bunny'
end

Then(/^I should be able to save it and register$/) do
  click_button "Save"
  fill_in 'signin-email', :with => "bugs.bunny@testdomaintest.cam"
  fill_in 'signin-password', :with => "SomecoolPass123"
  click_button "Sign Up"
end

Then(/^I should be logged in$/) do
  binding.pry
  page.should have_content "Sign out"
end
