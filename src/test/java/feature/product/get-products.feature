@RetrieveProducts
Feature: Return all products

  Background:
    * url URL_PRODUCT
    * def subDirectory = 'products'
   
  @ignore  
  @GETProductSuccess
  Scenario: Base endpoint to call get products
    Given path subDirectory 
    When method Get
    Then status 200  

  @VerifyFirstProductSuccess  
  Scenario: Verify product returned when call get endpoint
    When call read('this:get-products.feature@GETProductSuccess')
    And match response[0].productId == '3d49b7f3-47b2-11ee-9d72-0242ac150002'
    And match response[0].productName == 'Flamingo print pillow case'
    And match response[0].productShortDesc == 'Flamingo Print premium-grade, soft, and breathable'
    And match response[0].productLongDesc == 'This exquisite pillowcase is designed to elevate the look of your bedding ensemble while providing ultimate comfort and support for a restful night sleep.Crafted from premium-grade, soft, and breathable fabric.'
    And match response[0].productMake == 'Durable and Long-Lasting: This pillowcase is made to withstand regular use and retain its vibrant colors and patterns even after numerous washes.'
    And match response[0].quantity == '#number'
    And match response[0].quantityAvail == '#number'
    And match response[0].originalPrice == '15.00'    
    And match response[0].discountPrice == '#string'  
    And match response[0].discount == '#number'   
    And match response[0].productImage == 'http://localhost:3008/flamingo_pillow.jpeg'         
    And match response[0].productCategory == 'Bedding'  
    And match response[0].createdDate == '2023-08-31T03:55:35.000Z'           
    And match response[0].updatedDate == '#string'           
 
  @VerifySecondProductSuccess  
  Scenario: Verify product returned when call get endpoint
    When call read('this:get-products.feature@GETProductSuccess')
    And match response[1] contains read('this:properties/secondProduct.json') 