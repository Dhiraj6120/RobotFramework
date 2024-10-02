*** Settings ***
Documentation    To Validate the login form
Library    SeleniumLibrary
Resource    ../Util/common.robot
Resource    ../Pages/registrationPage.robot
Test Template    Validate Successfully user Login

*** Variables ***
${registerLink}    class:ico-register
${maleGenderCheckbox}    id:gender-male
${firstNameTextbox}    id:FirstName
${lastNameTextbox}    id:LastName
${emailTextbox}    id:Email
${passwordTextbox}    id:Password
${confirmPasswordTextbox}    id:ConfirmPassword
${registerFormRegisterButton}    xpath://*[@value="Register"]
${ExpectedFirstNameError}    First nme is required.


*** Test Cases ***
Login Test
    [Template]    Validate Successfully user Login
    John    Doe    john.doe@example.com    Password123
    Jane    Smith    jane.smith@example.com    Password456
    Alice    Johnson    alice.johnson@example.com    Password78


*** Keywords ***

Validate Successfully user Login
    [Arguments]    ${new_firstname}    ${new_lastname}    ${new_Email}    ${new_password}
    Open Browser and Go to Website
    Tap on register button
    Fill the Registration Form with valid Creds         ${new_firstname}    ${new_lastname}    ${new_Email}    ${new_password}
    Close Browser

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

