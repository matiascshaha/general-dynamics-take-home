*** Variables ***

# Login Page Elements
${LoginUsernameInputBox}    xpath=//input[@id='email']
${LoginPasswordInputBox}    xpath=//input[@id='pass']
${LoginIncorrectCredentialsMessage}    xpath=//div[@class='incorrect-credentials-message']
${LoginUserTooManyAttemptsMessage}    xpath=//div[@class='user-locked-message']
${LoginButton}    xpath=//button[@id='loginbutton']
${LoginLogo}    xpath=//img[@class='Login_logo']

# Links on Login Page
${CreateNewAccountLink}    xpath=//a[@id='create-account-link']
${ForgotPasswordLink}    xpath=//a[@id='forgot-password-link']
${SignUpLink}    xpath=//a[@id='sign-up-link']

# Other Elements on Login Page
${RememberMeCheckbox}    xpath=//input[@id='remember_me']
${GeneralDynamicsLogo}    xpath=//img[@class='general_dynamics_logo']

# Forgot Password Page Elements
${ForgotPasswordInputBox}    xpath=//input[@id='forgot-password-email']
${ForgotPasswordImage}    xpath=//img[@class='forgot-password-image']
${ForgotPasswordSendEmailButton}    xpath=//button[@id='send-email-button']
${ForgotPasswordEmailSentMessage}    xpath=//div[@class='email-sent]
${ForgotPasswordIncorrectEmailMessage}    xpath=//div[@class='incorrect-email-message']
${ForgotPasswordCloseButton}    xpath=//button[@id='close-button']
${ForgotPasswordDescription}    xpath=//div[@class='forgot-password-description']
${ForgotUsernameLink}    xpath=//a[@id='forgot-username-link']
${ForgotUsernameSendEmailButton}    xpath=//button[@id='send-username-button']
${ForgotUsernameEmailSentMessage}    xpath=//div[@class='username-email-sent']
${ForgotUsernameIncorrectEmailMessage}    xpath=//div[@class='incorrect-username-email-message']
