Feature: Completion Count Report
  As a User
  I want to see reports on the number of issues opened and closed
  So I can see trends on how the projects are doing

  Scenario: See link to the Completion Count report
    Given I am logged in as a user with permission to "run completion count"
    And I am on the system report overview page

    Then I should see "Reports"
    And I should see a link "Completion Report"

  Scenario: Open link to the Completion Count report
    Given I am logged in as a user with permission to "run completion count"
    And I am on the system report overview page

    When I follow "Completion Report"

    Then I am on the "completion count" page

  Scenario: Completion Count Report as normal user
    Given I am logged in as a User
    When I visit the "completion count" page
    Then I should be denied access

  Scenario: Completion Count Report as an anonymous user
    Given I am not logged in
    When I visit the "completion count" page
    Then I should go to the login page

  Scenario: Report form
    Given I am logged in as a user with permission to "run completion count"
    When I visit the "completion count" page

    Then I should see "Completion Report"
    And I should see "Start"
    And I should see "End date"
    And I should see "Users"

  Scenario: Run report
    Given I am logged in as a user with permission to "run completion count"
    When I visit the "completion count" page
    And I select some valid values for the report
    And I press "Apply"

    Then I see the totals
    And I see a subreport for each user
 