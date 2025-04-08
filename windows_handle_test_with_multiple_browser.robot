*** Settings ***
Documentation   Validate multiple window handling functionality with multiple browser in web app
Library         SeleniumLibrary
#Test Teardown   Close Browser

*** Variables ***
${URL}                          https://the-internet.herokuapp.com/windows
${LINK_TEXT_LOCATOR}            Click Here
${EXPECTED_NEW_WINDOW_TITLE}    New Window
@{BROWSERS}      Chrome         Firefox         Safari

*** Test Cases ***
Validate multiple window handling functionality with multiple browser in web app
    FOR     ${BROWSER}      IN      @{BROWSERS}
        Navigate to windows handle base url     ${BROWSER}
        Click on Link text and navigate to new window
        Verify the new window title and close all windows
    END

*** Keywords ***
Navigate to windows handle base url
    [Arguments]  ${browser}
    Open Browser        ${URL}       ${browser}
    Maximize Browser Window

Click on Link text and navigate to new window
    ${handles}=         Get Window Handles      browser=CURRENT
    ${parent_window}=   Set Variable            ${handles[0]}
    Set Test Variable            ${parent}      ${parent_window}
    Click Link          ${LINK_TEXT_LOCATOR}
    Sleep               1s
    ${all_windows}=     Get Window Handles      browser=CURRENT
    FOR     ${handle}   IN      @{all_windows}
        Run Keyword If      '${handle}' != '${parent_window}'       Switch Window       ${handle}
        Exit For Loop If    '${handle}' != '${parent_window}'
    END

Verify the new window title and close all windows
    ${new_window_title}=    Get Title
    Should Be Equal     ${new_window_title}     ${EXPECTED_NEW_WINDOW_TITLE}
    Close Window
    Sleep   1s
    Switch Window       ${parent}
    Sleep       1s
    ${parent_window_title}=    Get Title
    Should Be Equal     ${parent_window_title}     The Internet
    Close All Browsers