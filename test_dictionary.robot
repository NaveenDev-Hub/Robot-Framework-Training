*** Settings ***
Documentation   validate dictionary
Library         Collections

*** Test Cases ***
Create dictionary and validate
    &{new_dict}=    Create Dictionary       name=python     framework=framework     api=Restapi
    log     ${new_dict}
    Dictionary Should Contain Key       ${new_dict}   name
    Dictionary Should Contain Value     ${new_dict}     Restapi
    ${name_from_dict}=  Get From Dictionary                 ${new_dict}     name
    log     ${name_from_dict}
