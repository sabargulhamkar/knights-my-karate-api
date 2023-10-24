Feature: Create Account Testing

  Background: Setup test
    Given url "https://qa.insurance-api.tekschool-students.com"
    * def tokenResult = callonce read('GenerateToken.feature')
    * def token = "Bearer " + tokenResult.response.token

    Scenario: Create Valid account
      Given path "/api/accounts/add-primary-account"
      And request
      """
      {
    "email": "sabar.hamkar44455@tekschool.us",
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
      And print response
      Then status 201
      And assert response.email == "sabar.hamkar44455@tekschool.us"
      * def createdAccountId = response.id
      Given path "/api/accounts/delete-account"
      And param primaryPersonId = createdAccountId
      And header Authorization = token
      When method delete
      Then status 200
      And print response
      And match response contains {"message" : "Account Successfully deleted" , "status" : true}



