Feature: View event calendar
  As a user
  In order to follow my favorite artist's events
  I want to be able to view a calendar of the upcoming events

  Scenario: View events for current month
    When I go to events page
    Then it shows me a calendar of the events