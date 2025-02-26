*** Variables ***
# Android configs
${ANDROID_APP}                 ./robot-mobile/apps/wdioNativeDemoApp.apk
${ANDROID_APP_PACKAGE}        com.wdiodemoapp
${ANDROID_APP_ACTIVITY}       .MainActivity

# iOS configs
${IOS_AUTOMATION_NAME}        XCUITest
${IOS_APP}                    /Users/phuwarit.t/Desktop/wdioNativeDemoApp.app
${IOS_PLATFORM_NAME}          iOS
${IOS_PLATFORM_VERSION}       %{IOS_PLATFORM_VERSION=18.1}
${IOS_APP_BUNDLE_ID}          com.wdiodemoapp
${IOS_DEVICE_NAME}            iPhone 15 Pro Max
${IOS_UUID}                   522AEA56-421C-43A5-A108-AA1B491C3157
