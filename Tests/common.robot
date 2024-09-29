*** Settings ***
Documentation    To Validate the login form
Library    SeleniumLibrary

*** Variables ***
${DemoWebshopUrl}    https://demowebshop.tricentis.com/

*** Keywords ***
Open Browser and Go to Website
    Create Webdriver    Chrome    /Users/dhiraj/Downloads/chromedriver-mac-x64/chromedriver
    Go To    ${DemoWebshopUrl}

Close Existing Browser
    Close Browser