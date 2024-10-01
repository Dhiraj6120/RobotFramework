*** Settings ***
Documentation    To Validate the login form
Library    SeleniumLibrary
Resource    common.robot
Resource    testData.robot
Resource    registrationPage.robot
Test Setup     Open Browser and Go to Website
Test Teardown    Close Existing Browser

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
Validate UnSuccessful Login when First name was not entered
    Tap on register button
    Fill the login form with wrong creds
    Validate the Error for firstname

Validate Successfully user Login
    Generate Random userData
    Tap on register button
    Fill the Registration Form with valid Creds         ${new_firstname}    ${new_lastname}    ${new_Email}    ${new_password}
    Verify user is successfully register to Website

*** Keywords ***

Tap on register button
    Wait Until Element Is Visible      ${registerLink}
    Click Element                      ${registerLink}

Fill the login form with wrong creds
    Wait Until Element Is Visible     id:gender-male
    Wait Until Element Is Enabled      ${maleGenderCheckbox}
    Click Element    ${maleGenderCheckbox}
#    Input Text    ${firstNameTextbox}    "firstname"
    Input Text    ${lastNameTextbox}    "lastname"
    Input Text    ${emailTextbox}    "fn12322@gmail.com"
    Input Password        ${passwordTextbox}    "flnasdaame@45"
    Input Password        ${confirmPasswordTextbox}    "flnasdaame@45"
    Click Element    ${registerFormRegisterButton}

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

Validate the Error for firstname
    Wait Until Element Is Enabled     xpath://span[@for = "FirstName"]
    ${ResultText}=    Get Text        xpath://span[@for = "FirstName"]
    Should Be Equal As Strings        ${ResultText}    ${ExpectedFirstNameError}

Verify user is successfully register to Website
    Wait Until Element Is Visible    ${registrationCompletionText}
    ${actualSuccessMessage}=    Get Text    ${registrationCompletionText}
    Should Be Equal As Strings    ${actualSuccessMessage}    Your registration completed

