Feature: Security Token API calls

  Scenario: Send request to /api/token
    Given url "https://qa.insurance-api.tekschool-students.com"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200


    #Activity, try user story 2)


  Scenario: Send request to /api/token with wrong username
    Given url "https://qa.insurance-api.tekschool-students.com"
    And path "/api/token"
    And request
    """
    {
    "username" : "WrongUsername",
    "password": "tek_supervisor"
    }
    """

    When method post
    And print response
    Then status 404

    And assert response.httpStatus == "NOT_FOUND"
    And assert response.errorMessage == "User WrongUsername not found"

    Example
