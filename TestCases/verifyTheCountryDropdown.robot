*** Settings ***
Documentation    This test is to verify the dropdown box
Library    SeleniumLibrary
Library    Collections
Resource    ../Util/common.robot
Resource    ../TestData/testData.robot
Test Setup     Open Browser and Go to Website
Test Teardown    Close Existing Browser

*** Test Cases ***

Verify user is able to add product to Cart
    [Tags]    REGRESSION
    Generate Random userData
    Tap on register button
    Fill the Registration Form with valid Creds         ${new_firstname}    ${new_lastname}    ${new_Email}    ${new_password}
    Tap on Search Button without entering the text               #this is to check Popup
    Add Product to cart    14.1-inch Laptop
    Tap on Shopping Cart link
    Select the Country from Dropdown

*** Keywords ***
Tap on Shopping Cart link
    Click Element    xpath://span[text()='Shopping cart']

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
    Wait Until Element Is Visible    css:.product-title a
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

Tap on Search Button without entering the text
    Click Element    css:.search-box-button
    Handle Alert    action=ACCEPT

Select the Country from Dropdown
    Wait Until Element Is Visible        css:.country-input    
    Select From List By Value    css:.country-input    41