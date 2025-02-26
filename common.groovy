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
return this