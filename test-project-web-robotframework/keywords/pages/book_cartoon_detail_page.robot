*** Settings ***
Resource        ../../resouces/import.robot   

*** Keywords ***
Check ว่ามายังหน้ารายละเอียดหนังสือของชื่อหนังสือที่เลือกได้สำเร็จ
        [Arguments]        ${book_name}        ${tomeout}=${GLOBAL_TIMEOUT}
        ${book_detail_page}        string.Replace String         ${book_cartoon_detail_locator.page_check_book_detail_from_bookname}    $book_name        ${book_name}
        SeleniumLibrary.Wait Until Element Is Visible            ${book_detail_page}

กดเพิ่มจำนวนหนังสือในหน้าหน้ารายละเอียดหนังสือ
        common.Click element when read                ${book_cartoon_detail_locator.btn_add_count_book}  
        
        
กดลดจำนวนหนังสือในหน้าหน้ารายละเอียดหนังสือ
        common.Click element when read              ${book_cartoon_detail_locator.btn_sub_count_book}

ตรวจสอบ value จำนวนหนังสือ
        [Arguments]        ${expac}        ${locator}
        ${actual}    SeleniumLibrary.Get Value        ${locator}
        Builtin.Should Be Equal As Strings    ${actual}    ${expac} 

กดปุ่มเพิ่มหนังสือเข้าสู่ตระกร้า
        common.Click element when read             ${book_cartoon_detail_locator.btn_add_to_cart} 

Go back to the page
        SeleniumLibrary.Go Back