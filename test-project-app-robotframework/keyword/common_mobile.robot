*** Keywords ***
Open application
    [Arguments]    ${auto_allow_alert}=${TRUE}      ${no_reset}=${FALSE}
    BuiltIn.Log to console       doppio_farm=${doppio_farm}
    BuiltIn.Set Library search order    DobbyAppCommon     AppiumLibrary
    IF  '${doppio_farm}'=='True'
        ${pool_to_use}              BuiltIn.Evaluate        ${PABOTEXECUTIONPOOLID}
        ${delay_time}               BuiltIn.Evaluate    ${pool_to_use}*10
        Sleep                       ${delay_time}s
        DobbyAppCommon.Init mobile farm configuration
        ${wdaLocalPort_r}=       random_utils.Random With Range       ${pool_to_use}
        ${system_port}=          BuiltIn.Set variable    ${wdaLocalPort_r}
        ${showXcodeLog}=         BuiltIn.Set variable    ${wdaLocalPort_r}
        ${full_reset}=    BuiltIn.Set variable    ${true}
    ELSE
        ${full_reset}=    BuiltIn.Set variable    ${false}
    END
    
    IF    ${auto_allow_alert}
        ${value_autoGrantPermissions}    BuiltIn.Set variable    ${TRUE}
        ${value_autoAcceptAlerts}        BuiltIn.Set variable    ${TRUE}
        ${value_autoDismissAlerts}       BuiltIn.Set variable    ${TRUE}
    ELSE
        ${value_autoGrantPermissions}    BuiltIn.Set variable    ${FALSE}
        ${value_autoAcceptAlerts}        BuiltIn.Set variable    ${FALSE}
        ${value_autoDismissAlerts}       BuiltIn.Set variable    ${FALSE}
    END

    &{capability}       BuiltIn.Create dictionary   
    ...                 appium:automationName=${automationName}
    ...                 appium:platformName=${platformName}
    ...                 appium:platformVersion=${platformVersion}
    ...                 appium:deviceName=${deviceName}
    ...                 appium:udid=${udid}
    ...                 appium:app=${app}
    ...                 newCommandTimeout=${1800}
    ...                 autoGrantPermissions=${value_autoGrantPermissions}
    ...                 noReset=${no_reset}
    ...                 unicodeKeyboard=${FALSE}
    ...                 resetKeyboard=${TRUE}
    ...                 autoAcceptAlerts=${value_autoAcceptAlerts}
    ...                 autoDismissAlerts=${value_autoDismissAlerts}
    ...                 allowInvisibleElements=${TRUE}
    ...                 waitForIdleTimeout=${100}
    ...                 appium:appWaitDuration=${500000}
    ...                 appium:disableWindowAnimation=${TRUE}
    ...                 appium:fullReset=${full_reset}
    ...                 appium:adbExecTimeout=${200000}
    ...                 appium:isHeadless=${FALSE}
    ...                 appium:systemPort=${system_port}
    ...                 appium:uiautomator2ServerLaunchTimeout=${90000}

    IF  '${doppio_farm}'=='True' and '${platformName}'=='ios'
        Collections.Set to dictionary       ${capability}    
        ...     appium:showXcodeLog=${TRUE}
        ...     appium:wdaLocalPort=${system_port}
        ...     appium:usePrebuiltWDA=${TRUE}
        
    END

    BuiltIn.Log      ${capability}
    BuiltIn.Log to console     ${capability}
    AppiumLibrary.Close all applications
    FOR     ${i}    IN RANGE    1   4
        ${is_app_open}=     BuiltIn.Run keyword and return status   AppiumLibrary.Open application
                                        ...                 remote_url=${remote_url}
                                        ...                 &{capability}
        BuiltIn.Exit for loop if        ${is_app_open}
    END
    BuiltIn.Should be true  ${is_app_open}   msg="Failed to open the app after 3 retry"
    IF    '${no_reset}'=='False'
        common_mobile.Tap not now on update popup
        login_page.Switch language
        login_page.Tap get start
        IF    ${auto_allow_alert}
            login_page.Tap allow location service
        ELSE
            login_page.Tap allow notification
            login_page.Tap allow location service    ${auto_allow_alert}
            login_page.Tap allow to track activity
        END
    END

Close application
    [Documentation]     main teardown for app , this keyword will be called by CardX default test teardown in common
    BuiltIn.Run keyword and ignore error    AppiumLibrary.Capture page screenshot
    BuiltIn.Run keyword and ignore error    AppiumLibrary.Log source
    AppiumLibrary.Close all applications