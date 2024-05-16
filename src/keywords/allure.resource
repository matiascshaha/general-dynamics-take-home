*** Settings ***
Library    AllureLibrary
Library    SeleniumLibrary
Library    Process

*** Keywords ***
Create Report
    Run Process    allure    serve    ${CURDIR}/../../output/allure-results

Attach Screenshot If Test Failed
    [Arguments]    ${status}
    Run Keyword If    '${status}' == 'FAIL'    Capture Page Screenshot    ${CURDIR}/../../output/assets/suite_failed_screenshot.png