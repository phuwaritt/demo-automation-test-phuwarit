*** Settings ***
Resource    ../../resources/setting/import.robot
Resource    ../../resources/setting/common.robot
*** Keywords ***
Close popup when frist open app
        [Arguments]        ${locator}
        common.Click Element When Ready    ${locator}

Click search box
        [Arguments]        ${locator}
        common.Click Element When Ready    ${locator}


Check displayed home page success
        [Arguments]    ${locator}
        AppiumLibrary.Element Should Be Visible        ${locator}        timeout=10s
        
