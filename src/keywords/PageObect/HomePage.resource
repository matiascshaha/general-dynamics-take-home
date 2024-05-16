*** Settings ***
Library           SeleniumLibrary
Resource        ./Locators/HomeLocators.resource
Resource        ./Locators/LoginLocators.resource
Resource        ./LoginPage.resource
Resource        ../browser.resource
Resource        ../configLoader.resource

*** Keywords ***
Validate Home Logo
    [Documentation]    Validate the home logo is visible
    Wait Until Element Is Visible    ${HomeLogo}

Validate Logout Button
    [Documentation]    Validate the logout button is visible
    Wait Until Element Is Visible    ${LogoutButton}

Validate On Home Screen
    [Documentation]    Validate the user is on the home screen
    Validate Home Logo
    Validate Logout Button

Logout
    [Documentation]    Log out from the application
    Click Element    ${LogoutButton}
    Validate User on Login Page