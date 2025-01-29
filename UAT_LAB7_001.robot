*** Settings ***
Resource          resource.robot


*** Test Cases ***
Open Form
    Open Browser To Form Page

Complete Form
    Open Browser To Form Page
    Input Firstname    Prachak
    Input Lastname    Saithaem
    Input Destination    Asia
    Input Contactperson    Sa thon
    Input Relationship    Mother
    Input Email    prachak@kkumail.com
    Input Phone    087-101-1101
    Submit Credentials
    Complete Page Should Be Open
    [Teardown]    Close Browser