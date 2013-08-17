Feature: Registration
  As an employable person
  I want to sign up
  So I can create a CV

  Scenario: User signs up
    Given I go to the home page
    When I sign up
    Then I should be logged in
