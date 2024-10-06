*** Settings ***
Documentation    Thia Test Case is to validate the new window in Browser
Library    SeleniumLibrary
Library    Collections
Resource    ../Util/common.robot
Test Setup     Open Browser and Go to Website
Test Teardown    Close Existing Browser

*** Test Cases ***
Verify the New Window in Browser
    [Tags]    SANITY
    Verify and Tap the Youtube Link at button of the Page
    Verify that user is switch to child window
    Get Name of youtube channel

*** Keywords ***
Verify and Tap the Youtube Link at button of the Page
    Scroll Element Into View    //a[text()='YouTube']
    Click Element    //a[text()='YouTube']
    Sleep    5

Verify that user is switch to child window
    Switch Window    NEW

Get Name of youtube channel
    ${newWindowText}=    Get Text    //span[text()='nopCommerce']
    Log    ${newWindowText}
    

