*** Settings ***
Documentation   Validate right click functionality in headless mode
Library         SeleniumLibrary
Test Teardown   Close Browser

*** Variables ***
${URL}                          https://swisnl.github.io/jQuery-contextMenu/demo.html
${RIGHT_CLICK_LOCATOR}          css:.context-menu-one
${CONTEXT_COPY_MENU_LOCATOR}    css:.context-menu-icon-copy
${EXPECTED_ALERT_MESSAGE}       clicked: copy

*** Test Cases ***
Validate right click functionality
    Navigate to base right click url
    Do right click and select one option from the menu
    Verify the clicked option is correct or not

*** Keywords ***
Navigate to base right click url
    Open Browser        ${URL}      headlesschrome
    Maximize Browser Window

Do right click and select one option from the menu
    Wait Until Element Is Visible       ${RIGHT_CLICK_LOCATOR}
    Open Context Menu                   ${RIGHT_CLICK_LOCATOR}
    Click Element                       ${CONTEXT_COPY_MENU_LOCATOR}

Verify the clicked option is correct or not
    ${alert_message}=       Handle Alert        action=ACCEPT
    Should Be Equal As Strings      ${alert_message}    ${EXPECTED_ALERT_MESSAGE}