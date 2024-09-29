*** Settings ***
Documentation    To Validate the login form
Library    SeleniumLibrary
Resource    common.robot
Resource    registrationPage.robot
Resource    testData.robot
Test Setup     Open Browser and Go to Website
Test Teardown    Close Existing Browser

*** Test Cases ***
Validate Successfully user Login
    Generate Random userData
    Tap on register button
    Fill the Registration Form         ${new_firstname}    ${new_lastname}    ${new_Email}    ${new_password}
    Verify user is successfully register to Website

*** Keywords ***

Tap on register button
    Wait Until Element Is Visible      ${registerLink}
    Click Element                      ${registerLink}

Fill the Registration Form
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

Verify user is successfully register to Website
    Wait Until Element Is Visible    ${registrationCompletionText}
    ${actualSuccessMessage}=    Get Text    ${registrationCompletionText}
    Should Be Equal As Strings    ${actualSuccessMessage}    Your registration completed

Validate the Error for firstname
    Wait Until Element Is Enabled     xpath://span[@for = "FirstName"]
    ${ResultText}=    Get Text        xpath://span[@for = "FirstName"]
    Should Be Equal As Strings        ${ResultText}    ${ExpectedFirstNameError}
