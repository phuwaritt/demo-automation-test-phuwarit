*** Settings ***
Resource        import.robot

*** Keywords ***
Display logo home page (ควรเข้ามายังหน้า website ได้สำเร็จและแสดงผลหน้าแรกอย่างถูกต้อง)
        [Arguments]    ${timeout}=${GLOBAL_TIMEOUT}    
        SeleniumLibrary.Wait Until Element Is Visible        ${header.home_logo}        ${timeout}

Enter the name of the book and press search (กรอกชื่อหนังสือและกดค้นหา)
        [Arguments]        ${book_name}        ${timeout}=${GLOBAL_TIMEOUT}  
        #SeleniumLibrary.Wait Until Element Is Not Visible        ${test_cookie}        ${timeout}
        common.Input text element when read        ${header.search_box}           ${book_name}
        SeleniumLibrary.Wait Until Element Is Visible        ${header.search_box_button}            ${timeout}
        #Press Keys         ${header.search_box}        ENTER
        common.Click element when read             ${header.search_box_button}

ตรวจสอบแสดง alert เมื่อเพิ่มสินค้าเข้าตะกร้าได้สำเร็จ
        [Arguments]        ${expec_text}        ${locator}        ${timeout}=${GLOBAL_TIMEOUT}
        SeleniumLibrary.Wait Until Element Is Visible            ${locator}        ${timeout}
        #SeleniumLibrary.Element Should Be Visible                ${locator}
        ${actual_result}    SeleniumLibrary.Get Text             ${locator}
        Builtin.Log        ${actual_result} 
        Builtin.Should Be Equal As Strings            ${actual_result}            ${expec_text}

ตรวจสอบจำนวนหนังสือบนไอคอนรถเข็น
        [Arguments]        ${expec_qty}        ${locator}
        SeleniumLibrary.Wait Until Element Is Not Visible     ${header.locator_alert_add_to_cart_sucess}
        SeleniumLibrary.Wait Until Element Is Enabled        ${locator}
        ${actual_result}    SeleniumLibrary.Get Text            ${locator}
        Builtin.Log    ${actual_result} 
        Builtin.Should Be Equal As Strings            ${actual_result}            ${expec_qty}

กดไปยังหน้าตระกร้าสินค้าได้สำเร็จ
        [Arguments]    ${locator}        ${timeout}=${GLOBAL_TIMEOUT}
        SeleniumLibrary.Wait Until Element Is Not Visible    ${header.locator_alert_add_to_cart_sucess}
        SeleniumLibrary.Wait Until Element Is Visible            ${locator}        ${timeout}
        common.Click element when read            ${locator}
        #ตรวจสอบว่าเข้ามายังหน้าไปสำเร็จหรือไม่
        SeleniumLibrary.Element Should Be Visible            ${shopping_cart_locator_page}
        ${text_page_cart}       SeleniumLibrary.Get Text     ${shopping_cart_locator_page} 
        Builtin.Should Be Equal As Strings            ${text_page_cart}            ตะกร้าของฉัน
