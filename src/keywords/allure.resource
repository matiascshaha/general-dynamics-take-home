*** Settings ***
Documentation    this are keywords for Allure report to generate pretty reports
Library    AllureLibrary
Library    SeleniumLibrary
Library    Process

*** Keywords ***
Create Report
    [Documentation]    This keyword is used to create allure report
    Run Process    allure    serve    ${CURDIR}/../../output/allure-results

Attach Screenshot If Test Failed
    [Documentation]    This keyword is used to attach screenshot to allure report if test failed
    [Arguments]    ${status}
    Run Keyword If    '${status}' == 'FAIL'    Capture Page Screenshot    ${CURDIR}/../../output/assets/suite_failed_screenshot.png