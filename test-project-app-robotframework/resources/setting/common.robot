*** Settings ***
Resource  import.robot

*** Keywords ***
Click Element When Ready
        [Arguments]    ${locator}
        AppiumLibrary.Wait Until Page Contains Element       ${locator}          timeout=10s
        AppiumLibrary.Click Element    ${locator}  
        
Input data When Ready
        [Arguments]    ${locator}    ${data}
        AppiumLibrary.Wait Until Page Contains Element       ${locator}          timeout=10s
        AppiumLibrary.Input Text    ${locator}    ${data}

Open application ebay for android
       AppiumLibrary.Open Application        http://localhost:4723/wd/hub
        ...    platformName=Android
        ...    deviceName=Pixel 4 API 28
        ...    platformVersion=9.0
        ...    appPackage=com.ebay.mobile
        ...    appActivity=com.ebay.mobile.home.impl.main.MainActivity

Open application
        ${capability}    BuiltIn.Create Dictionary    deviceName=${deviceName}    
        ...    platformName=${platformName}    
        ...    platformVersion=${platformVersion}    
        #...    appActivity=${appActivity}    
        ...    automationName=${automationName}    
        ...    tags=${tags}  
        ...    system_port=${system_port}
        ...    udid=${udid}
        ...    deviceName=${deviceName}
        ...    app=${app}
        AppiumLibrary.Open Application    remote_url=${remote_url}    &{capability}    

Close application
        AppiumLibrary.Close Application