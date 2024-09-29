*** Settings ***
Documentation    To Validate the login form
Library    SeleniumLibrary
#Test Teardown    Close Browser

*** Variables ***
${registerLink}    class:ico-register
${maleGenderCheckbox}    id:gender-male
${firstNameTextbox}    id:FirstName
${lastNameTextbox}    id:LastName
${emailTextbox}    id:Email
${passwordTextbox}    id:Password
${confirmPasswordTextbox}    id:ConfirmPassword
${registerFormRegisterButton}    xpath://*[@value="Register"]
${ExpectedFirstNameError}    First name is required.



*** Test Cases ***
Validate UnSuccessful Login
    open the browser with Webshop Website
    Tap on register button
    Fill the login form with wrong creds
#    wait until the error is displayed
#    verify the error message is correct

*** Keywords ***
open the browser with Webshop Website
    Create Webdriver    Chrome    /Users/dhiraj/Downloads/chromedriver-mac-x64/chromedriver
    Go To    https://demowebshop.tricentis.com/

Tap on register button
    Wait Until Element Is Visible    ${registerLink}
    Click Element    ${registerLink}

Fill the login form with wrong creds
    Wait Until Element Is Visible     id:gender-male
    Wait Until Element Is Enabled      ${maleGenderCheckbox}
    Click Element    ${maleGenderCheckbox}
#    Input Text    ${firstNameTextbox}    "fNameasas"
    Input Text    ${lastNameTextbox}    "lNasadsadme"
    Input Text    ${emailTextbox}    "fn12322@gmail.com"
    Input Password        ${passwordTextbox}    "flnasdaame@45"
    Input Password        ${confirmPasswordTextbox}    "flnasdaame@45"
    Click Element    ${registerFormRegisterButton}
    Wait Until Element Is Enabled     xpath://span[@for = "FirstName"]
    ${ResultText}=    Get Text    xpath://span[@for = "FirstName"]
    Should Be Equal As Strings    ${ResultText}    ${ExpectedFirstNameError}

Close the Browser Session
    Close Browser

