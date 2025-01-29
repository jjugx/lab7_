*** Settings ***
Suite Setup       Open Browser To Form Page
Suite Teardown    Close Browser
Test Setup        Go To Form Page
Test Template     Form With Empty Destination Should Fail
Resource          resource.robot


*** Test Cases ***         FIRSTNAME                 LASTNAME                DESTINATION                CONTACTPERSON              RELATIONSHIP             EMAIL             PHONE
Empty Destination          ${VALID FIRSTNAME}        ${VALID LASTNAME}       ${EMPTY}                   ${VALID CONTACTPERSON}     ${VALID RELATIONSHIP}    ${VALID EMAIL}    ${VALID PHONE}
Empty Email                ${VALID FIRSTNAME}        ${VALID LASTNAME}       ${VALID DESTINATION}       ${VALID CONTACTPERSON}     ${VALID RELATIONSHIP}    ${EMPTY}          ${VALID PHONE}
Invalid Email              ${VALID FIRSTNAME}        ${VALID LASTNAME}       ${VALID DESTINATION}       ${VALID CONTACTPERSON}     ${VALID RELATIONSHIP}    somsong@          ${VALID PHONE}
Empty Phone                ${VALID FIRSTNAME}        ${VALID LASTNAME}       ${VALID DESTINATION}       ${VALID CONTACTPERSON}     ${VALID RELATIONSHIP}    ${VALID EMAIL}    ${EMPTY}
Invalid Phone              ${VALID FIRSTNAME}        ${VALID LASTNAME}       ${VALID DESTINATION}       ${VALID CONTACTPERSON}     ${VALID RELATIONSHIP}    ${VALID PHONE}    191


*** Keywords ***
Form With Empty Destination Should Fail
    [Arguments]    ${firstname}    ${lastname}    ${destination}    ${contactperson}    ${relationship}    ${email}    ${phone}
    Input Firstname    ${firstname}
    Input Lastname    ${lastname}
    Input Destination    ${destination}
    Input Contactperson    ${contactperson}
    Input Relationship    ${relationship}
    Input Email    ${email}
    Input Phone    ${phone}
    Submit Credentials
    Form Should Have Failed

Form Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    Error Page