Branch > BPY-Assment\
\
Web Pipeline, Android Pipeline, iOS Pipeline\
\
Run Android Web > pabot --pabotlib --testlevelsplit --processes 3 -d testResult test-project-web-robotframework/testscripts/tc_shopping_carts_scripts.robot\
\
Run Android >  pabot --pabotlib --testlevelsplit --processes 1 -v PLATFORM_NAME:android robot-mobile/test-cases\
\
Run Android >  pabot --pabotlib --testlevelsplit --processes 1 -v PLATFORM_NAME:ios robot-mobile/test-cases