@RemoveProductFromCart
Feature: Given user has added product to cart, when user view cart, then user should be able to remove product from cart

  Background:
    * url URL_ORDER
    * def subDirectory = 'cart/remove'
   
  @ignore  
  @POSTRemoveProductToCartSuccess
  Scenario: Base endpoint to call get products
    Given path subDirectory 
    And request
    """
    {
      "userId": "#(userId)",
      "productId": "#(productId)",
    }
    """
    When method Post
    Then status 200  

  #shared scope  
  @ignore   
  @VerifyRemoveProductFromCartSuccess
  Scenario: Verify user able to unable to add same product to cart
    When call read('this:post-remove-product-from-cart.feature@POSTRemoveProductToCartSuccess')
    And match response == 'Product deleted from cart'