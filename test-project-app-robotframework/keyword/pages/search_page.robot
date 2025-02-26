*** Settings ***
Resource    ../../resources/setting/import.robot
Resource    ../../resources/setting/common.robot

*** Keywords ***
Input data on search box and press search
        [Arguments]    ${locator}    ${keyword}
        common.Input data When Ready        ${locator}    ${keyword}
        Press Keycode           66    #Enter
        
Check come to the search results page success
        [Arguments]        ${locator}
        AppiumLibrary.Element Should Be Visible        ${locator}        timeout=10s

Verify record first and check that the price is not 0
        [Arguments]        ${record}    ${actual_locator}        ${expected_result}
        ${actual_locator}    String.Replace String              ${actual_locator}         $record            ${record}
        ${actual_results}=    AppiumLibrary.Get Text        ${actual_locator}
        #Log To Console      ${actual_results}    
        #Log To Console    ${expected_result} 
        Builtin.Should Not Be Equal        ${actual_results}        ${expected_result}        

Check header search results page show text that matches the keywords you type in your search
        [Arguments]    ${locator}       ${expac}
        AppiumLibrary.Element Should Contain Text        ${locator}         ${expac}
