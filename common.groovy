APPIUM_PORT= [4723, 4724]
EMULATOR_PORT= [5554, 5556]
emulator_name= "cardx"

def result_jenkins_emoji(String failed_count){
    def message_emoji = ""
    if (failed_count.toInteger() == 0) {
        message_emoji = ":671ce8d3a35105bd5feefb5e006e749f:"
    } else {
        message_emoji = ":yuno:"
    }
    return "${message_emoji}"
}


def notify_line(passed_count, failed_count, log_url, BRANCH_NAME, JOB_NAME){
    def token = "lWcrOHVVskzMYRXb7iB1e9xanhcvmC3Pu8Jz39Ozufh"
    def url = 'https://notify-api.line.me/api/notify'

    def scriptPath = env.JENKINSFILE ?: "Jenkinsfile"
    echo "Jenkinsfile Path: ${scriptPath}"
    def platform_display = ""
    if (scriptPath.contains("JenkinsFile_web")) {
        platform_display = "Web"
    } else if (scriptPath.contains("JenkinsFile_android")){
        platform_display = "Android"
    }

    def message = "BPY 🔥 ${platform_display}\n${JOB_NAME} #${env.BUILD_NUMBER}\nBranch: ${BRANCH_NAME}\nPassed : ${passed_count} ✅ \nFailed : ${failed_count} 🤮 \nAfter:${currentBuild.durationString} \n\n(${log_url})"
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
    sleep 5
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
    sleep 10
}


def kill_all_android_emu() {
    for(int i in EMULATOR_PORT){
        echo "STOPPING EMULATOR Port ${i}"
        try {
            sh "kill -9 \$(lsof -t -i :${i}"
        }
        catch(err) {
            echo "emulator ${i} is stopped"
        }
    }
    sleep 15
}

def start_all_android_emu() {
    for(int i in EMULATOR_PORT){
        echo "STOPPING EMULATOR Port ${i}"
        try {
            sh "emulator -avd ${emulator_name} -port ${i} &"
        }
        catch(err) {
            echo "emulator ${i} is started"
        }
    }
    sleep 15
}

return this
