*** Settings ***
Documentation       Validate Login functionality
Library             SeleniumLibrary

*** Test Cases ***
Validate positive login scenario
    Navigate to login page
    Enter valid username, password and click on Submit button
    Verify the logged in page title, url

*** Keywords ***
Navigate to login page
    Create Webdriver    Chrome
    Go To       https://practicetestautomation.com/practice-test-login/
    Sleep   1s

Enter valid username, password and click on Submit button
    Input Text      id:username     student
    Input Password  id:password     Password123
    Click Button    id:submit
    Sleep   3s

Verify the logged in page title, url
    ${actual_title}=     Get Title
    Should Be Equal As Strings      ${actual_title}     Logged In Successfully | Practice Test Automation
    ${current_url}=     Get Location
    Should Be Equal  ${current_url}      https://practicetestautomation.com/logged-in-successfully/
