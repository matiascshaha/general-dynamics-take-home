*** Settings ***
Documentation    These are keywords for selenium browser related things
Library           SeleniumLibrary

*** Keywords ***
Setup Browser
    [Documentation]    Open the browser and maximize the window
    [Arguments]    ${Browser}
    Open Browser   browser=${Browser}
    Maximize Browser Window

Validate Url On Browser
    [Documentation]    Validate the current URL on the browser
    [Arguments]    ${Url}
    ${CurrentUrl}=    Get Location
    Should Be Equal As Strings    ${CurrentUrl}    ${Url}

Check If Button Is Disabled
    [Documentation]    Check if the button is disabled
    [Arguments]    ${BUTTON_LOCATOR}
    ${disabled}=    Get Element Attribute    ${BUTTON_LOCATOR}    disabled
    Should Be Equal As Strings    ${disabled}    true
    