@javascript @blackbox
Feature: Inline homepage signup
  As an unregistered user
  I to use the product straight away
  So I can try it out without registering

  Background:
    Given I go to the homepage

  Scenario: User creates worklist and account from homepage
    When I edit the homepage CV
    And I save it and register
    Then I should be logged in
    And the worklist should be persisted when I reload the page
    And I should be able to sign out

  Scenario: User creates a worklist but doesn't register
    When I edit the homepage CV
    And I save my changes
    Then the worklist should be persisted when I reload the page

  Scenario: Users signs up without creating worklist from homepage
    When I sign up
    Then I should be logged in
    And I should see an empty worklist

  @wip
  Scenario: User with existing worklist signs in
    Given I have a worklist already in the session
    When I register
    Then I see my existing worklist

