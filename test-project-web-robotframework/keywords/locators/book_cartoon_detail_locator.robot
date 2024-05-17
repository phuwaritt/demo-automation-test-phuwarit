*** Variables ***
${book_cartoon_detail_locator.page_check_book_detail_from_bookname}              xpath=//strong[text()='$book_name']
${book_cartoon_detail_locator.btn_add_count_book}                                xpath=//button[@class='plus button-qty']
${book_cartoon_detail_locator.btn_sub_count_book}                                xpath=//button[@class='min button-qty']
${book_cartoon_detail_locator.btn_add_to_cart}                                   id=add-to-cart-button
${book_cartoon_detail_locator.value_count_book}                                  id=qty