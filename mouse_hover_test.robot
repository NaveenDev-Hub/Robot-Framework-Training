*** Settings ***
Documentation       Validate mouse hover functionality in web app
Library             SeleniumLibrary
Test Teardown       Close Browser

*** Variables ***
${URL}                  https://demoqa.com/menu#
${MAIN_ITEM_2_LOCATOR}  xpath://a[text()='Main Item 2']
${SUB_SUB_LIST}         xpath://a[text()='SUB SUB LIST »']

*** Test Cases ***
Validate mouse hover functionality in web app
    Navigate to mouse hover base url
    Navigate to Main item 2 and select Sub sub list
    Verify the final menu or list visible or not

*** Keywords ***
Navigate to mouse hover base url
    Create Webdriver    Chrome
    Maximize Browser Window
    Go To   ${URL}

Navigate to Main item 2 and select Sub sub list
    Wait Until Element Is Visible       ${MAIN_ITEM_2_LOCATOR}          timeout=10s
    Mouse Over                          ${MAIN_ITEM_2_LOCATOR}
    Wait Until Element Is Visible       ${SUB_SUB_LIST}                 timeout=10s
    Mouse Over                          ${SUB_SUB_LIST}
    Click Element                       ${SUB_SUB_LIST}

Verify the final menu or list visible or not
    Element Should Be Visible           ${SUB_SUB_LIST}
