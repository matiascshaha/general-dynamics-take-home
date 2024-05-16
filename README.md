# Automated Testing Assignment

This project is an automation suite for a simple login page and its functionality, including successful login, incorrect credentials, and forgot password functionality. The tests are written using Robot Framework and utilize Allure for reporting.

The test cases written in Robot syntax can be found in the `TestSuites/Login.robot` file.

## Integration with a Larger Test Suite

To integrate these tests into a larger test suite for the full application, I would ensure that reusable functions are general enough to be used by other developers for various use cases, promoting adaptability. Key steps include:

- **Modular Design**: Break down tests into reusable keywords and resource files that can be shared across different test suites.
- **Documentation**: Auto-generate documentation to make test files clear and easy to understand, facilitating ease of use and scalability. Use `libdoc` for Robot Framework to generate documentation (e.g., `libdoc path/to/your/resourcefile.resource output/documentation.html`).
- **Adopt Standards**: Utilize auto-linting tools like `black` to format code according to PEP 8 industry standards.
- **Reporting**: Integrate Allure reporting to generate detailed test reports for analysis and debugging.
- **Continuous Integration**: Integrate tests into CI/CD pipelines to ensure automated testing on code changes.

## Project Structure

The project structure is organized as follows:

```plaintext
📦 general-dynamics-take-home
 ┣ 📂 results
 ┃ ┣ 📜 log.html
 ┃ ┣ 📜 output.xml
 ┃ ┗ 📜 report.html
 ┣ 📂 src
 ┃ ┣ 📂 keywords
 ┃ ┃ ┣ 📂 PageObject
 ┃ ┃ ┃ ┣ 📂 Locators
 ┃ ┃ ┃ ┃ ┣ 📜 HomeLocators.resource
 ┃ ┃ ┃ ┃ ┗ 📜 LoginLocators.resource
 ┃ ┃ ┃ ┣ 📜 HomePage.resource
 ┃ ┃ ┃ ┗ 📜 LoginPage.resource
 ┃ ┃ ┣ 📜 allure.resource
 ┃ ┃ ┣ 📜 browser.resource
 ┃ ┃ ┗ 📜 configLoader.resource
 ┃ ┣ 📂 output
 ┃ ┃ ┣ 📂 allure
 ┃ ┃ ┃ ┗ Various allure report files
 ┃ ┃ ┗ 📂 assets
 ┃ ┃ ┃ ┗ 📜 suite_failed_screenshot.png
 ┃ ┣ 📂 TestSuites
 ┃ ┃ ┣ 📜 Login.robot
 ┃ ┃ ┗ 📜 __init__.py
 ┃ ┗ 📜 config.yaml
 ┣ 📜 .gitignore
 ┣ 📜 poetry.lock
 ┗ 📜 pyproject.toml
```

## Features

- **Login Functionality Tests**: Tests for successful login, invalid login attempts, and remember me functionality.
- **Forgot Password Tests**: Tests for forgot password functionality, including valid and invalid email addresses.
- **Validation Tests**: Ensures the presence of essential elements on the login and forgot password pages.
- **Allure Reporting**: Generates detailed reports for test runs.

## Test Cases

### Smoke Tests

1. **Check Login Elements are Present**
   - **Expected Outcome**: All login elements (username input, password input, login button, sign up link, forgot password link, and logo) are visible.

2. **Forgot Password Elements are Present**
   - **Expected Outcome**: All forgot password elements (image, description, email input box, send email button, and forgot username link) are visible.

### Happy Path Tests

1. **Login Successfully**
   - **Expected Outcome**: User can log in successfully with valid credentials and is redirected to the home screen.

2. **Remember Me Functionality**
   - **Expected Outcome**: The remember me functionality works as expected, prepopulating the username and password fields on subsequent visits.

3. **Forgot Password Successfully**
   - **Expected Outcome**: User can reset their password with a valid email.

4. **Forgot Username**
   - **Expected Outcome**: User can retrieve their username with a valid email.

5. **Login Successfully and Go Back to Login Page**
   - **Expected Outcome**: User can log in successfully and navigate back to the login page, which should redirect to the home screen.

6. **Logout**
   - **Expected Outcome**: User can log out successfully.

### Negative Path Tests

1. **Login With Invalid Username**
   - **Expected Outcome**: User cannot log in with an invalid username, and an appropriate error message is displayed.

2. **Login With Invalid Password**
   - **Expected Outcome**: User cannot log in with an invalid password, and an appropriate error message is displayed.

3. **Login With Invalid Username and Password**
   - **Expected Outcome**: User cannot log in with both an invalid username and password, and an appropriate error message is displayed.

4. **Login With Invalid Password Repeatedly** (if the system has a lockout feature)
   - **Expected Outcome**: User is locked out after multiple failed login attempts.

5. **Login With Empty Username and Password**
   - **Expected Outcome**:
     - **Validate Login Button Disabled**: If the login button is disabled when the username and password are empty.
     - **Validate Error Message**: If the login button is enabled and an error message is displayed.
     - **Validate No Error Message**: If the login button is enabled and no error message is displayed, test if it's clickable and nothing happens.

6. **Forgot Password with Invalid Email**
   - **Expected Outcome**: User cannot reset their password with an invalid email, and an appropriate error message is displayed.

7. **Forgot Username with Invalid Email**
   - **Expected Outcome**: User cannot retrieve their username with an invalid email, and an appropriate error message is displayed.