*** Settings ***
Documentation   Validate file upload functionality
Library     SeleniumLibrary
Library     OperatingSystem
Test Teardown   Close Browser

*** Variables ***
${URL}          https://the-internet.herokuapp.com/download
${FILE_PATH}    /Users/withnaveen/Downloads
${FILE_NAME}    random_data.txt

*** Test Cases ***
Validate file download functionality
    Navigating to base url
    download a file
    Verify file downloaded

*** Keywords ***
Navigating to base url
    Create Webdriver    Chrome
    Maximize Browser Window
    Go To       ${URL}

download a file
    Wait Until Element Is Visible       link=${FILE_NAME}
    Click Element                       link=${FILE_NAME}
    Sleep       3s

Verify file downloaded
    File Should Exist   ${FILE_PATH}/${FILE_NAME}
    Log     File ${FILE_NAME} downloaded successfully to ${FILE_PATH}
    Log     File ${FILE_NAME} downloaded successfully to ${FILE_PATH}       level=INFO
    Log     File ${FILE_NAME} downloaded successfully to ${FILE_PATH}       level=DEBUG
    Log     File ${FILE_NAME} downloaded successfully to ${FILE_PATH}       level=WARN
    Log     File ${FILE_NAME} downloaded successfully to ${FILE_PATH}       level=ERROR