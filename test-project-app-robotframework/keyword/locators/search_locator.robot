*** Variables ***
${search_page.locator}        xpath=//android.widget.TextView[@index="1"]
${search_text_box.locator}    id=com.ebay.mobile:id/search_src_text
${header_search_results_page.locator}        xpath=//android.view.ViewGroup[@resource-id="com.ebay.mobile:id/primary_toolbar"]//android.widget.TextView
${actual_results.locator}            xpath=//android.view.ViewGroup[@index="$record"]//android.view.ViewGroup//android.widget.TextView[@resource-id="com.ebay.mobile:id/textview_primary_0"]
