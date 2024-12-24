@RetrieveUserId
Feature: Return userId by email and password

  Background:
    * url URL_USER
    * def subDirectory = 'login/'
    * def duration = Java.type('util.waitUtil')
   
  @ignore  
  @GETUserIdSuccess
  Scenario: Base endpoint to call get userId by email and password with success login
    Given path subDirectory + 'email=' + email + '&' + 'password=' + password
    When method Get
    Then status 200  

  @ignore  
  @GETUserIdFailure
  Scenario: Base endpoint to call failed login due to userId not found
    Given path subDirectory + 'email=' + email + '&' + 'password=' + password
    When method Get
    Then status 404      

  @VerifyUserIdSuccess  
  Scenario: Verify user login successful with userId retrieved with correct username and password
    * def email = 'gmatignon0@multiply.com'
    * def password = 'password123'
    When call read('this:get-userId.feature@GETUserIdSuccess')
    And match response == '"988b8117-bc4b-11ef-8a2c-0242ac120003"'
    * duration.waitTime(5000)

  # @parallel=false   
  @VerifyUserIdFailure 
  Scenario Outline: Verify user login unsuccessful and userId not found with <scenario>
    * def email = "<email>"
    * def password = "<password>"
    When call read('this:get-userId.feature@GETUserIdFailure')        
    And match response == 'Login Failed! Please Retry.'    
    Examples:
    |Scenario                        |email                   |password   |
    |incorrect username              |gmatignon@multiply.com  |password123|
    |incorrect password              |gmatignon0@multiply.com |password12 |
    |incorrect username and password |gmatignon@multiply.com  |password12 |