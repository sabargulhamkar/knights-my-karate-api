Feature: End to end account creation

  Background: Setup test
    Given url "https://qa.insurance-api.tekschool-students.com"
    * def token = "Bearer " + tokenResult.response.token

  Scenario: Create Account end to end
    Given path "/api/accounts/add-primary-account"
    * def data = java.type('data.DataGenerator')
    * def emailData = data.getEmail()
    And request
    """
    {
  "email": "emailData",
  "firstName": "Same",
  "lastName": "Sam",
  "title": "Mr.",
  "gender": "MALE",
  "maritalStatus": "MARRIED",
  "employmentStatus": "student",
  "dateOfBirth": "1993-10-23"
  "new": true
}
    """
    And header Authorization = token
    When method post
    Then status 201
    And print response

