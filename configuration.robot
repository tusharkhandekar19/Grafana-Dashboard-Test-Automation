*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem


*** Variables ***
${grafana_url}         https://khandekartush0.grafana.net/a/cloud-home-app?src=hg_notification_trial
${grafana_user}        khandekartush0@gmail.com
${grafana_pass}        Tushar@19
${browser}             chrome
${db_host}             jdbc:mariadb://127.0.0.1:3306/myDatabase.         # Replace with actual MariaDB host URL
${db_name}             Grafana             # Replace with your MariaDB database name
${db_user}             root             # Replace with your MariaDB username
${db_password}         system         # Replace with your MariaDB password



*** Test Cases ***
Login and Configure Grafana Dashboard
    Open Browser    ${grafana_url}    ${browser}
    Wait Until Page Contains Element      xpath=//span[@class='css-1riaxdn']
    Click Element      xpath://span[@class='css-1riaxdn']
    Wait Until Page Contains Element      name=login
    input text      name=login         ${grafana_user}
    Wait Until Page Contains Element    xpath://*[@id="submit"]
    click button      xpath://*[@id="submit"]
    Wait Until Page Contains Element      name=password
    input text     name=password       ${grafana_pass}
    Wait Until Page Contains Element      xpath://*[@id='submit']
    click element   xpath://*[@id='submit']



*** Keywords ***
Login To Grafana
    [Documentation]    Log in to Grafana using provided credentials.
    Wait Until Page Contains Element      name=login
    input text    name=login    ${grafana_user}
    Wait Until Page Contains Element    xpath://*[@id="submit"]
    click element   xpath://*[@id="submit"]
    Wait Until Page Contains Element      name=password
    input text    name=password    ${grafana_pass}
    Wait Until Page Contains Element    xpath://*[@id="submit"]         timeout=20s
    Click Button     xpath://*[@id="submit"]
    Wait Until Page Contains Element    xpath://*[@id="content"]/div/div[2]/div/div[1]/div[2]/div/div/nav       timeout=20s
    Sleep    6

Setup Mariadb Datasource
    [Documentation]    Configure the MariaDB datasource in Grafana.
    Go To    ${grafana_url}/datasources/new
    Click Element    text="MySQL"
    Input Text    name=name    mariadb
    Input Text    id=url    ${db_host}
    Input Text    id=database    ${db_name}
    Input Text    id=user    ${db_user}
    Input Text    id=password    ${db_password}
    Click Button    id=save-datasource
    Wait Until Page Contains    Data source is working

Create Dashboard With Timeseries
    [Documentation]    Create a new dashboard with Timeseries visualization in Grafana.
    Go To    ${grafana_url}/dashboards
    Click Element    text="New Dashboard"
    Click Element    text="Add New Panel"
    Click Element    text="Time series"
    Click Element    text="Select Data Source"
    Select From List By Value    id=datasource    mariadb
    Input Text    id=query    select metric_value, timestamp from metrics
    Click Button    id=save-dashboard
    Sleep    10


