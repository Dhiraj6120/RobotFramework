*** Settings ***
Documentation    To Validate the login form
Library    SeleniumLibrary
Library    Collections
Resource    common.robot
Resource    registrationPage.robot
Resource    verifyRegistrationPageTest.robot
Resource    testData.robot
Test Setup     Open Browser and Go to Website
Test Teardown    Close Existing Browser

*** Test Cases ***
Verify user is able to add product to Cart
    Generate Random userData
    Tap on register button
    Fill the Registration Form with valid Creds         ${new_firstname}    ${new_lastname}    ${new_Email}    ${new_password}
    Validate the Feature products on Home Page
    Add Product to cart    Build your own cheap computer
    

*** Keywords ***
Validate the Feature products on Home Page
    Wait Until Element Is Visible    css:.product-title a
    ${feature_ExpectedProducts}=    Create List    $25 Virtual Gift Card    14.1-inch Laptop    Build your own cheap computer    Build your own computer    Build your own expensive computer    Simple Computer
    ${products_WebElements}=    Get Webelements    css:.product-title a
    ${feature_ActualProducts}=    Create List
    FOR    ${product_WebElement}    IN    @{products_WebElements}
        ${product_text}=    Get Text    ${product_WebElement}
        Append To List    ${feature_ActualProducts}    ${product_text}
        Log    ${product_text}
    END
    Lists Should Be Equal    ${feature_ActualProducts}    ${feature_ExpectedProducts}    ignore_order=True
    
Add Product to cart
    [Arguments]    ${productName}
    ${products_WebElements}=    Get Webelements    css:.product-title a
    ${productIndex}=    Set Variable    1
    FOR    ${product_WebElement}    IN    @{products_WebElements}
        ${product_text}=    Get Text    ${product_WebElement}
        Log    Found product: ${product_text}
        Exit For Loop If    '${productName}' == '${product_text}'
        ${productIndex}=    Evaluate    ${productIndex} + 1
    END
    Log    Product index is: ${productIndex}
    Click Element    xpath:(//*[@value='Add to cart'])[${productIndex}]

