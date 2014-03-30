@javascript
Feature: Registration
  As an employable person
  I want to sign up
  So I can create a CV

  @wip
  Scenario: User signs up
    Given I go to the homepage
    When I sign up
    Then I should be logged in
