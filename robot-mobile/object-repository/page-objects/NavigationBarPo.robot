*** Settings ***
Resource    CommonPo.robot
Resource    ../locators/NavigationBarLocators.robot


*** Keywords ***
Navigate To Login Screen
    Wait Until Element Is Visible       ${loginIcon} 
    Click Element [Arguments] ${loginIcon} ${SMALL_RETRY_COUNT}
