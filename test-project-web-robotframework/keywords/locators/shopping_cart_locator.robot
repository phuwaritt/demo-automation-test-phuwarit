*** Variables ***
${shopping_cart_locator_page}                             xpath=//div[@class='mt-8 mb-4 df jcsb aic']//strong
${shopping_cart_locator.product_book_name}                xpath=//*[contains(text(),'$book_name')]//ancestor::div[@class='cart-item-detail']//p//strong
#${shopping_cart_locator.product_piece}                    xpath=//*[contains(text(),'มหาศึกคนชนคน เล่ม 3')]//following::div[@class='price']//p[@class='text-1st']/strong
${shopping_cart_locator.product_add_qty_book}             xpath=//strong[text()='$book_name']/../../../../..//button[@id='add']
${shopping_cart_locator.product_sub_qty_book}             xpath=//strong[text()='$book_name']/../../../../..//button[@id='sub']
${shopping_cart_locator.product_total_price_per}          xpath=//*[contains(text(),'$book_name')]/../../../../..//p[@class='item-price' and //span[@class='txt-sm-1']] 
${shopping_cart_locator.product_sum_total_piece}          xpath=/html[1]/body[1]/main[1]/div[1]/div[3]/div[1]/div[1]/div[1]/div[4]/div[2]/div[1]/div[1]/p[2]
${shopping_cart_locator.icon_deleteby_bookname}           xpath=//*[contains(text(),'$book_name')]/../../../../..//a[@class='delete-item']
${shopping_cart_locator.delete_confirm_btn}               xpath=//button[contains(text(),'ใช่ ลบรายการ')]
${shopping_cart_locator.delete_cancel_btn}                xpath=//div[@class='swal2-actions']//button[@type='button'][contains(text(),'ยกเลิก')]
${shopping_cart_text.meassge_delete_success}              ลบรายการสินค้าสำเร็จ   
${shopping_cart_locator.cart_empty}                       xpath=//h2[@class='text-center mb-5']//strong
${shopping_cart_text.cart_empty}                          ยังไม่มีรายการสินค้าในตะกร้า โปรดสั่งซื้อสินค้า
${shopping_cart_locator.get_value_qty_book}               xpath=//strong[text()='$book_name']/../../../../..//input[@name='product_quantity']
${shopping_cart_locator.icon_delete_all_book_incart}      xpath=//div//a[@class='delete-item']
${shopping_cart_locator._pop_delete}                      xpath=//h2[@id='swal2-title']
${shopping_cart_.text_pop_delete}                         OK