*** Settings ***
Documentation  Validate dynamic page
Library         SeleniumLibrary
Test Teardown   Close Browser

*** Variables ***
${URL}      https://the-internet.herokuapp.com/dynamic_loading/1

*** Test Cases ***
Validate dynamic loading web app
    Navigate to dynamic loading base url
    Click on dynamic element and wait until load
    Verify element after loaded

*** Keywords ***
Navigate to dynamic loading base url
    Create Webdriver    Chrome
    Maximize Browser Window
    Go To               ${URL}

Click on dynamic element and wait until load
    Click Element       //div[@id='start']//button
#    sleep       10s

Verify element after loaded
    Wait Until Element Is Visible       //div[@id='finish']//h4     timeout=10s
    Element Should Be Visible           //div[@id='finish']//h4