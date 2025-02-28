*** Settings ***
Resource    ../../configs/ApplicationConfigs.robot
Resource    ../../configs/AppiumConfigs.robot

Library    String
Library    OperatingSystem
Library    AppiumLibrary            timeout=30
Library    DebugLibrary
Library    pabot.PabotLib
Library    SeleniumLibrary


*** Keywords ***
Open Test Application
    [Documentation]    Open the testing application
    
    Run Keyword If    '${PLATFORM_NAME}' == 'android'    Open Android Application
    Run Keyword If    '${PLATFORM_NAME}' == 'ios'    Open IOS Application


Open Android Application
    [Documentation]    Open the Android application

    Acquire Value Set    set${PABOTEXECUTIONPOOLID}

    ${APPIUM_SERVER_URL}     Get Value From Set    remoteUrl
    ${ANDROID_AUTOMATION_NAME}    Get Value From Set    automationName 
    ${ANDROID_PLATFORM_NAME}    Get Value From Set   platformName
    ${ANDROID_PLATFORM_VERSION}  Get Value From Set    platformVersion
    ${ANDROID_DEVICE_NAME}    Get Value From Set    deviceName
    ${ANDROID_SYSTEM_PORT}    Get Value From Set    systemPort
    ${ANDROID_UDID}    Get Value From Set    udid
    ${ANDROID_APP}     Get Value From Set    app
    ${ANDROID_APP_PACKAGE}    Get Value From Set    appPackage
    ${ANDROID_APP_ACTIVITY}    Get Value From Set    appActivity

    Open Application    ${APPIUM_SERVER_URL}    
    ...    automationName=${ANDROID_AUTOMATION_NAME}    
    ...    platformName=${ANDROID_PLATFORM_NAME}    
    ...    platformVersion=${ANDROID_PLATFORM_VERSION}    
    ...    deviceName=${ANDROID_DEVICE_NAME}    
    ...    app=${ANDROID_APP}    
    ...    appPackage=${ANDROID_APP_PACKAGE}    
    ...    appActivity=${ANDROID_APP_ACTIVITY}
    ...    systemPort=${ANDROID_SYSTEM_PORT} 
    ...    udid=${ANDROID_UDID}
    Set Appium Timeout    ${TIMEOUT}
    Sleep   10
    AppiumLibrary.Capture Page Screenshot


Open IOS Application
    [Documentation]    Open the iOS application

    Acquire Value Set    set${PABOTEXECUTIONPOOLID}

    ${APPIUM_SERVER_URL}     Get Value From Set    remote_url
    ${IOS_AUTOMATION_NAME}    Get Value From Set    automationName 
    ${IOS_PLATFORM_NAME}    Get Value From Set   platformName
    ${IOS_PLATFORM_VERSION}  Get Value From Set    platformVersion
    ${IOS_DEVICE_NAME}    Get Value From Set    deviceName
    ${IOS_SYSTEM_PORT}    Get Value From Set    system_port
    ${IOS_UDID}    Get Value From Set    udid
    ${IOS_APP_APP}  Get Value From Set    app
    ${IOS_wda_port}  Get Value From Set    wdaLocalPort

    Open Application    ${APPIUM_SERVER_URL}    
    ...    automationName=${IOS_AUTOMATION_NAME}    
    ...    platformName=${IOS_PLATFORM_NAME}    
    ...    platformVersion=${IOS_PLATFORM_VERSION}    
    ...    deviceName=${IOS_DEVICE_NAME}    
    ...    app=${IOS_APP_APP}    
    # ...    systemPort=${IOS_SYSTEM_PORT}
    ...    udid=${IOS_UDID}
    ...    appium:usePrebuiltWDA=${TRUE}
    ...    appium:wdaLocalPort=${IOS_SYSTEM_PORT}
    ...    appium:showXcodeLog=${TRUE}
    ...    noReset=${TRUE}
    # ...    fullReset=${FALSE}

    # Set Appium Timeout    ${TIMEOUT}
    Sleep   10
    ##AppiumLibrary.Capture Page Screenshot


Get Random Email Address
    [Documentation]    Return random email address
    
    ${randomText}    Get Random Text
    ${randomEmailAddress}    Set Variable    ${randomText}@mailinator.com
    Return From Keyword     ${randomEmailAddress}


Get Random Text
    [Documentation]    Return random text value
      
    ${randomText}    Generate Random String      8      [LETTERS]
    Return From Keyword     ${randomText}
 
      
Get Current Epoch Time
    [Documentation]    Return current epoch time
    
    ${randomText}    Get Time    epoch
    Return From Keyword     ${randomText}


Element Should Be Contained In The Page [Arguments] ${locator} ${retryScale}
    [Documentation]    Verify that the element should be contained in the page

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    AppiumLibrary.Wait Until Page Contains Element    ${locator}
    

Element Should Not Be Contained In The Page [Arguments] ${locator} ${retryScale}
    [Documentation]    Verify that the element should not be contained in the page

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    AppiumLibrary.Wait Until Page Does Not Contain Element   ${locator}


Element Should Be Visible [Arguments] ${locator} ${retryScale}
    [Documentation]    Verify that the element should be visible

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    AppiumLibrary.Wait Until Element Is Visible    ${locator}


Element Should Not Be Visible [Arguments] ${locator} ${retryScale}
    [Documentation]    Verify that the element should not be visible

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    AppiumLibrary.Wait Until Page Does Not Contain Element   ${locator}


Click Element [Arguments] ${locator} ${retryScale}
    [Documentation]    Click on a given button

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    AppiumLibrary.Wait Until Element Is Visible    ${locator}
    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    AppiumLibrary.Click Element  ${locator}
    
    
Element Text Should Be [Arguments] ${locator} ${text} ${retryScale}
    [Documentation]    Validate the text of an element

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    AppiumLibrary.Wait Until Element Is Visible    ${locator}
    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    AppiumLibrary.Element Text Should Be    ${locator}    ${text}    


Input Text [Arguments] ${textBoxLocator} ${text} ${retryScale}
    [Documentation]    Input text into a text box

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    AppiumLibrary.Wait Until Element Is Visible    ${textBoxLocator}
    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    AppiumLibrary.Input Text    ${textBoxLocator}    ${text}


Alert Title Should Be [Arguments] ${alertTitle}
    [Documentation]    Validate the text of the alert title

    ${androidAlertTitleLocator}    Set Variable    id=android:id/alertTitle
    ${iosAlertTitleLocator}    Set Variable    accessibility_id=${alertTitle}
    IF  '${PLATFORM_NAME}' == 'android'
        AppiumLibrary.Wait Until Element Is Visible    ${androidAlertTitleLocator}
    ELSE IF  '${PLATFORM_NAME}' == 'ios'
        AppiumLibrary.Wait Until Element Is Visible    ${iosAlertTitleLocator}
    END

Alert Message Should Be
    [Arguments]        ${EXPECTED}
    [Documentation]    Validate the text of the alert message

    ${androidAlertMessageLocator}    Set Variable    id=android:id/message
    ${iosAlertMessageLocator}    Set Variable    accessibility_id=You successfully signed up!
    IF  '${PLATFORM_NAME}' == 'android'
        AppiumLibrary.Wait Until Element Is Visible   ${androidAlertMessageLocator}
        AppiumLibrary.Element Text Should Be          ${androidAlertMessageLocator}      ${EXPECTED}
    ELSE IF  '${PLATFORM_NAME}' == 'ios'
        AppiumLibrary.Wait Until Element Is Visible    ${iosAlertMessageLocator}
    END