*** Settings ***
Resource        ../../keywords/pages/import.robot

*** Keywords ***
ตรวจสอบหน้าตระกร้าสินค้าว่าชื่อหนังสือถูกเพิ่มเข้ามาแล้ว 
        [Arguments]        ${book_name}            ${timeout}=${GLOBAL_TIMEOUT}
        ${product_book_name}        String.Replace String        ${shopping_cart_locator.product_book_name}        $book_name        ${book_name}
        SeleniumLibrary.Wait Until Element Is Visible            ${product_book_name}            ${timeout}
        SeleniumLibrary.Element Text Should Be        locator= ${product_book_name}            expected=${book_name}

กดเพิ่มจำนวนหนังสือในตระกร้า
        [Arguments]        ${book_name}          ${timeout}=${GLOBAL_TIMEOUT}
        ${product_book_name_qty}        String.Replace String            ${shopping_cart_locator.product_add_qty_book}        $book_name        ${book_name}
        SeleniumLibrary.Wait Until Element Is Visible            ${product_book_name_qty}        ${timeout}
        SeleniumLibrary.Click Element            ${product_book_name_qty} 
            


ตรวจสอบ value จำนวนหนังสือ
        [Arguments]        ${book_name}         ${qty}
        ${product_book_name_qty}        String.Replace String            ${shopping_cart_locator.get_value_qty_book}        $book_name        ${book_name}
        ${get_value_qty_book_name}    SeleniumLibrary.Get Value          ${product_book_name_qty}
        ${product_book_name_qty}    Builtin.Convert To String          ${get_value_qty_book_name}
        Builtin.Should Be Equal As Strings        ${product_book_name_qty}            ${qty}


กด icon delete book
        [Arguments]    ${locator}    ${timeout}=${GLOBAL_TIMEOUT}
        SeleniumLibrary.Wait Until Element Is Visible        ${locator}          ${timeout}
        SeleniumLibrary.Click Element        ${locator}

กดลบหนังสือออกจากตระกร้าโดยกดปุ่มยกเลิก
        [Arguments]        ${locator}      ${timeout}=${GLOBAL_TIMEOUT}
        SeleniumLibrary.Wait Until Element Is Visible    ${shopping_cart_locator._pop_delete}        ${timeout}
        SeleniumLibrary.Click Element            ${locator} 

กดลบหนังสือออกจากตระกร้าโดยกดปุ่มยืนยันลบรายการ
        [Arguments]        ${locator}      ${timeout}=${GLOBAL_TIMEOUT}
        SeleniumLibrary.Wait Until Element Is Visible    ${shopping_cart_locator._pop_delete}        ${timeout}
        SeleniumLibrary.Click Element            ${locator} 

ตรวจสอบ delete popup ว่าแสดงผลถูกต้อง
        [Arguments]       ${timeout}=${GLOBAL_TIMEOUT}
        SeleniumLibrary.Wait Until Element Is Visible            xpath=//div[@class='swal2-container swal2-center swal2-backdrop-show']         ${timeout} 
        ${actual_text_pop_delete}    SeleniumLibrary.Get Text    xpath=//div[@class='swal2-container swal2-center swal2-backdrop-show']
        Builtin.Should Be Equal As Strings        ${actual_text_pop_delete}            ${shopping_cart_.text_pop_delete}

ตรวจสอบว่าหนังสือถูกลบและหายไปจากตระกร้า
        [Arguments]       ${timeout}=${GLOBAL_TIMEOUT}
        SeleniumLibrary.Wait Until Element Is Visible            ${shopping_cart_locator.cart_empty}        ${timeout}
        ${actual_text_empty_cart}    SeleniumLibrary.Get Text    ${shopping_cart_locator.cart_empty}
        Builtin.Should Be Equal As Strings        ${actual_text_empty_cart}            ${shopping_cart_text.cart_empty}

ลบหนังสือทั้งหมดออกจากกระตร้าได้สำเร็จ
        [Arguments]        ${locator} 
        ${count_btn_delete}    SeleniumLibrary.Get Element Count        ${locator}
        Builtin.Log        ${count_btn_delete}
        FOR    ${count_btn_delete}    IN RANGE    0    ${count_btn_delete}
               SeleniumLibrary.Click Element        ${locator} 
               กดลบหนังสือออกจากตระกร้าโดยกดปุ่มยืนยันลบรายการ                      ${shopping_cart_locator.delete_confirm_btn}
               SeleniumLibrary.Wait Until Element Is Not Visible              xpath=//div[@class='swal2-container swal2-center swal2-backdrop-show']
        END
        ตรวจสอบว่าหนังสือถูกลบและหายไปจากตระกร้า        
