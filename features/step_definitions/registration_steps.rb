@username = 'bugs.bunny@testdomaintest.cam'
@password =  "SomecoolPass123"

Given(/^I go to the homepage$/) do
  visit '/'
end

When(/^I sign up$/) do
  click_button 'Register'
  fill_in 'signup-email', :with => "bugs.bunny@testdomaintest.cam"
  fill_in 'signup-password', :with => "SomecoolPass123"
  click_button "Sign Up"
end

# Then(/^I should be logged in$/) do
#   page.should have_content "Worklist"
# end

When(/^I edit the homepage CV$/) do
  title = find('input#title')
  50.times do
    sleep 0.1 if (title.value != "Workli.st")
  end
  title.value.should eq("Workli.st")
  title.click
  fill_in title['id'], :with => 'Bugs Bunny'
end

Then(/^I save it and register$/) do
  page.should_not have_content "Sign out"
  click_button "Save"
  fill_in 'signup-email', :with => "bugs.bunny@testdomaintest.cam"
  fill_in 'signup-password', :with => "SomecoolPass123"
  click_button "Sign Up"
end

Then(/^I save my changes/) do
  page.should_not have_content "Sign Out"
  click_button "Save"
  find('.close').click
end

Then(/^I should be logged in$/) do
  page.should have_content "Sign Out"
  page.should_not have_content "Sign In"
end

Then(/^the worklist should be persisted when I reload the page$/) do
  visit '/'
  title = find('input#title')
  50.times do
     sleep 0.1 if (title.value != "Bugs Bunny")
  end
  title.value.should eq("Bugs Bunny")
end

Then(/^I should be able to sign out$/) do
  click_button "Sign Out"
  page.should_not have_content "Sign Out"
  page.should have_content "Sign In"
end

Given(/^I have a worklist already in the session$/) do
  step "I edit the homepage CV"
  step "I save my changes"
end

When(/^I register$/) do
  step "I sign up"
end

Then(/^I see my existing worklist$/) do
  step "the worklist should be persisted when I reload the page"
end

Then(/^I should see an empty worklist$/) do
  title = find('input#title')
  50.times do
    sleep 0.1 if (title.value != "Workli.st")
  end
  title.value.should eq("Workli.st")
end

Then(/^I sign in$/) do
  click_button 'Sign In'
  fill_in 'signin-email', :with => "bugs.bunny@testdomaintest.cam"
  fill_in 'signin-password', :with => "SomecoolPass123"
  within '.modal-footer' do
    click_button "Sign In"
  end
  page.should have_content "Sign Out"
  page.should_not have_content "Sign In"
end

Then(/^when I sign in again I should see a notice telling me$/) do
  step 'I sign in'
end

Then(/^when I sign in again I should see my worklist$/) do
  step 'I sign in'
  title = find('input#title')
  50.times do
     sleep 0.1 if (title.value != "Bugs Bunny")
  end
  title.value.should eq("Bugs Bunny")
end

Given(/^I attempt to sign in with invalid credentials$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a notice telling me that it failed$/) do
  pending # express the regexp above with the code you wish you had
end
