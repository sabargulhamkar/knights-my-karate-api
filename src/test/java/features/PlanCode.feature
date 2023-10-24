Feature: plan Code Testing
  Background: Setup test
    Given url "https://qa.insurance-api.tekschool-students.com"

Scenario: Validate /api/plans/get-all-plan-code
  Given path "/api/token"
  Given request {"username": "supervisor","password": "tek_supervisor"}
  When method post
  Then status 200
  And print response
  Given path "/api/plans/get-all-plan-code"
  And header Authorization = "Bearer " + response.token
  When method get
  Then status 200
  And print response
  And assert response[0].planExpired == false
  And assert response[1].planExpired == false
  And assert response[2].planExpired == false
  And assert response[3].planExpired == false



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



