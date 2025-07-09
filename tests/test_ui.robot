*** Settings ***
Library    Browser
Library    Collections
Library    String
Library    DateTime

*** Variables ***
${BASE_URL}    https://testautomationpractice.blogspot.com/
${BROWSER}   chromium
${HEADLESS}    false
@{expected_list}    Red    Blue    Green    Yellow    Red    White    Green

*** Test Cases ***
Verify Page Title
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Page       ${BASE_URL}
    ${title}=      Get Title
    Should Be Equal As Strings    ${title}    Automation Testing Practice

Verify Mouse Hover
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Page       ${BASE_URL}
    ${element}=    Get Element    //button[contains(text(),'Point Me')]
    Hover    ${element}
    ${option}=    Get Element    //a[contains(text(),'Mobiles')]
    Click    ${option}

Verify Date Picker
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Page       ${BASE_URL}
    ${date_picker}=    Get Element    //input[@id='datepicker']
    ${date}=    Get Current Date    result_format=%m-%d-%Y
    Fill Text    ${date_picker}    ${date}
    Press Keys   ${date_picker}    Escape
    Take Screenshot    date_picker    ${date_picker}

Verify Drag and Drop
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Page       ${BASE_URL}
    ${source}=     Get Element    //div[@id='draggable']
    ${target}=     Get Element    //div[@id='droppable']
    Scroll To Element    ${source}
    Drag And Drop    ${source}    ${target}
    ${text}=       Get Text    ${target}
    Should Be Equal As Strings    ${text}    Dropped!
    
Verify Scrolling DropDown
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Page       ${BASE_URL}
    ${dropdown}=   Get Element By    placeholder    Select an item
    Scroll To Element    ${dropdown}
    Click    ${dropdown}
    ${option}=    Get Element    //div[@id='dropdown']/div[text()='Item 100']
    Click    ${option}

Verify Colors DropDown
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Page       ${BASE_URL}
    ${colors}=    Get Elements    //select[@id='colors']/option
    @{actual_list}=    Create List
    FOR    ${element}    IN    @{colors}
        ${option}=    Get Text    ${element}
        Append To List    ${actual_list}    ${option}
        Log    ${option}
    END
    Should Be Equal    ${expected_list}    ${actual_list}

Verify Java Subjects Price
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Page       ${BASE_URL}
    ${java_price}    Set Variable    0
    ${rows}=    Get Element Count    //table[@name='BookTable']//tr    
    FOR    ${counter}    IN RANGE    2    ${rows}
        ${subject}=    Get Text    //table[@name='BookTable']//tr[${counter}]//td[3]
        IF    '${subject}' == 'Java'
            ${java_price}=    Get Text    //table[@name='BookTable']//tr[${counter}]//td[4]
        END
    END
    Should Be Equal As Strings    ${java_price}    500








    
    

