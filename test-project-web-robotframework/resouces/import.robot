*** Settings ***
Library        SeleniumLibrary
Library        ExcelLibrary
Library        String
Resource       common.robot

#Locators
Resource       ../keywords/locators/book_cartoon_locator.robot
Resource       ../keywords/locators/main_header_locator.robot
Resource       ../keywords/locators/shopping_cart_locator.robot 
Resource       ../keywords/locators/book_cartoon_detail_locator.robot

#Pages
Resource       ../keywords/pages/main_header_page.robot
Resource       ../keywords/pages/book_cartoon_page.robot
Resource       ../keywords/pages/shopping_carts_page.robot
Resource       ../keywords/pages/book_cartoon_detail_page.robot


#Setting
Variables       ../resouces/setting/settings.yaml
