*** Settings ***
Documentation  Parameterized login functionality test
Library     SeleniumLibrary
Test Setup  Open Login Page
Test Teardown  Close Browser

*** Variables ***
${URL}          https://practicetestautomation.com/practice-test-login/
${VALID_USER}   student
${VALID_PASS}   Password123

*** Test Cases ***
Valid Login Scenraio
    [Documentation]     Test with valid username and valid password
    Login with credentials  ${VALID_USER}      ${VALID_PASS}
    Verify successful login

Invalid Login Scenrio
    [Documentation]  Test with multiple invalid credentials
    [Template]  Invalid Login Template
    invalidUser     ${VALID_PASS}       Your username is invalid!
    ${VALID_USER}   wrongpassword       Your password is invalid!
    ${VALID_USER}   invalidpassword     Your password is invalid!
    ${VALID_USER}   abvedgkdgkfdlgkd    Your password is invalid!

*** Keywords ***
Open Login Page
    Create Webdriver   Chrome
    Maximize Browser Window
    Go To               https://practicetestautomation.com/practice-test-login/
    Sleep   3s

Login with credentials
    [Arguments]     ${username}     ${password}
    input text      id:username     ${username}
    input password  id:password     ${password}
    click button    id:submit
    Sleep   2s

Verify successful login
    title should be   Logged In Successfully | Practice Test Automation
    location should be  https://practicetestautomation.com/logged-in-successfully/

Invalid Login Template
    [Arguments]                 ${username}     ${password}         ${expected_message}
    Login with credentials      ${username}     ${password}
    page should contain element     xpath://div[@id='error']        ${expected_message}

