When(/^I add another section and save it$/) do
  click_button 'Add Job'
  all('section.job').count
  50.times do
    sleep 0.1 if ( all('section.job').count != 2)
  end
  all('section.job').count.should eq( 2 )
  within(:xpath, all('section.job').last.path) { find('input.employer').set('Jimmy Joes') }
  click_button "Save"
end

Then(/^I should see my new section in the rendered version$/) do
  click_link "View"
  page.should have_content 'Jimmy Joes'
end

Then(/^I should be able to remove it$/) do
  within(:xpath, all('section.job').last.path) { first(:xpath, '//a[text()="Remove"]').click }
  click_button "Save"
  click_link "View"
  page.should_not have_content 'Jimmy Joes'
end
