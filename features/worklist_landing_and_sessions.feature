@javascript @blackbox
Feature: Inline homepage signup
  As an unregistered user
  I want to use my worklist straight away
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

  Scenario: Site user with temporary worklist signs up
    Given I have a worklist already in the session
    When I register
    Then I see my existing worklist

  Scenario: Users signs up without creating worklist from homepage then signs in again
    When I sign up
    Then I should be logged in
    And I should see an empty worklist
    And I should be able to sign out
    And when I sign in again I should see the default

  Scenario: User creates worklist then signs in again
    When I edit the homepage CV
    And I save it and register
    Then I should be logged in
    And I should be able to sign out
    And when I sign in again I should see my worklist

  @wip
  Scenario: User attempts to sign in with invalid credentials
    Given I attempt to sign in with invalid credentials
    Then I should see a notice telling me that it failed
