*** Settings ***
Library        SeleniumLibrary
Library        ExcelLibrary
Library        String
Resource       common.robot

#Locators
Resource       ../../keywords/locators/book_cartoon_locator.robot
Resource       ../../keywords/locators/main_header_locator.robot
Resource       ../../keywords/locators/shopping_cart_locator.robot 

#Pages
Resource       ${CURDIR}/main_header_page.robot
Resource       ${CURDIR}/book_cartoon_page.robot
Resource       ${CURDIR}/shopping_carts_page.robot

#Features
Resource       ../../keywords/features/shopping_carts.robot

#Setting
Variables       ../../resouces/setting/settings.yaml
