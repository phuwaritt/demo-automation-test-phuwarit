*** Settings ***
Resource      ../resouces/common.robot
Resource      ../resouces/import.robot
Test Teardown    common.Close Browser nejavu.com
*** Test Cases ***
SHP-0001 FE shopping car
        [Tags]    SHP-0001 FE shopping car
        [Documentation]        
        #Test Data
        ${tc_id}    ${td_id}    ${bookname_1}    ${bookname_qty_1}    ${bookname_2}    ${bookname_qty_2}=    common.ดึงข้อมูลที่ใช้ทดสอบจาก Excel (Test data)        row_index=5
        common.Open website nejavu.com
        main_header_page.Display logo home page (ควรเข้ามายังหน้า website ได้สำเร็จและแสดงผลหน้าแรกอย่างถูกต้อง)
        common.When opening web first close popup automatically           ${pop_frist_open_web.locator}
        common.Accept cokkie          locator=${test_cookie}            text_btn=${text_btn_box_cookie_01}
        main_header_page.Enter the name of the book and press search (กรอกชื่อหนังสือและกดค้นหา)        book_name=${set_text_search_01}
        book_cartoon_page.Book results page should be displayed (ควรแสดงหน้าผลลัพธ์หนังสือ)        book_name=${set_text_search_01}
        book_cartoon_page.กดเพิ่มหนังสือใส่ตระกร้าจากหน้า (box card) โดยตรง         book_name=${bookname_1}
        book_cartoon_page.กดเพิ่มหนังสือใส่ตระกร้าจากหน้า (box card) โดยตรง         book_name=${bookname_2}
        main_header_page.ตรวจสอบแสดง alert เมื่อเพิ่มสินค้าเข้าตะกร้าได้สำเร็จ        ${header.text_alert_add_to_cart_sucess}        ${header.locator_alert_add_to_cart_sucess}
        main_header_page.ตรวจสอบจำนวนหนังสือบนไอคอนรถเข็น    expec_qty=${header.expect_qty_to_cart}             locator=${header.qty_on_cart}  
        main_header_page.กดไปยังหน้าตระกร้าสินค้าได้สำเร็จ        locator=${header.icon_cart_btn}
        shopping_carts_page.ตรวจสอบหน้าตระกร้าสินค้าว่าชื่อหนังสือถูกเพิ่มเข้ามาแล้ว                 book_name=${bookname_1}                                
        shopping_carts_page.ตรวจสอบหน้าตระกร้าสินค้าว่าชื่อหนังสือถูกเพิ่มเข้ามาแล้ว                 book_name=${bookname_2}
        shopping_carts_page.กดเพิ่มจำนวนหนังสือในตระกร้า                  book_name=${bookname_1}
        shopping_carts_page.ตรวจสอบ value จำนวนหนังสือ                book_name=${bookname_1}         qty=${bookname_qty_1}
        shopping_carts_page.ตรวจสอบ value จำนวนหนังสือ                book_name=${bookname_2}         qty=${bookname_qty_2}
        shopping_carts_page.ลบหนังสือทั้งหมดออกจากกระตร้าได้สำเร็จ        locator=${shopping_cart_locator.icon_delete_all_book_incart}
        common.Close Browser nejavu.com
        
SHP-0002 FE shopping car
        [Tags]    SHP-0002 FE shopping car
        [Documentation]        
        #Test Data
        ${tc_id}    ${td_id}    ${bookname_1}    ${bookname_qty_1}    ${bookname_2}    ${bookname_qty_2}=    common.ดึงข้อมูลที่ใช้ทดสอบจาก Excel (Test data)        row_index=6
        common.Open website nejavu.com
        main_header_page.Display logo home page (ควรเข้ามายังหน้า website ได้สำเร็จและแสดงผลหน้าแรกอย่างถูกต้อง)
        common.When opening web first close popup automatically           ${pop_frist_open_web.locator}
        common.Accept cokkie          locator=${test_cookie}            text_btn=${text_btn_box_cookie_01}
        main_header_page.Enter the name of the book and press search (กรอกชื่อหนังสือและกดค้นหา)        book_name=${set_text_search_02}
        book_cartoon_page.Book results page should be displayed (ควรแสดงหน้าผลลัพธ์หนังสือ)        book_name=${set_text_search_02}
        book_cartoon_page.กดหนังสือมุมมองด่วนของ (box card)         book_name=${bookname_1}
        book_cartoon_page.Quick_view action add book to cart            book_name=${bookname_1}
        book_cartoon_page.กดหนังสือมุมมองด่วนของ (box card)         book_name=${bookname_2}
        book_cartoon_page.Quick_view action add book to cart         book_name=${bookname_2}
        main_header_page.ตรวจสอบแสดง alert เมื่อเพิ่มสินค้าเข้าตะกร้าได้สำเร็จ        ${header.text_alert_add_to_cart_sucess}        ${header.locator_alert_add_to_cart_sucess}
        main_header_page.ตรวจสอบจำนวนหนังสือบนไอคอนรถเข็น    expec_qty=${header.expect_qty_to_cart}             locator=${header.qty_on_cart}  
        main_header_page.กดไปยังหน้าตระกร้าสินค้าได้สำเร็จ        locator=${header.icon_cart_btn}
        shopping_carts_page.ตรวจสอบหน้าตระกร้าสินค้าว่าชื่อหนังสือถูกเพิ่มเข้ามาแล้ว                 book_name=${bookname_1}                                
        shopping_carts_page.ตรวจสอบหน้าตระกร้าสินค้าว่าชื่อหนังสือถูกเพิ่มเข้ามาแล้ว                 book_name=${bookname_2}
        shopping_carts_page.ตรวจสอบ value จำนวนหนังสือ                book_name=${bookname_1}         qty=${bookname_qty_1}
        shopping_carts_page.ตรวจสอบ value จำนวนหนังสือ                book_name=${bookname_2}         qty=${bookname_qty_2}
        shopping_carts_page.ลบหนังสือทั้งหมดออกจากกระตร้าได้สำเร็จ        locator=${shopping_cart_locator.icon_delete_all_book_incart}
        common.Close Browser nejavu.com

        