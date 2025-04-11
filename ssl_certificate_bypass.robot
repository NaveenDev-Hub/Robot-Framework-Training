*** Settings ***
Documentation     Validate SSL certificate bypass for insecure sites
Library           SeleniumLibrary

*** Variables ***
${URL}              https://expired.badssl.com/
${BROWSER}          Chrome
${EXPECTED_TITLE}   expired.badssl.com

*** Test Cases ***
Validate SSL certificate bypass for insecure sites
    Navigate to insecure base url and Validate Insecure SSL Certificate Bypass

*** Keywords ***
Navigate to insecure base url and Validate Insecure SSL Certificate Bypass
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --ignore-certificate-errors
    Create Webdriver    Chrome    options=${options}
#    Create Webdriver    Chrome
    Set Selenium Timeout    3 seconds
    Go To    ${URL}
    ${title}=    Get Title
    Log    Page title is: ${title}
    Should Be Equal As Strings      ${EXPECTED_TITLE}       ${title}
    Sleep    2s
    Close Browser
