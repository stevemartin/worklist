Then(/^I should see the templates$/) do
  first('header.row input#title').value.should == "Workli.st"
end
