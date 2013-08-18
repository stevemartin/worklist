Given(/^I go to the homepage$/) do
  visit root_url
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
  editable = first('[wl-editable]')
  binding.pry
  editable.click
  fill_in editable['id'], :with => 'New text'
end

Then(/^I should be able to save it and register$/) do
    pending # express the regexp above with the code you wish you had
end
