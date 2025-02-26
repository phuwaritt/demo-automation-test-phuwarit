* Settings *
Resource        ../resources/setting/import.robot
Suite Setup           common.Open application
Suite Teardown        common.Close application


* Test Cases *
TC_001_Verify Login success
        [Tags]        TC_001
        [Documentation]     Verify Login success
        home_page.Close popup when frist open app            locator=${popup_frist_oprn_app.locator}
        home_page.Check displayed home page success     locator=${home_page.locator}
        common.Close application ebay for android

TC_002_Verify Login Fail
        [Tags]        TC_002
        [Documentation]     Verify Login Fail
        home_page.Close popup when frist open app            locator=${popup_frist_oprn_app.locator}
        home_page.Check displayed home page success     locator=toFail
        common.Close application ebay for android

TC_002_Verify record first and check that the price is not 0
        [Tags]        TC_003
        [Documentation]     Verify record first and check that the price is not 0
        home_page.Close popup when frist open app            locator=${popup_frist_oprn_app.locator}
        home_page.Check displayed home page success     locator=${home_page.locator}
        home_page.Click search box            locator=${header_search_box.locator}
        search_page.Input data on search box and press search       locator=${search_text_box.locator}           keyword=${keyword_search}
        search_page.Check header search results page show text that matches the keywords you type in your search       locator=${header_search_results_page.locator}         expac=${keyword_search} 
        search_page.Verify record first and check that the price is not 0       record=1      actual_locator=${actual_results.locator}         expected_result=${expected_result}