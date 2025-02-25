*** Settings ***
Resource        import.robot

*** Variables ***
${pop_frist.locator}                xpath=//div[@class='modal-overlay']
${pop_frist_open_web.locator}            xpath=//a[@class='close-modal']
${btn_box_cookie}                 xpath=//div[@class='p-2 df aic']/../..//a[text()='$text']
${text_btn_box_cookie_01}        ยอมรับ
${text_btn_box_cookie_02}        อ่านเพิ่มเติม
${test_cookie}                    xpath=//div[@class='p-2 df aic']//button
${text_btn_box_cookie}            xpath=//div[@class='p-2']//button    #xpath=//div[@class='p-2 df aic']/../..//a
${url}            https://www.nejavu.com/  
${browser}        gc

*** Keywords ***
Open website nejavu.com
        SeleniumLibrary.Open Browser    url=${url}       browser=${browser}
        SeleniumLibrary.Maximize Browser Window

Click element when read
        [Arguments]    ${locator}    ${timeout}=${GLOBAL_TIMEOUT}
        SeleniumLibrary.Wait Until Element Is Visible            ${locator}        ${timeout}
        SeleniumLibrary.Click Element            ${locator}
        

Input text element when read
        [Arguments]    ${locator}     ${text_inpt}   
        SeleniumLibrary.Input Text            ${locator}        ${text_inpt}

ดึงข้อมูลที่ใช้ทดสอบจาก Excel (Test data)
            [Arguments]            ${row_index}
            ExcelLibrary.Open Excel Document    filename=${EXECDIR}/Test-project-web-robotframework/resouces/testdata/testdata_shp.xlsx       doc_id=td_shopping_cart

            ${tc_id}                   ExcelLibrary.Read Excel Cell    row_num=${row_index}        col_num=1
            ${td_id}                   ExcelLibrary.Read Excel Cell    row_num=${row_index}        col_num=2
            ${bookname_1}              ExcelLibrary.Read Excel Cell    row_num=${row_index}        col_num=3
            ${bookname_qty_1}          ExcelLibrary.Read Excel Cell    row_num=${row_index}        col_num=4
            ${bookname_2}              ExcelLibrary.Read Excel Cell    row_num=${row_index}        col_num=5
            ${bookname_qty_2}          ExcelLibrary.Read Excel Cell    row_num=${row_index}        col_num=6

            [Return]        ${tc_id}    ${td_id}   ${bookname_1}    ${bookname_qty_1}    ${bookname_2}     ${bookname_qty_2}  
            ExcelLibrary.Close All Excel Documents

Accept cokkie
            [Arguments]        ${locator}        ${text_btn}    ${timeout}=${GLOBAL_TIMEOUT}
            SeleniumLibrary.Wait Until Element Is Not Visible        ${pop_frist.locator}         ${timeout}
                # IF    '${text_btn}' == 'ยอมรับ'
                #        SeleniumLibrary.Click Element        xpath=//div[@class='p-2 df aic']/../..//a[text()='ยอมรับ']
                # ELSE IF    '${text_btn}' == 'อ่านเพิ่มเติม'
                #         SeleniumLibrary.Click Element        xpath=//div[@class='p-2 df aic']/../..//a[text()='อ่านเพิ่มเติม']
                # END
            ${btn_accept}    string.Replace String        ${btn_box_cookie}        $text        ${text_btn}
            SeleniumLibrary.Click Element        ${btn_accept} 
            SeleniumLibrary.Wait Until Element Is Not Visible        ${test_cookie}        ${timeout}

When opening web first close popup automatically
        [Arguments]        ${locator}        ${timeout}=${GLOBAL_TIMEOUT}
        SeleniumLibrary.Wait Until Element Is Visible            ${locator}           ${timeout}
        SeleniumLibrary.Click Element        ${locator}
        SeleniumLibrary.Wait Until Element Is Not Visible        ${locator}           ${timeout}          

Close Browser nejavu.com
        SeleniumLibrary.Close Browser

Go back to the page
        SeleniumLibrary.Go Back