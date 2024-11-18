*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${grafana_url}         https://khandekartush0.grafana.net/a/cloud-home-app?src=hg_notification_trial
${grafana_user}        khandekartush0@gmail.com
${grafana_pass}        Tushar@19
${browser}             edge
${db_host}             jdbc:mariadb://127.0.0.1:3306/myDatabase
${db_name}             Grafana
${db_user}             root
${db_password}         system

*** Test Cases ***
Login and Configure Grafana Dashboard
    Open Browser    ${grafana_url}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains Element    xpath=//span[@class='css-1riaxdn']    timeout=30s
    Click Element    xpath=//span[@class='css-1riaxdn']

    Wait Until Page Contains Element    name=login    timeout=30s
    Input Text    name=login    ${grafana_user}
    Wait Until Page Contains Element    xpath=//*[@id="submit"]
    Click Button    xpath=//*[@id="submit"]

    Wait Until Page Contains Element    name=password    timeout=30s
    Input Text    name=password    ${grafana_pass}
    Wait Until Page Contains Element    xpath=//*[@id="submit"]                 timeout=30s
    Click Button    xpath=//*[@id="submit"]



    Wait Until Page Contains Element    xpath=//*[@id="submit"]  timeout=30s
    Click button    xpath=//*[@id="submit"]


    Wait Until Page Contains Element    xpath=/html/body/div[1]/div/div[1]/div/div/main/div[3]/div[1]/div[3]/button     timeout=30s
    click element   xpath=/html/body/div[1]/div/div[1]/div/div/main/div[3]/div[1]/div[3]/button

    Wait Until Page Contains Element    xpath://button[@id='mega-menu-toggle']//*[name()='svg']    timeout=30s
    Click element    xpath://button[@id='mega-menu-toggle']//*[name()='svg']
    Sleep    10

    Wait Until Page Contains Element       class=css-1bap6ve            timeout=30s
    Click element    class=css-1bap6ve
    Sleep    10

#    Select from list by label    Home     Dashboards
#    Sleep    3
#    Select from list by index    Home   3


    Wait Until Page Contains Element       class=css-uantyg        timeout=30s
    Click element    class=css-uantyg
    Sleep   5

    Wait until page contains element    xpath=//span[contains(text(),'Dashboards')]     timeout=30s
    Click element    xpath=//span[contains(text(),'Dashboards')]
    Sleep    10

    Wait Until Page Contains Element       xpath=//span[normalize-space()='New']     timeout=30s
    Click element    xpath=//span[normalize-space()='New']
    Sleep    10

    Wait Until Page Contains Element       xpath=//span[normalize-space()='New dashboard']     timeout=30s
    Click element    //span[normalize-space()='New dashboard']
    Sleep    10

    Wait Until Page Contains Element       xpath=//button[@class='css-12jyywo-button']  timeout=30s
    Click element   xpath=//button[@class='css-12jyywo-button']
    Sleep   3

    Wait Until Page Contains Element       xpath=/html/body/div[5]/div[2]/div[2]/div[1]/div[2]/div[1]/div[1]/div[13]/h2  timeout=30s
    Click element   xpath=/html/body/div[5]/div[2]/div[2]/div[1]/div[2]/div[1]/div[1]/div[13]/h2
    Sleep   10

    Wait Until Page Contains Element     xpath=/html/body/div[1]/div/div[1]/div[1]/div/main/div[3]/div/div/div[1]/div/div[2]/div[3]/div/div[2]/div[1]/div/div/div/div[2]/div/div/div[2]/div/div[1]/div[7]/div[2]/input  timeout=30s
    Click Element      xpath=/html/body/div[1]/div/div[1]/div[1]/div/main/div[3]/div/div/div[1]/div/div[2]/div[3]/div/div[2]/div[1]/div/div/div/div[2]/div/div/div[2]/div/div[1]/div[7]/div[2]/input
    Wait Until Page Contains Element   xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/main[1]/div[3]/div[1]/div[1]/div[1]/div[1]/div[2]/div[3]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[1]/section[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[5]   timeout=30s
    Click Element    xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/main[1]/div[3]/div[1]/div[1]/div[1]/div[1]/div[2]/div[3]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[1]/section[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[5]
    Sleep    5


    Wait Until Page Contains Element    style=top:4px;height:19px;   timeout=30s
    Element Text Should Be    style=top:4px;height:19px;   ( CREATE TABLE metrics ( id INT AUTO_INCREMENT PRIMARY KEY,timestamp DATETIME,value DOUBLE));
    Sleep    10

    Wait Until Page Contains Element    xpath=//span[normalize-space()='Run query']         timeout=30s
    Click Element    xpath=//span[normalize-space()='Run query']

    Wait Until Page Contains Element    id=datasource    timeout=30s
    Select From List By Value    id=datasource    mariadb
    Wait Until Page Contains Element    id=query    timeout=30s
    Input Text    id=query    select metric_value, timestamp from metrics
    Click Button    id=save-dashboard
    Wait Until Page Contains    Dashboard saved    timeout=30s

    Click Element    text="Select Data Source"

    Select From List By Value    id=datasource    mariadb
    Input Text    id=query    select metric_value, timestamp from metrics
    Click Button    id=save-dashboar




    Wait Until Page Contains Element    xpath://button[@aria-label='New']//*[name()='svg']
    Setup Mariadb Datasource
    Create Dashboard With Timeseries
    Close Browser

*** Keywords ***
Login To Grafana
    [Documentation]    Log in to Grafana using provided credentials.
    Wait Until Page Contains Element    name=login    timeout=30s
    Input Text    name=login    ${grafana_user}
    Wait Until Page Contains Element    xpath=//*[@id="submit"]
    Click Button    xpath=//*[@id="submit"]
    Wait Until Page Contains Element    name=password    timeout=30s
    Input Text    name=password    ${grafana_pass}
    Wait Until Page Contains Element    xpath=//*[@id="submit"]
    Click Button    xpath=//*[@id="submit"]
#    Wait Until Page Contains Element

Create Dashboard With Timeseries
    [Documentation]    Create a new dashboard with Timeseries visualization in Grafana.
    Go To    https://khandekartush0.grafana.net/dashboard/new?orgId=1&editPanel=1
    Wait Until Page Contains Element    xpath://button[@aria-label='New']//*[name()='svg']    timeout=30s
    Click Element    xpath://button[@aria-label='New']//*[name()='svg']
    Wait Until Page Contains Element    xpath://*[@id="grafana-portal-container"]/div/div/div/div/div/a[1]/div/span    timeout=30s
    Click Element    xpath://*[@id="grafana-portal-container"]/div/div/div/div/div/a[1]/div/span
    Wait Until Page Contains Element    text="Time series"    timeout=30s
    Click Element    text="Time series"
    Wait Until Page Contains Element    text="Select Data Source"    timeout=30s
    Click Element    text="Select Data Source"
    Wait Until Page Contains Element    id=datasource    timeout=30s
    Select From List By Value    id=datasource    mariadb
    Wait Until Page Contains Element    id=query    timeout=30s
    Input Text    id=query    select metric_value, timestamp from metrics
    Click Button    id=save-dashboard
    Wait Until Page Contains    Dashboard saved    timeout=30s

Setup Mariadb Datasource
    [Documentation]    Configure the MariaDB datasource in Grafana.
    Go To    ${grafana_url}/datasources/new
    Wait Until Page Contains Element    text="MySQL"    timeout=30s
    Click Element    text="MySQL"
    Wait Until Page Contains Element    name=name    timeout=30s
    Input Text    name=name    mariadb
    Input Text    id=url    ${db_host}
    Input Text    id=database    ${db_name}
    Input Text    id=user    ${db_user}
    Input Text    id=password    ${db_password}
    Click Button    id=save-datasource
    Wait Until Page Contains    Data source is working    timeout=30s





