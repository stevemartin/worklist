When(/^I add another secion and save it$/) do
  click_button 'Add Job'
  all('section.job').count
  50.times do
    sleep 0.1 if ( all('section.job').count != 2)
  end
  all('section.job').count.should eq 2
  within(:xpath, all('section.job').last.path) { find('input.employer').set('Jimmy Joes') }
  click_button "Save"
end

Then(/^I should see my new section in the rendered version$/) do
  click_link "View"
  page.should have_content 'Jimmy Joes'
  # within(:xpath, all('section.job').last.path) { find('h2.employer').value.should == 'Jimmy Joes' }
end
