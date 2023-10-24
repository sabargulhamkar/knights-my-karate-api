Feature: Create primary account
  Background: Create account tests
    Given url "https://qa.insurance-api.tekschool-students.com"

  Scenario: Create with existing email /api/accounts/add-primary-account validate response
    Given path "/api/accounts/add-primary-account/"
    And request
    """
    {
    "email": "sabar.hamkar222@tekschool.us",
    "title": "Mr.",
    "firstName": "sabar",
    "lastName": "hamkar",
    "gender": "MALE",
    "maritalStatus": "MARRIED",
    "employmentStatus": "student",
    "dateOfBirth": -27523584000000
}
    """
    When method post
    And print response
    Then status 400
    And print response
    And assert response.errorMessage == "Account with email sabar.hamkar222@tekschool.us is exist"

