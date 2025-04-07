*** Settings ***
Documentation   Validate right click functionality
Library         SeleniumLibrary
Test Teardown   Close Browser

*** Variables ***
${URL}                          https://swisnl.github.io/jQuery-contextMenu/demo.html
${RIGHT_CLICK_ELEMENT}          css:.context-menu-one
${CONTEXT_MENU_COPY_OPTION}     css:.context-menu-icon-copy
${EXPECTED_ALERT_TEXT}          clicked: copy

*** Test Cases ***
Validate right click functionality and verify
    Navigate to base url
    Do right click and select one option from the menu
    Verify the clicked option is correct or not

*** Keywords ***
Navigate to base url
    Create Webdriver    Chrome
    Maximize Browser Window
    Go To   ${URL}

Do right click and select one option from the menu
    Wait Until Element Is Visible           ${RIGHT_CLICK_ELEMENT}
    Open Context Menu                       ${RIGHT_CLICK_ELEMENT}
    Click Element                           ${CONTEXT_MENU_COPY_OPTION}

Verify the clicked option is correct or not
    ${alert_message}=               Handle Alert        action=ACCEPT
    Should Be Equal As Strings      ${alert_message}    ${EXPECTED_ALERT_TEXT}




