@javascript
Feature: Inline homepage signup
  As an unregistered user
  I to use the product straight away
  So I can try it out without registering

  @javascript @blackbox
  Scenario: User edits homepage CV
    Given I go to the homepage
    When I edit the homepage CV
    And I should be able to save it and register
    Then I should be logged in
    And the worklist should be persisted when I reload the page
    And I should be able to sign out
