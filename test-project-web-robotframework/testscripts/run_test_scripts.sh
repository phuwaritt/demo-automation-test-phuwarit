@echo off
cd /d %~dp0
robot --outputdir test-project-web-robotframework/testresults --log is_log.html --report is_report.html --output is_output.xml test-project-web-robotframework/testscripts/tc_shopping_carts_scripts.robot

#How to run 
#cd file project in terminal or cmd and copy relative path file run_test_scripts.sh put in terminal or cmd and press enter 
#example C:\Users\name_pc\desktop\project-robotframework> test-project-web-robotframework\testscripts\run_test_scripts.sh
