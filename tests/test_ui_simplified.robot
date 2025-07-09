*** Settings ***
Library    String
Library    Browser
Resource    ../resources/keywords.robot

*** Test Cases ***
Verify Page Title
    Launch and Navigate to URL
    ${title}=      Get Title
    Should Be Equal As Strings    ${title}    Automation Testing Practice

Verify Mouse Hover
    Launch and Navigate to URL
    Hover and Select option    Mobiles

Verify Date Picker
    Launch and Navigate to URL
    Select Date    Today

Verify Drag and Drop
    Launch and Navigate to URL
    ${text}=       Perform Drag And Drop
    Should Be Equal As Strings    ${text}    Dropped!
    
Verify Colors DropDown
    Launch and Navigate to URL
    ${actual_colors}=    Get Colors From DropDown
    Should Be Equal    ${expected_list}    ${actual_colors}

Verify Java Subjects Price
    Launch and Navigate to URL
    ${java_price}    Get Java Subject Price
    Should Be Equal As Strings    ${java_price}    500








    
    

