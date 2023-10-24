Feature: Create Account with Random Email using java

  Background: Setup tests
    Given url "https://qa.insurance-api.tekschool-students.com"

  Scenario: Create valid account /api/accounts/add-primary-account
    Given path "/api/accounts/add-primary-account/"