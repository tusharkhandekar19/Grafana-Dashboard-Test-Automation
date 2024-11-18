*** Settings ***
Library  DatabaseLibrary

*** Variables ***
${DB_HOST}     my-mariadb
${DB_NAME}     metrics_db
${DB_USER}     root
${DB_PASSWORD}  system
${DB_PORT}     3306

*** Test Cases ***
Create Metrics Table
    [Documentation]  Create the 'metrics' table in the database if it does not already exist.
    Connect To Database  pymysql  ${DB_HOST}  ${DB_PORT}  ${DB_NAME}  ${DB_USER}  ${DB_PASSWORD}
    Execute Sql Script  CREATE TABLE IF NOT EXISTS metrics (id INT AUTO_INCREMENT PRIMARY KEY, metric_value FLOAT, timestamp DATETIME)
    Disconnect From Database
