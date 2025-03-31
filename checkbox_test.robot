*** Settings ***
Documentation  Validate checkbox functionality
Library     SeleniumLibrary

*** Variables ***
${URL}      https://the-internet.herokuapp.com/checkboxes
${checkbox_1_locator}   xpath://form[@id='checkboxes']//input[1]
${checkbox_2_locator}   xpath://form[@id='checkboxes']//input[2]

*** Test Cases ***
Validate checkbox functions
    [Documentation]  Verify checkbox
    Navigate to url
    Test checking the checkbox
    Verify box is checked or not

*** Keywords ***
Navigate to url
    Create Webdriver    Chrome
    Go To   ${URL}
    Maximize Browser Window

Test checking the checkbox
    Select Checkbox     ${checkbox_1_locator}
    Sleep   2s
    Unselect Checkbox   ${checkbox_2_locator}
    Sleep   2s

Verify box is checked or not
    Checkbox Should Be Selected         ${checkbox_1_locator}
    Checkbox Should Not Be Selected     ${checkbox_2_locator}

