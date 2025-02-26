*** Variables ***
# Appium configs
${APPIUM_SERVER_URL}          http://127.0.0.1:4723
${PLATFORM_NAME}              ${ANDROID_PLATFORM_NAME}

# Android configs
# ${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_APP}                 ./robot-mobile/apps/wdioNativeDemoApp.apk
# ${ANDROID_PLATFORM_NAME}      android
# ${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=14}
${ANDROID_APP_PACKAGE}        com.wdiodemoapp
${ANDROID_APP_ACTIVITY}       .MainActivity
# ${ANDROID_DEVICE_NAME}        emulator-5554

# iOS configs
${IOS_AUTOMATION_NAME}        XCUITest
${IOS_APP}                    /Users/phuwarit.t/Desktop/wdioNativeDemoApp.app
${IOS_PLATFORM_NAME}          iOS
${IOS_PLATFORM_VERSION}       %{IOS_PLATFORM_VERSION=18.1}
${IOS_APP_BUNDLE_ID}          com.wdiodemoapp
${IOS_DEVICE_NAME}            iPhone 15 Pro Max
${IOS_UUID}                   522AEA56-421C-43A5-A108-AA1B491C3157
