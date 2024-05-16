*** Variables ***
${header.home_logo}                xpath=//div[@class='logo-container pb-1 pb-0-lg full-space my-n2']//a[@class='target']
${header.search_box}               id=search-dropdown
${header.search_box_button}        xpath=//div[@class='df']//button[@type='submit']
${header.href_pocketbook}          xpath=/html/body/main/div[1]/div[2]/div[2]/div[2]/nav/div/ul/li[2]/a     
${header.href_cartoon}             xpath=/html/body/main/div[1]/div[2]/div[2]/div[2]/nav/div/ul/li[3]/a/img
${header.href_ebook}               xpath=/html/body/main/div[1]/div[2]/div[2]/div[2]/nav/div/ul/li[5]/a
${header.cart_logo}                xpath=//a[@href='https://www.nejavu.com/cart']//img[@class='lozad']
${header.qty_on_cart}              id=badge-cart
${header.icon_cart_btn}            xpath=//a[@href='https://www.nejavu.com/cart']//img[@class='lozad']
${header.text_alert_add_to_cart_sucess}               เพิ่มสินค้าในตระกร้าสำเร็จ
${header.locator_alert_add_to_cart_sucess}             //div[@class='toast-message']
${header.expect_qty_to_cart}                           2 
${set_text_search_01}        BLEACH เทพมรณะ
${set_text_search_02}        JOJO ล่าข้ามศตวรรษ