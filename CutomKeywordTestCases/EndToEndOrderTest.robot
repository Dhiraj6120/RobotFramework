*** Settings ***
Documentation    To Validate the login form
Library    SeleniumLibrary
Library    Collections
Library    ../CustomLibrary/CustomKeywords.py
Resource    ../Util/common.robot
Resource    ../Pages/homePage.robot
Test Setup     Open Browser and Go to Website
Test Teardown    Close Existing Browser

*** Test Cases ***
Verify that user is able to complete the Order
    Tap on register button
    Fill the Registration Form with valid Creds Using CustomKeywords
    Verify user is successfully register to Website
    Validate the Feature products on Home Page
    Add Product To Cart    14.1-inch Laptop
    Click Element    ${shoppingCartButton}
   

*** Keywords ***
Verify user is successfully register to Website
    Wait Until Element Is Visible    ${registrationCompletionText}
    ${actualSuccessMessage}=    Get Text    ${registrationCompletionText}
    Should Be Equal As Strings    ${actualSuccessMessage}    Your registration completed
    Click Element                      ${ContinueButtonAfterRegister}

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


