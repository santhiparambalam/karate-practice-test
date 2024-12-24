@AddProductToCart
Feature: Given user has logged in, when user view product, then user should be able to add product to cart

  Background:
    * url URL_ORDER
    * def subDirectory = 'cart/add'
   
  @ignore  
  @POSTAddProductToCartSuccess
  Scenario: Base endpoint to call get products
    Given path subDirectory 
    And request
    """
    {
      "userId": "#(userId)",
      "productId": "#(productId)",
      "quantity": "#(quantity)",
    }
    """
    When method Post
    Then status 200  

  @VerifyAddProductToCartDuplicate
  Scenario: Verify user able to unable to add same product to cart
    * def userId = "988b8117-bc4b-11ef-8a2c-0242ac120003"
    * def productId = "3d49b7f3-47b2-11ee-9d72-0242ac150002"
    * def quantity = 1
    When call read('this:post-add-product-to-cart.feature@POSTAddProductToCartSuccess')
    And match response == 'Product already exist in Cart!'


  @VerifyAddProductToCartSuccess
  Scenario: Verify user able to unable to add same product to cart
    * def userId = "15e42bed-47be-11ee-b409-0242ac160004"
    * def productId = "3d670e9e-47b2-11ee-9d72-0242ac150002"
    * def quantity = 1
    When call read('this:post-add-product-to-cart.feature@POSTAddProductToCartSuccess')
    And match response == 'Product added to Cart!'    
    And call read('classpath:feature/order/post-remove-product-from-cart.feature@VerifyRemoveProductFromCartSuccess')