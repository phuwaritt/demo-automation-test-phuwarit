APPIUM_PORT= [4723, 4724]
EMULATOR_PORT= [5554, 5556]
android_emulator_name= ["cardx", "cardx_II"]
ios_emulator_uuid= ["633E791C-56CC-4246-9F2F-6C67AF0FC7FE", "94573E3B-11EB-4D9B-BCD8-0BD96E98BCF6"]

def result_jenkins_slack(send_to_channel,platform){
    String passed_count =  tm('${ROBOT_PASSED}')
    String failed_count = tm('${ROBOT_FAILED}')
    String BRANCH_NAME = "${GIT_BRANCH}"
    String JOB_NAME = "${env.JOB_NAME}"
    def total_tests = passed_count.toInteger() + failed_count.toInteger()
    def log_url = "${env.BASE_URL}/job/${JOB_NAME}/${env.BUILD_NUMBER}/artifact/testResult/report.html"
    def message_emoji = ""
    if (failed_count.toInteger() == 0) {
        message_emoji = ":white_check_mark:"
    } else {
        message_emoji = ":bee-do-v2:"
    }
    slackSend(channel: "${send_to_channel}",message: "BPY ${platform}\n ${message_emoji} ${JOB_NAME} #${env.BUILD_NUMBER} \n *BRANCH:* ${BRANCH_NAME} \n Total Test Cases: ${total_tests} \n Passed : ${passed_count} \n Failed : ${failed_count} \n After: ${currentBuild.durationString} \n (<${log_url}|Report>)")
}


def result_jenkins_line(){
    String passed_count =  tm('${ROBOT_PASSED}')
    String failed_count = tm('${ROBOT_FAILED}')
    String BRANCH_NAME = "${GIT_BRANCH}"
    JOB_NAME = "${env.JOB_NAME}"
    def total_tests = passed_count.toInteger() + failed_count.toInteger()
    def log_url = "${env.BASE_URL}/job/${JOB_NAME}/${env.BUILD_NUMBER}/artifact/testResult/report.html"
    def message_emoji = ""
    if (failed_count.toInteger() == 0) {
        message_emoji = "✅"
    } else {
        message_emoji = "❌"
    }
    def token = "lWcrOHVVskzMYRXb7iB1e9xanhcvmC3Pu8Jz39Ozufh"
    def url = 'https://notify-api.line.me/api/notify'
    def message = "BPY 🔥 \n${message_emoji} ${JOB_NAME} #${env.BUILD_NUMBER}\nBranch: ${BRANCH_NAME}\nPassed : ${passed_count}\nFailed : ${failed_count}\nAfter:${currentBuild.durationString} \n\n(${log_url})"
    sh "curl ${url} -H 'Authorization: Bearer ${token}' -F 'message=${message}'"
}


def report_sender() {
    echo "=== Start notify to failure declaration ==="
    sh '''
    ls -la
    python3 ./report_sender.py
    '''
    echo "report_sender done"
}


def stop_appium() {
    for(int i in APPIUM_PORT){
        echo "STOPPING Appium Port ${i}"
        try {
            sh "kill -9 \$(lsof -t -i :${i})"
        }
        catch(err) {
            echo "appium ${i} is stopped"
        }
    }
}


def start_appium() {
    for(int i in APPIUM_PORT){
        echo "STARTING Appium Port ${i}"
        try {
            sh "appium -p ${i} &"
        }
        catch(err) {
            echo "appium ${i} is started"
        }
    }
}


def kill_all_android_emu() {
    for(int i in EMULATOR_PORT){
        echo "STOPPING EMULATOR Port ${i}"
        try {
            sh "kill -9 \$(lsof -t -i :${i})"
        }
        catch(err) {
            echo "emulator ${i} is stopped"
        }
    }
    sleep 10
}

def start_all_android_emu() {
    for(int i=0; i<EMULATOR_PORT.size(); i++){
        echo "STOPPING EMULATOR Port ${i}"
        try {
            // echo "$ANDROID_AVD_HOME"
            // echo "$ANDROID_HOME"
            sh "emulator -avd ${android_emulator_name[i]} -port ${EMULATOR_PORT[i]} &"
            sh "sleep 5"
        }
        catch(err) {
            echo "emulator ${i} is started"
        }
    }
    sleep 30
    }

def start_all_ios_emu() {
    for(int i=0; i<EMULATOR_PORT.size(); i++){
        echo "STOPPING EMULATOR Port ${i}"
        try {
            sh "xcrun simctl boot 633E791C-56CC-4246-9F2F-6C67AF0FC7FE &"
            sh "sleep 5"
        }
        catch(err) {
            echo "emulator ${i} is started"
        }
    }
    sleep 30
    }

return this
