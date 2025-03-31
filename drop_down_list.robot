*** Settings ***
Documentation   Validate drop down lists functionality
Library         SeleniumLibrary

*** Variables ***
${URL}      https://the-internet.herokuapp.com/dropdown
${dropdown_locator}     xpath://select[@id='dropdown']
*** Test Cases ***
Validate the dropdown list functions
    Navigate to base url
    Select options from dropdown menu
    Verify if selected option is displaying or not

*** Keywords ***
Navigate to base url
    Create Webdriver        Chrome
    Go to   ${URL}
    Maximize Browser Window

Select options from dropdown menu
    Click Element        ${dropdown_locator}
    Sleep   2s
    Select From List By Index   ${dropdown_locator}      1
    Sleep   2s

Verify if selected option is displaying or not
    ${selected_option}=     Get Selected List Value     ${dropdown_locator}
    Should Be Equal         ${selected_option}      1