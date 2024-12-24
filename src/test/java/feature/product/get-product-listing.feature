@RetrieveProductListing
Feature: Return product listing

  Background:
    * url URL_PRODUCT
    * def subDirectory = 'listing/all'
   
  @ignore  
  @GETProductListingSuccess
  Scenario: Base endpoint to call get products
    Given path subDirectory 
    # And params {page: '#(pageNumb)',limit: '#(limitCount)',sort: '#(sort)',search: '#(search)',category: '#(category)'}
    And params queryDetail
    When method Get
    Then status 200  

  @VerifyProductListingtSuccess  
  Scenario: Verify product returned correct product
    # * def pageNumb = 1
    # * def limitCount = 10
    # * def sort = "ASC"
    # * def search = "King"
    # * def category = "Wallet"   
    * def queryDetail = {page: 1,limit: 10,sort: 'ASC',search: 'King',category: 'Wallet'}
    When call read('this:get-product-listing.feature@GETProductListingSuccess')
    And match response.currentPage == 1
    And match response.totalPages == 1
    And match response.productsPerPage == 10
    And match response.totalProducts == 3            
    And match response.products[0].productId == '3d76ba72-47b2-11ee-9d72-0242ac150002'
    And match response.products[1].productId == '3d760633-47b2-11ee-9d72-0242ac150002'
    And match response.products[2].productId == '3d5c589e-47b2-11ee-9d72-0242ac150002'