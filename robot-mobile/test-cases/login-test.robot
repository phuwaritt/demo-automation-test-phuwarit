*** Settings ***
Resource         ../object-repository/page-objects/NavigationBarPo.robot
Resource         ../object-repository/page-objects/LoginScreenPo.robot
Resource         ../constants/LoginConstants.robot
Resource         ../constants/AlertConstants.robot

Test Setup       Open Test Application
Test Teardown    Close Application


*** Test Cases ***
Verify That A User Can Login To The Application Using Valid Credentials
    [Tags]    Smoke

    Navigate To Login Screen
    Login To The Application [Arguments] ${EMAIL_ADDRESS} ${PASSWORD}
    Alert Title Should Be [Arguments] ${LOGIN_SUCCESS_ALERT_TITLE}
    Alert Message Should Be [Arguments] ${LOGIN_SUCCESS_ALERT_MESSAGE}

Verify That A New User Can Sign Up To The Application
    [Tags]    Smoke

    Navigate To Login Screen
    Click On The 'Sign up' Container
    ${emailAddress}    Get Random Email Address
    Sign Up To The Application [Arguments] ${emailAddress} ${PASSWORD} ${PASSWORD}
    Alert Title Should Be [Arguments] ${SIGNED_UP_SUCCESS_ALERT_TITLE}
    Alert Message Should Be [Arguments] ${SIGNED_UP_SUCCESS_ALERT_MESSAGE}