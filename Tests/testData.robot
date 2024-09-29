*** Settings ***
Documentation    This page stores all the Data related to registration

*** Variables ***
${user_prefix}    user_
${mail_Provider}    @yopmail.com
${new_username}    ${None}
${new_firstname}    ${None}
${new_lastname}    ${None}
${new_Email}    ${None}
${new_password}    ${None}
${existing_username}    dhiraj45@yopmail.com
${existing_password}    asdasd@12

*** Keywords ***
Generate Random userData
    ${rand_firstname}=    Evaluate    ''.join(random.choices(string.ascii_letters+string.digits, k=5))    random, string
    Set Global Variable    ${new_firstname}    ${rand_firstname}
    ${rand_lastname}=    Evaluate    ''.join(random.choices(string.ascii_letters+string.digits, k=5))    random, string
    Set Global Variable    ${new_lastname}    ${rand_lastname}
    ${randPassword}=    Evaluate    ''.join(random.choices(string.ascii_letters+string.digits+string.punctuation, k=8))    random, string
    Set Global Variable    ${new_password}    ${randPassword}
    Set Global Variable    ${new_username}    ${user_prefix}${new_firstname}
    Set Global Variable    ${new_Email}    ${new_username}${mail_Provider}