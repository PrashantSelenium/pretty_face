Feature: pages that show details for features
  
  Background:
    When I run `cucumber fixtures --profile fixture`

  Scenario: Generate the pages
    Then the following files should exist:
    | results/basic.html    |
    | results/advanced.html |

  Scenario: Generating the basic html page from the erb
    Then the file "results/basic.html" should contain "DOCTYPE html PUBLIC"
    And the file "results/basic.html" should contain "<html xmlns='http://www.w3.org/1999/xhtml'>"
    And the file "results/basic.html" should contain "<head>"
    And the file "results/basic.html" should contain "<body"
    And the file "results/basic.html" should contain "<title>Feature Results</title>"

  Scenario: Including an image / logo
    Then the file "results/basic.html" should contain "<img src="
    And the file "results/basic.html" should contain "images/face.jpg"
    
  Scenario: It should show start time and duration in the header
    Then the file "results/basic.html" should contain "Feature started:"
    And the file "results/basic.html" should contain "Duration:"
    
  Scenario: Generating some basic stats from the erb
    Then the file "results/basic.html" should contain "<th>Executed<"
    And the file "results/basic.html" should contain "<th>Average<br/>Duration"
    And the file "results/basic.html" should contain "Scenarios"
    And the file "results/basic.html" should contain "Steps"

  Scenario: It should capture scenario and step statuses
    Then the file "results/basic.html" should contain "Passed"
    And the file "results/basic.html" should contain "Failed"
    And the file "results/basic.html" should contain "Pending"
    And the file "results/basic.html" should contain "Undefined"
    And the file "results/basic.html" should contain "Skipped"

  Scenario: It should display scenario names
    Then the file "results/basic.html" should contain "A passing scenario"
    And the file "results/advanced.html" should contain "A scenario outline"
    And the file "results/background.html" should contain "Another passing scenario"

  Scenario: It should display scenario steps
    Then the file "results/basic.html" should contain "it should say hello"
    And the file "results/background.html" should contain "it should say hello"
    And the file "results/advanced.html" should contain "I am using a scenario outline"

  Scenario: It should display the step and data for scenario outline steps
    Then the file "results/advanced.html" should contain "I use 'aaa'"
    And the file "results/advanced.html" should contain "I use 'bbb'"

  Scenario: It should display descriptions for features
    Then the file "results/basic.html" should contain "As a stakeholder"
    Then the file "results/basic.html" should contain "I want to see some details about this feature"
    Then the file "results/basic.html" should contain "So that I have some idea why this test matters"

  Scenario: It should display a nested table
    Then the file "results/advanced.html" should contain "<th>key1</th>"
    And the file "results/advanced.html" should contain "<th>key2</th>"
    And the file "results/advanced.html" should contain "<th>key3</th>"
    And the file "results/advanced.html" should contain "<td>value1</td>"
    And the file "results/advanced.html" should contain "<td>value2</td>"
    And the file "results/advanced.html" should contain "<td>value3</td>"
    
  Scenario: It should display errors for features
    Then the file "results/basic.html" should contain "RSpec::Expectations::ExpectationNotMetError"
    #Then the file "results/advanced.html" should contain "RSpec::Expectations::ExpectationNotMetError"
    Then the file "results/failing_background.html" should contain "RSpec::Expectations::ExpectationNotMetError
