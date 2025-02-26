APPIUM_PORT= [4723, 4724]
EMULATOR_PORT = [5554, 5556]

def result_jenkins_emoji(String failed_count){
    def message_emoji = ""
    if (failed_count.toInteger() == 0) {
        message_emoji = ":671ce8d3a35105bd5feefb5e006e749f:"
    } else {
        message_emoji = ":yuno:"
    }
    return "${message_emoji}"
}
return this


def notify_line(passed_count, failed_count, log_url, BRANCH_NAME){
    def token = "lWcrOHVVskzMYRXb7iB1e9xanhcvmC3Pu8Jz39Ozufh"
    def url = 'https://notify-api.line.me/api/notify'
    def message = "BPY 🔥 \nBranch: ${BRANCH_NAME} Build ${env.BUILD_NUMBER} \nPassed : ${passed_count} ✅ \nFailed : ${failed_count} 🤮 \nAfter:${currentBuild.durationString} \n\n(${log_url})"
    sh "curl ${url} -H 'Authorization: Bearer ${token}' -F 'message=${message}'"
}


def report_sender(){
    echo "=== Start notify to failure declaration ==="
    sh '''
    ls -la
    python3 ./report_sender.py
    '''
    echo "report_sender done"
}


def stop_appium(){
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


def start_appium(){
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