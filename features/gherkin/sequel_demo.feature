Feature: Results persistance

  Scenario: results will not be persisted if automation is successful
    Given the user navigates to the qa or highway speakers webpage
    Then the user validates the speaker Aaron Swerlein is present

  Scenario: results will be persisted in access when automation fails
    Given the user navigates to the qa or highway speakers webpage
    Then the user validates the speaker Kyle Swerlein is present