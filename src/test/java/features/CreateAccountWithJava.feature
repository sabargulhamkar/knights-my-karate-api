Feature: Create Account with Random Email using java

  Background: Setup test
    Given url "https://qa.insurance-api.tekschool-students.com"


  Scenario: Create valid account /api/accounts/add-primary-account
    Given path "/api/accounts/add-primary-account/"
    * def dataGenerator = Java.type('data.DataGenerator')
    * def autoEmail = dataGenerator.getEmail();
    And request
    """
    {
    "email": "#(autoEmail)",
    "title": "Mr.",
    "firstName": "sabar",
    "lastName": "hamkar",
    "gender": "MALE",
    "maritalStatus": "SINGLE",
    "employmentStatus": "Software Engineer",
    "dateOfBirth": "1989-10-10"
}
    """
    When method post
    Then print response
    Then status 201
    Then assert response.email == autoEmail
