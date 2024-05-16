@echo off
cd /d %~dp0
robot --outputdir test-project-web-robotframework/testresults --log is_log.html --report is_report.html --output is_output.xml test-project-web-robotframework/testscripts/tc_shopping_carts_scripts.robot

#How to run 
#cd file project in Terminal and copy relative path ของไฟล์ run_test แล้วเอาไปรันใน Terminal