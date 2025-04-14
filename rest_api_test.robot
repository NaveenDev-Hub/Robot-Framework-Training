*** Settings ***
Documentation       Validate Rest API's CRUD operation
Library             RequestsLibrary
Library             Collections

*** Variables ***
${BASE_URL}     https://api.restful-api.dev/objects
${POSTED_ID}    NONE

*** Test Cases ***
Validate Rest API's CRUD operation
    Validate GET api calls
    Validate POST api calls
    Validate DELETE api calls

*** Keywords ***
Validate GET api calls
    ${get_response}=        GET     ${BASE_URL}
    log         ${get_response.json()}
    Should Be Equal As Strings      1       ${get_response.json()}[0][id]
    log      ${get_response.json()}[0][id]
    Should Be Equal As Strings      Google Pixel 6 Pro      ${get_response.json()}[0][name]
    log      ${get_response.json()}[0][name]

Validate POST api calls
    &{data}=    Create Dictionary       year=2019   price=1849.99       CPU model=Intel Core i9         Hard disk size=1 TB
    &{new_item}=    Create Dictionary       name=Apple MacBook Pro 16
    Set To Dictionary   ${new_item}        data=${data}
    ${post_response}=       POST    ${BASE_URL}     json=${new_item}
    Log     ${post_response.status_code}
    Log     ${post_response.json()}
    ${post_response_json}   Set Variable    ${post_response.json()}
    ${post_response_id}=    Get From Dictionary       ${post_response_json}        id
    Set Global Variable         ${POSTED_ID}        ${post_response_id}
    log             ${post_response_id}

Validate DELETE api calls
    ${delete_url}=      Set Variable       ${BASE_URL}/${POSTED_ID}
    ${delete_response}=     DELETE          ${delete_url}
    Log         ${delete_response}
    Should Be Equal As Numbers      ${delete_response.status_code}      200
    ${delete_response_json}     Set Variable        ${delete_response.json()}
    ${expected_message}=        Set Variable        Object with id = ${POSTED_ID} has been deleted.
    Should Be Equal As Strings      ${delete_response_json}[message]        ${expected_message}
    log         ${delete_response_json}[message]