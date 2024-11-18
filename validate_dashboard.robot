*** Settings ***
Library  OperatingSystem
Library  SeleniumLibrary

*** Variables ***
${EXPECTED_SCREENSHOT}  expected_dashboard.png
${ACTUAL_SCREENSHOT}    actual_dashboard.png
${GRAFANA_URL}          http://<grafana-ip>:<port>

*** Test Cases ***
Validate Dashboard Data
    Open Browser    ${GRAFANA_URL}    headless=False
Login To Grafana
    Go To    ${GRAFANA_URL}/dashboards
    Wait Until Page Contains Element    text="metrics"
    Capture Element Screenshot    selector=your_dashboard_selector    ${ACTUAL_SCREENSHOT}
    Compare Screenshots

*** Keywords ***
Compare Screenshots
    [Documentation]    Compare the actual screenshot with the expected one.
    ${result}=    Run Keyword And Return Status    Should Be Equal As Strings    ${EXPECTED_SCREENSHOT}    ${ACTUAL_SCREENSHOT}
    Run Keyword If    not ${result}    Fail    Screenshots do not match!
