*** Settings ***
Documentation    This file is to store the locators of Registration Page

*** Variables ***
${registerLink}    class:ico-register
${maleGenderCheckbox}    id:gender-male
${firstNameTextbox}    id:FirstName
${lastNameTextbox}    id:LastName
${emailTextbox}    id:Email
${passwordTextbox}    id:Password
${confirmPasswordTextbox}    id:ConfirmPassword
${registerFormRegisterButton}    id:register-button
${registrationCompletionText}    xpath://*[@class="result"]
${ExpectedFirstNameError}    First name is required.
${ContinueButtonAfterRegister}    css:.register-continue-button