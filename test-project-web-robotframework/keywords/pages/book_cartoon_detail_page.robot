*** Settings ***
Resource        ../../resouces/import.robot   

*** Keywords ***
Check ว่ามายังหน้ารายละเอียดหนังสือได้สำเร็จ
        [Arguments]        ${bookn_name}    ${tomeout}=${GLOBAL_TIMEOUT}
        
