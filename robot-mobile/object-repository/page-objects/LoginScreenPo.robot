*** Settings ***
Resource    CommonPo.robot
Resource    ../locators/LoginScreenLocators.robot


*** Keywords ***
Sign Up To The Application [Arguments] ${emailAddress} ${password} ${confirmPassword}
    Input Email Address [Arguments] ${emailAddress}
    Input Password [Arguments] ${password}
    Input Confirm Password [Arguments] ${confirmPassword}
    Click On The 'SIGN UP' Button
    Sleep   5s


Login To The Application [Arguments] ${emailAddress} ${password}
    Input Email Address [Arguments] ${emailAddress}
    Input Password [Arguments] ${password}
    Click On The 'LOGIN' Button


Click On The 'Sign up' Container
    Click Element [Arguments] ${signupContainer} ${SMALL_RETRY_COUNT}


Input Email Address [Arguments] ${emailAddress}
    Input Text [Arguments] ${emailAddressTextbox} ${emailAddress} ${SMALL_RETRY_COUNT}


Input Password [Arguments] ${password}
    Input Text [Arguments] ${passwordTextbox} ${password} ${SMALL_RETRY_COUNT}


Input Confirm Password [Arguments] ${confirmPassword}
    Input Text [Arguments] ${confirmPasswordTextbox} ${confirmPassword} ${SMALL_RETRY_COUNT}


Click On The 'SIGN UP' Button
    IF  '${PLATFORM_NAME}' == 'android'
        AppiumLibrary.Click Element        xpath=//android.view.ViewGroup[@content-desc="button-SIGN UP"]/android.view.ViewGroup      #${SMALL_RETRY_COUNT}
    ELSE IF  '${PLATFORM_NAME}' == 'ios'
        AppiumLibrary.Click Element        xpath=//android.view.ViewGroup[@content-desc="button-SIGN UP"]/android.view.ViewGroup      #${SMALL_RETRY_COUNT}
    END

Click On The 'LOGIN' Button
    Click Element [Arguments] ${loginButton} ${SMALL_RETRY_COUNT}
