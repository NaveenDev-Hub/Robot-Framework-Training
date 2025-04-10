*** Settings ***
Documentation   Validate iFrame functionality
Library         SeleniumLibrary

*** Variables ***
${URL}      https://jqueryui.com/droppable/#default
${BROWSER}  Chrome
${IFRAME_LOCATOR}   class:demo-frame
${DRAGGABLE_LOCATOR}    id:draggable
${DROPPABLE_LOCATOR}    id:droppable
${DEFAULT_FUNC_LOCATOR}     link:Default functionality

*** Test Cases ***
Validate iFrame functionality
    Navigate to iframe base url
    Drag and drop inside iframe and Click default functionality

*** Keywords ***
Navigate to iframe base url
    Open Browser    ${URL}      ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout        10 seconds

Drag and drop inside iframe and Click default functionality
    Wait Until Element Is Visible   ${IFRAME_LOCATOR}
    Select Frame        ${IFRAME_LOCATOR}
    Sleep   1s
    Wait Until Element Is Visible   ${DRAGGABLE_LOCATOR}
    Wait Until Element Is Visible   ${DROPPABLE_LOCATOR}
    Drag And Drop   ${DRAGGABLE_LOCATOR}    ${DROPPABLE_LOCATOR}
    Sleep   1s
    Unselect Frame
    Wait Until Element Is Visible   ${DEFAULT_FUNC_LOCATOR}
    Click Link      ${DEFAULT_FUNC_LOCATOR}
    Sleep   1s
    Close Browser