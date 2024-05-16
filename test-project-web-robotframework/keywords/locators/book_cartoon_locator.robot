*** Variables ***
${book_cartoon_locator.book_cartoon_page}               xpath=//span[contains(text(),'ผลการค้นหา')]
${book_cartoon_locator.book_name_for_search}            BLEACH เทพมรณะ
${book_cartoon_locator.add_cart_btn}                    xpath=//img[@alt='$book_name']/../../../../..//button[@id='quick-cart-button']
${book_cartoon_locator.add_cart_quick_view_btn}         xpath=//button[@id='add-to-cart-quickview-button']
${book_cartoon_locator.close_quick_view_btn}            xpath=//body[@id='top']/main/div[@class='modal-type1 modal-overlay active']/div[@id='modal-type1']/a[@class='close-modal']/*[1]
${book_cartoon_locator.popup_product_quick_view}        xpath=//div[@class='modal-type1 modal-overlay']
${book_cartoon_locator.popup_product_by_bookname}       xpath=//strong[contains(text(),'$book_name')]
${book_cartoon_locator.quick_view_btn}                  xpath=//img[@alt='$book_name']/../../../../..//button[@modaltarget='modal-type1']
${book_cartoon_locator.quick_view_btn_v2}               xpath=//h5[contains(text(),'$book_name')]/../../../..//button[@class='btn-bordered-1st round df aic jcc modal-trigger']
${book_cartoon_locator.quick_view_btn_add_cart}         xpath=//button[@id='add-to-cart-quickview-button']//small
${book_cartoon_text.alert_add_to_cart_sucess}           เพิ่มสินค้าในตระกร้าสำเร็จ
