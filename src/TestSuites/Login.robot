*** Settings ***
Library           SeleniumLibrary
Resource          ../keywords/PageObect/LoginPage.resource
Resource          ../keywords/PageObect/HomePage.resource
Resource          ../keywords/allure.resource
Resource          ../keywords/configLoader.resource
Resource          ../keywords/browser.resource

Suite Setup       Setup Browser    Browser=Chrome
Suite Teardown    Create Report
Test Setup        Visit Login
Test Teardown     Attach Screenshot If Test Failed    status=${TEST STATUS}

*** Test Cases ***

### ************************************************ ###
###                 Smoke Tests                      ###
### ************************************************ ###
Check Login Elements are Present
    [Documentation]    Validate that all expected login elements are present.
    [Tags]             smoke auth
    Validate Username Input Box
    Validate Password Input Box
    Validate Login Button
    Validate Sign Up Link
    Validate Forgot Password Link
    Validate General Dynamics Logo

Forgot Password Elements are Present
    [Documentation]    Verify that all expected forgot password elements are present.
    [Tags]             smoke auth
    Go To Forgot Password    # I don't see a forgot password link on the login page # so I'm not sure how to navigate to the forgot password page
    Validate Forgot Password Image
    Validate Forgot Password Description
    Validate Forgot Password Email Input Box
    Validate Forgot Password Send Email Button
    Validate Forgot Username Link

### ************************************************ ###
###                Happy Path Tests                  ###
### ************************************************ ###
Login Successfully
    [Documentation]    Verify that a user can log in successfully.
    [Tags]             happy_path auth
    ${CONFIG}=    Load Configuration
    Validate User on Login Page
    Enter Login Credentials And Click Login Button    username=${CONFIG}[USERNAME]    password=${CONFIG}[PASSWORD]
    Validate On Home Screen
    Logout

Remember Me Functionality
    [Documentation]    Verify that the remember me functionality works as expected.
    [Tags]             happy_path auth
    ${CONFIG}=    Load Configuration    
    Validate User on Login Page
    Click Remember Me
    Enter Login Credentials And Click Login Button    username=${CONFIG}[USERNAME]    password=${CONFIG}[PASSWORD]
    Validate On Home Screen
    Logout
    Validate User on Login Page
    Validate Login Inputs Are Prepopulated    username=${CONFIG}[USERNAME]    password=${CONFIG}[PASSWORD]

Forgot Password Successfully
    [Documentation]    Verify that a user can reset their password.
    [Tags]             happy_path auth
    ${CONFIG}=    Load Configuration
    Click Forgot Password Link
    Input Forgot Password Email    ${CONFIG}[USERNAME]
    Click Send Email to Reset Password
    [Teardown]        Close Forgot Password Window

Forgot Username
    [Documentation]    Verify that a user can retrieve their username.
    [Tags]             happy_path auth
    ${CONFIG}=    Load Configuration
    Click Forgot Password Link
    Click Forgot Username Link
    Input Forgot Username Email    ${CONFIG}[USERNAME]
    Click Send Email to Retrieve Username
    Validate Forgot Password Email Sent Success Message    expected_message=An email has been sent to you with your username.
    [Teardown]        Close Forgot Password Window


Login Successfully and Go Back to Login Page
    [Documentation]    Verify that a user can log in successfully and go back to the login page.
    [Tags]             happy_path auth
    ${CONFIG}=    Load Configuration
    Validate User on Login Page
    Enter Login Credentials And Click Login Button    username=${CONFIG}[USERNAME]    password=${CONFIG}[PASSWORD]
    Validate On Home Screen
    Go To    url=${CONFIG}[BASE_URL]/login
    Validate On Home Screen
    [Teardown]        Logout

Logout
    [Documentation]    Verify that a user can log out.
    [Tags]             happy_path auth
    ${CONFIG}=    Load Configuration
    Validate User on Login Page
    Enter Login Credentials And Click Login Button    username=${CONFIG}[USERNAME]    password=${CONFIG}[PASSWORD]
    Validate On Home Screen
    Logout

### ************************************************ ###
###                Negative Path Tests               ###
### ************************************************ ###
Login With Invalid Username
    [Documentation]    Verify that a user cannot log in with an invalid username.
    [Tags]             negative_path auth
    ${CONFIG}=    Load Configuration
    Input Username    invalid_username
    Input Password    ${CONFIG}[ADMIN_PASSWORD]
    Validate Incorrect Credentials Message    expected_message=Incorrect username

Login With Invalid Password
    [Documentation]    Verify that a user cannot log in with an invalid password.
    [Tags]             negative_path auth
    ${CONFIG}=    Load Configuration
    Input Username    ${CONFIG}[ADMIN_USERNAME]
    Input Password    invalid_password
    Validate Incorrect Credentials Message    expected_message=Incorrect password

Login With Invalid Username and Password
    [Documentation]    Verify that a user cannot log in with an invalid username and password.
    [Tags]             negative_path auth
    Input Username    invalid_username
    Input Password    invalid_password
    Validate Incorrect Credentials Message    expected_message=Incorrect username or password

Login With Invalid Password Repeatedly
    [Documentation]    Verify that a user gets locked out after entering an invalid password multiple times.
    [Tags]             negative_path auth security functional
    ${CONFIG}=    Load Configuration
    FOR    ${i}    IN RANGE    1    4
        Input Username    ${CONFIG}[USERNAME]
        Input Password    invalid_password
        Validate Incorrect Credentials Message    expected_message=Invalid password
    END
    Validate User Too Many Attempts Message    expected_message=You have exceeded the maximum number of login attempts. Please try again later.

Login With Empty Username and Password
    [Documentation]    Verify that a user cannot log in with an empty username and password.
    [Tags]             negative_path auth
    Input Username    ${EMPTY}
    Input Password    ${EMPTY}
    Validate Login Button Disabled   # With Not knowing how the login behaves with empty 
    # Validate Error Message    # Another way to test is to check if an error message is displayed

Forgot Password with Invalid Email
    [Documentation]    Verify that a user cannot reset their password with an invalid email.
    [Tags]             negative_path auth
    Click Forgot Password Link
    Input Forgot Password Email    invalid_email
    Click Send Email to Reset Password
    Validate Incorrect Forgot Password Email Message    expected_message=Email address not found
    [Teardown]        Close Forgot Password Window

Forgot Username with Invalid Email
    [Documentation]    Verify that a user cannot retrieve their username with an invalid email.
    [Tags]             negative_path auth
    Click Forgot Password Link
    Click Forgot Username Link
    Input Forgot Username Email    invalid_email
    Click Send Email to Retrieve Username
    Validate Incorrect Forgot Username Email Message    expected_message=Email address not found
    [Teardown]        Close Forgot Password Window
