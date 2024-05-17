*** Settings ***
Resource        ../../resouces/import.robot       

*** Keywords ***
Book results page should be displayed (ควรแสดงหน้าผลลัพธ์หนังสือ)
        [Arguments]    ${book_name}    ${timeout}=${GLOBAL_TIMEOUT}
        SeleniumLibrary.Wait Until Element Is Visible          xpath=//span[contains(text(),': ${book_name}')]         timeout=${timeout}
        Run Keyword And Continue On Failure    SeleniumLibrary.Page Should Contain Element            xpath=//span[contains(text(),': ${book_name}')]

กดเพิ่มหนังสือใส่ตระกร้าจากหน้า (box card) โดยตรง 
        [Arguments]    ${book_name}    ${timeout}=${GLOBAL_TIMEOUT}
        #แทนที่ String ใน xpath locator $book_name ที่ประกาศใน variables ด้วย Arguments ${book_name}
        ${add_to_cart_btn}    String.Replace String              ${book_cartoon_locator.add_cart_btn}        $book_name            ${book_name}
        SeleniumLibrary.Wait Until Element Is Visible            ${add_to_cart_btn}            ${timeout}
        common.Click element when read            ${add_to_cart_btn}

#Role มุมมองด่วน
กดหนังสือมุมมองด่วนของ (box card)
        [Arguments]    ${book_name}    ${timeout}=${GLOBAL_TIMEOUT}
             ${Clicky_bookname_quick_view_btn}    String.Replace String              ${book_cartoon_locator.quick_view_btn_v2}        $book_name            ${book_name}
             Sleep    time_=0.5s
             SeleniumLibrary.Wait Until Element Is Visible            ${Clicky_bookname_quick_view_btn}                ${timeout}
             Sleep    time_=1s
             SeleniumLibrary.Click Element               ${Clicky_bookname_quick_view_btn}
             
Quick_view action add book to cart
        [Arguments]    ${book_name}    ${timeout}=${GLOBAL_TIMEOUT}
        #Click to cart
        ${pop_quick_view_bookname_v2}    String.Replace String              ${book_cartoon_locator.popup_product_by_bookname}         $book_name            ${book_name}
        SeleniumLibrary.Wait Until Element Is Visible                       ${pop_quick_view_bookname_v2}        ${timeout}
        common.Click element when read                             ${book_cartoon_locator.quick_view_btn_add_cart}
        #Close quick_view
        common.Click element when read                          ${book_cartoon_locator.close_quick_view_btn}
        #SeleniumLibrary.Wait Until Element Is Not Visible    ${book_cartoon_locator.close_quick_view_btn}                ${timeout}

Quick_view action add book to cart V2
        [Arguments]    ${book_name}    ${timeout}=${GLOBAL_TIMEOUT}
        ${pop_quick_view_bookname_v2}    String.Replace String              ${book_cartoon_locator.popup_product_by_bookname}         $book_name            ${book_name}
        
        SeleniumLibrary.Wait Until Element Is Visible    ${pop_quick_view_bookname_v2}    ${timeout}

        ${element}=    Get WebElement    ${pop_quick_view_bookname_v2}
        Execute JavaScript    arguments[0].scrollIntoView(true);    ${element}
        
        ${button_xpath}=    Set Variable        ${book_cartoon_locator.quick_view_btn_add_cart}
        #SeleniumLibrary.Click Element        ${button_xpath}                ${timeout}
        
        ${button_element}=    Get WebElement    ${button_xpath}
        Execute JavaScript    arguments[0].click();    ${button_element}

#Role from book detail
Cick book detail from book book_name
        [Arguments]    ${book_name}    ${tomeout}=${GLOBAL_TIMEOUT}
        ${book_detail_by_bookname}    String.Replace String           ${book_cartoon_locator.btn_go_book_detail_from_bookname}         $book_name        ${book_name}
        SeleniumLibrary.Wait Until Element Is Visible    ${book_detail_by_bookname}        ${tomeout}     
        SeleniumLibrary.Click Element        ${book_detail_by_bookname}
        