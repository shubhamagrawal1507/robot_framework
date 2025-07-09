*** Settings ***
Library    Browser
Library    DateTime
Library    Collections
Resource    variables.robot

*** Keywords ***

Launch and Navigate to URL
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Page       ${BASE_URL}

Hover and Select option
    [Arguments]    ${option_text}
    ${element}=    Get Element    //button[contains(text(),'Point Me')]
    Hover    ${element}
    ${option}=    Get Element    //a[contains(text(), '${option_text}')]
    Click    ${option}

Select Date
    [Arguments]    ${date_type}
    ${date_picker}=    Get Element    //input[@id='datepicker']
    IF    '${date_type}' == 'Today'
        ${date}=    Get Current Date    result_format=%m-%d-%Y
        Fill Text    ${date_picker}    ${date}
        Press Keys   ${date_picker}    Escape
        Take Screenshot    date_picker    ${date_picker}
    END

Perform Drag And Drop
    ${source}=     Get Element    //div[@id='draggable']
    ${target}=     Get Element    //div[@id='droppable']
    Scroll To Element    ${source}    
    Drag And Drop    ${source}    ${target}
    ${text}=       Get Text    ${target}
    [Return]    ${text}

Get Colors From DropDown
    ${colors}=    Get Elements    //select[@id='colors']/option
    @{actual_list}=    Create List
    FOR    ${element}    IN    @{colors}
        ${option}=    Get Text    ${element}
        Append To List    ${actual_list}    ${option}
    END
    [Return]    ${actual_list}

Get Java Subject Price
    ${java_price}=    Set Variable    0
    ${rows}=    Get Element Count    //table[@name='BookTable']//tr
    FOR    ${counter}    IN RANGE    2    ${rows}
        ${subject}=    Get Text    //table[@name='BookTable']//tr[${counter}]//td[3]
        IF    '${subject}' == 'Java'
            ${java_price}=    Get Text    //table[@name='BookTable']//tr[${counter}]//td[4]
        END
    END
    [Return]    ${java_price}
