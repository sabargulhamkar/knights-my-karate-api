Feature: Generate Token Feature

  Background: Setup test
    Given url "https://qa.insurance-api.tekschool-students.com"

  Scenario: Generate valid token
    Given path "/api/token"
    Given request {"username" : "supervisor", "password" : "tek_supervisor"}
    When method post
    Then status 200
    And print response
