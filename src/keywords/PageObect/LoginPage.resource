*** Settings ***
Library           SeleniumLibrary
Resource          ./Locators/LoginLocators.resource
Resource          ../configLoader.resource
Resource          ../browser.resource

*** Keywords ***

# Browser Navigation Keywords
Visit Login
    [Documentation]    Navigate to the login page.
    &{CONFIG}    Load Configuration
    Go To    ${CONFIG}[BASE_URL]/login

# Input Keywords
Input Username
    [Documentation]    Enter the username.
    [Arguments]    ${username}
    Input Text    ${LoginUsernameInputBox}    ${username}

Input Password
    [Documentation]    Enter the password.
    [Arguments]    ${password}
    Input Text    ${LoginPasswordInputBox}    ${password}

Input Forgot Password Email
    [Documentation]    Enter the forgot password email.
    [Arguments]    ${email}
    Input Text    ${ForgotPasswordInputBox}    ${email}

Input Forgot Username Email
    [Documentation]    Enter the forgot username email.
    [Arguments]    ${email}
    Input Text    ${ForgotPasswordInputBox}    ${email}

# Action Keywords
Enter Login Credentials And Click Login Button
    [Documentation]    Enter the login credentials and click the login button.
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Click Element    ${LoginButton}

Click Remember Me
    [Documentation]    Click the remember me checkbox.
    Click Element    ${RememberMeCheckbox}

Click Forgot Password Link
    [Documentation]    Click the forgot password link.
    Click Element    ${ForgotPasswordLink}

Click Send Email to Reset Password
    [Documentation]    Click the send email to reset password button.
    Click Element    ${ForgotPasswordSendEmailButton}

Close Forgot Password Window
    [Documentation]    Close the forgot password window.
    Click Element    ${ForgotPasswordCloseButton}

Click Forgot Username Link
    [Documentation]    Click the forgot username link.
    Click Element    ${ForgotUsernameLink}

Click Send Email to Retrieve Username
    [Documentation]    Click the send email to retrieve username button.
    Click Element    ${ForgotUsernameSendEmailButton}

# Validation Keywords
Validate Login Inputs Are Prepopulated
    [Documentation]    Validate the login inputs are prepopulated.
    [Arguments]    ${username}    ${password}
    ${usernameValue}=    Get Value    ${LoginUsernameInputBox}
    ${passwordValue}=    Get Value    ${LoginPasswordInputBox}
    Should Be Equal    ${usernameValue}    ${username}
    Should Be Equal    ${passwordValue}    ${password}

Validate Username Input Box
    [Documentation]    Validate the username input box is visible.
    Wait Until Element Is Visible    ${LoginUsernameInputBox}

Validate Password Input Box
    [Documentation]    Validate the password input box is visible.
    Wait Until Element Is Visible    ${LoginPasswordInputBox}

Validate Login Button
    [Documentation]    Validate the login button is visible.
    Wait Until Element Is Visible    ${LoginButton}

Validate Sign Up Link
    [Documentation]    Validate the sign up link is visible.
    Wait Until Element Is Visible    ${SignUpLink}

Validate Forgot Password Link
    [Documentation]    Validate the forgot password link is visible.
    Wait Until Element Is Visible    ${ForgotPasswordLink}

Validate General Dynamics Logo
    [Documentation]    Validate the General Dynamics logo is visible.
    Wait Until Element Is Visible    ${GeneralDynamicsLogo}

Validate Incorrect Credentials Message
    [Documentation]    Validate the incorrect credentials message is visible and correct.
    [Arguments]    ${expected_message}
    ${message}=    Get Text    ${LoginIncorrectCredentialsMessage}
    Should Be Equal    ${message}    ${expected_message}

Validate User Too Many Attempts Message
    [Documentation]    Validate the user locked from too many attempts message is visible and correct.
    [Arguments]    ${expected_message}
    ${message}=    Get Text    ${LoginUserTooManyAttemptsMessage}
    Should Be Equal    ${message}    ${expected_message}

Validate Login Button Disabled
    [Documentation]    Validate the login button is disabled.
    Check If Button Is Disabled    ${LoginButton}

Validate Forgot Password Image
    [Documentation]    Validate the forgot password image is visible.
    Wait Until Element Is Visible    ${ForgotPasswordImage}

Validate Forgot Password Description
    [Documentation]    Validate the forgot password description is visible.
    Wait Until Element Is Visible    ${ForgotPasswordDescription}

Validate Forgot Password Email Input Box
    [Documentation]    Validate the forgot password email input box is visible.
    Wait Until Element Is Visible    ${ForgotPasswordInputBox}

Validate Forgot Password Send Email Button
    [Documentation]    Validate the forgot password send email button is visible.
    Wait Until Element Is Visible    ${ForgotPasswordSendEmailButton}

Validate Forgot Username Link
    [Documentation]    Validate the forgot username link is visible.
    Wait Until Element Is Visible    ${ForgotUsernameLink}

Validate User on Login Page
    [Documentation]    Validate the user is on the login page.
    &{CONFIG}    Load Configuration
    Validate Url On Browser    ${CONFIG}[BASE_URL]/login
    Validate Login Button

Validate Forgot Password Email Sent Success Message
    [Documentation]    Validate the forgot password email sent message is visible and correct.
    [Arguments]    ${expected_message}
    ${message}=    Get Text    ${ForgotPasswordEmailSentMessage}
    Should Be Equal    ${message}    ${expected_message}

Validate Incorrect Forgot Password Email Message
    [Documentation]    Validate the incorrect forgot password email message is visible and correct.
    [Arguments]    ${expected_message}
    ${message}=    Get Text    ${ForgotPasswordIncorrectEmailMessage}
    Should Be Equal    ${message}    ${expected_message}

Validate Forgot Username Email Sent Success Message
    [Documentation]    Validate the forgot username email sent message is visible and correct.
    [Arguments]    ${expected_message}
    ${message}=    Get Text    ${ForgotUsernameEmailSentMessage}
    Should Be Equal    ${message}    ${expected_message}

Validate Incorrect Forgot Username Email Message
    [Documentation]    Validate the incorrect forgot username email message is visible and correct.
    [Arguments]    ${expected_message}
    ${message}=    Get Text    ${ForgotUsernameIncorrectEmailMessage}
    Should Be Equal    ${message}    ${expected_message}

Go To Forgot Password
    [Documentation]    Go to the forgot password page.
    # Not implemented
    # because not sure how to get to the forgot password input based on the image sent
    Skip
