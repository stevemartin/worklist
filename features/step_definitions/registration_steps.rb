Given(/^I go to the home page$/) do
  visit root_url
end

When(/^I sign up$/) do
    fill_in 'Email', :with => 'test@email.com'
    fill_in "Password", :with => 'TestPass123'
    fill_in "Password confirmation", :with => 'TestPass123'
    click_button 'Sign up'
end

Then(/^I should be logged in$/) do
  page.should have_content "Welcome!"
end
