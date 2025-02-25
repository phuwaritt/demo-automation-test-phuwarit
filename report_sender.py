from    os          import  path
from    datetime    import  datetime
import  os
import  json
import  time
import  sys
import  base64
import  requests
import os
from datetime import datetime
import zipfile

print("STARTING SENDER....")

jenkins_data = {
    "jenkins_build_url" : os.environ.get('BUILD_URL') if os.environ.get('BUILD_URL') else "",
    "jenkins_build_id" : os.environ.get('BUILD_NUMBER') if os.environ.get('BUILD_NUMBER') else "No build id",
    "jenkins_branch" : os.environ.get('BRANCH') if os.environ.get('BRANCH') else "",
    "jenkins_GIT_BRANCH" : os.environ.get('GIT_BRANCH') if os.environ.get('GIT_BRANCH') else "",
    "jenkins_project_id" : os.environ.get('PROJECT_ID') if os.environ.get('PROJECT_ID') else "",
    "jenkins_company_id" : os.environ.get('COMPANY_ID') if os.environ.get('COMPANY_ID') else "262338a2-2031-4ead-9311-08dd033466d9",
    "jenkins_automated_version" : os.environ.get('AUTOMATED_VERSION') if os.environ.get('AUTOMATED_VERSION') else 1,
    "jenkins_app_version" : os.environ.get('APP_VERSION') if os.environ.get('APP_VERSION') else 1,
}
type = os.environ.get('TYPE') if os.environ.get('TYPE') else "robot"
job = os.environ.get('JOB_NAME') if os.environ.get('JOB_NAME') else "job"
build_type = os.environ.get('BUILD_TYPE') if os.environ.get('BUILD_TYPE') else ""
report_path = os.environ.get('REPORT_PATH') if os.environ.get('REPORT_PATH') else ""
screenshot_folder = os.environ.get('SCREENSHOT_FOLDER') if os.environ.get('SCREENSHOT_FOLDER') else ""
print("print(os.path.basename(report_path))")
print(os.path.basename(report_path))
with zipfile.ZipFile("result.zip", 'w', zipfile.ZIP_DEFLATED) as zip_file:
    if os.path.isfile(report_path):
        zip_file.write(report_path, os.path.basename(report_path))

def send_report():
    print("print(os.path.basename(report_path))")
    print(os.path.basename(report_path))
    file={'report': open('result.zip','rb',)}
    for (root,dirs,files) in os.walk(screenshot_folder, topdown=True):
        for filename in files:
            if filename.endswith(".png"):
                file_path = os.path.join(root,filename)
                with open(file_path, "rb") as image:
                    encoded_data = base64.b64encode(image.read()).decode('utf-8')
                jenkins_data[filename] = encoded_data
    print("print(os.path.basename(report_path))")
    print(os.path.basename(report_path))
    jenkins_data["job"] = job
    jenkins_data["type"] = type
    jenkins_data["build_type"] = build_type
    jenkins_data["report_filename"] = os.path.basename(report_path)
    endpoint = "https://failure-declaration.doppio-tech.com/v1/companies/" + str(jenkins_data["jenkins_company_id"]) + "/projects/" + str(jenkins_data["jenkins_project_id"]) + "/builds"
    resp = requests.post(
        endpoint,
        files=file,
        data=jenkins_data)
    print(endpoint)
    print(resp.status_code)
    print(report_path)
    print(screenshot_folder)
    print(resp.text)
    return resp.status_code

if __name__ == '__main__':
    send_report()