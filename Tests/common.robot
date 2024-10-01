*** Settings ***
Documentation    To Validate the login form
Library          SeleniumLibrary
Resource         registrationPage.robot

*** Variables ***
${DemoWebshopUrl}    https://demowebshop.tricentis.com/

*** Keywords ***
Open Browser and Go to Website
    Create Webdriver    Chrome    /Users/dhiraj/Downloads/chromedriver-mac-x64/chromedriver
    Go To    ${DemoWebshopUrl}

Close Existing Browser
    Close Browser

Tap on register button
    Wait Until Element Is Visible      ${registerLink}
    Click Element                      ${registerLink}

Fill the Registration Form with valid Creds
    [Arguments]                        ${first_name}                ${last_name}    ${email}    ${password}
    Wait Until Element Is Visible      id:gender-male
    Wait Until Element Is Enabled      ${maleGenderCheckbox}
    Click Element                      ${maleGenderCheckbox}
    Input Text                         ${firstNameTextbox}          ${first_name}
    Input Text                         ${lastNameTextbox}           ${last_name}
    Input Text                         ${emailTextbox}              ${email}
    Input Password                     ${passwordTextbox}           ${password}
    Input Password                     ${confirmPasswordTextbox}    ${password}
    Click Element                      ${registerFormRegisterButton}
    Wait Until Element Is Visible      ${ContinueButtonAfterRegister}
    Click Element                      ${ContinueButtonAfterRegister}