*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://www.google.com/

*** Test Cases ***
Verify Get Request
    ${response}=    GET    ${BASE_URL}
    Should Be Equal As Strings    ${response.status_code}    200