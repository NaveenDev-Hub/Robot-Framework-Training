*** Settings ***
Documentation   Validate file upload functionality
Library     SeleniumLibrary
Test Teardown   Close Browser

*** Variables ***
${URL}      https://the-internet.herokuapp.com/upload
${FILE_PATH}    /Users/withnaveen/Documents/Selenium_Upload/TestFile.txt

*** Test Cases ***
Validate file upload functionality
    Navigating to base url
    Upload a file
    Verify uploaded file is success or not

*** Keywords ***
Navigating to base url
    Create Webdriver    Chrome
    Maximize Browser Window
    Go To       ${URL}

Upload a file
    Wait Until Element Is Visible       id:file-upload          timeout=10s
    Choose File                         id:file-upload          ${FILE_PATH}
    Wait Until Element Is Enabled       id:file-submit          timeout=10s
    Click Element                       id:file-submit

Verify uploaded file is success or not
    Wait Until Element Is Visible       id:uploaded-files   timeout=10s
    Element Should Be Visible           id:uploaded-files