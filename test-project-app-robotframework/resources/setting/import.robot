*** Settings ***
Library    AppiumLibrary
Library    String

#locator
Resource    ../../keywords/locators/home_locator.robot
Resource    ../../keywords/locators/search_locator.robot

#page
Resource    ../../keywords/pages/home_page.robot
Resource    ../../keywords/pages/search_page.robot

#Test data
Variables    ../testdata/testdata.yaml