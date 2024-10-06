*** Settings ***
Documentation    To Validate the login form
Library    SeleniumLibrary
Library    ../CustomLibrary/CustomKeywords.py
Resource    ../Util/common.robot
Test Setup     Open Browser and Go to Website
Test Teardown    Close Existing Browser

*** Variables ***


*** Test Cases ***
Validate Successfully user Login
    [Tags]    SMOKE
    Generate Random user
    Tap on register button
    Fill the Registration Form with valid Creds Using CustomKeywords
    Verify user is successfully register to Website

*** Keywords ***
Verify user is successfully register to Website
    Wait Until Element Is Visible    ${registrationCompletionText}
    ${actualSuccessMessage}=    Get Text    ${registrationCompletionText}
    Should Be Equal As Strings    ${actualSuccessMessage}    Your registration completed
    Click Element                      ${ContinueButtonAfterRegister}
