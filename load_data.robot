*** Settings ***
Library  DatabaseLibrary

*** Variables ***
${DB_HOST}     my-mariadb.default.svc.cluster.local
${DB_NAME}     metrics_db
${DB_USER}     root
${DB_PASSWORD}  system
${DB_PORT}      3306
*** Test Cases ***
Insert Metric Data
    Connect To Database  pymysql  ${DB_HOST}  ${DB_NAME}  ${DB_USER}  ${DB_PASSWORD}
    Execute Sql Script  INSERT INTO metrics (metric_value, timestamp) VALUES (23.5, NOW()), (18.4, NOW()), (32.1, NOW())
    Disconnect From Database



*** Keywords ***
Insert Hardcoded Data
    [Documentation]    Insert a sample metric into the metrics table.
    Connect To Database Using Custom Params    pymysql    ${DB_HOST}    ${DB_PORT}    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}
    Log    Connected to database successfully
    Execute Sql Script   INSERT INTO metrics (timestamp, value) VALUES (NOW(), 100.5);
    Log    Data inserted successfully
    Disconnect From Database

