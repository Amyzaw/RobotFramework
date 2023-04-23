*** Settings ***
Documentation    Load the data from csv files (Section 5 : 24)
Library    SeleniumLibrary
Library    DataDriver       file=resources/data.csv     encoding=utf_8      dialect=unix
#Resource
Test Teardown    close browser
Test Template    Validate Unsuccessful Login

*** Variables ***
${error_message_login}      css:.alert-danger

*** Test Cases ***
Login with user ${username} and password ${password}      defaultusername         defaultpwd123
#need to add default username and default password in case if the csv file cannot access or find by the test

*** Keywords ***
Validate Unsuccessful Login
    [Arguments]    ${username}      ${password}
    #csv file data column name should be same as the Arguments parameter like ${username} and $ {password}
    Open the browser with the Mortgage payment url
    Fill the login form     ${username}     ${password}
    wait until it checks and displays error message
    verify error message is correct



Open the browser with the Mortgage payment url
    open browser    https://rahulshettyacademy.com/loginpagePractise/   chrome
    maximize browser window

Fill the login form
    [arguments]         ${username}     ${password}
    input text          id:username     ${username}
    input password      id:password     ${password}
    click button        signInBtn

wait until it checks and displays error message
    wait until element is visible    ${error_message_login}

verify error message is correct
    ${result}=    get text    ${error_message_login}
    should be equal as strings    ${result}     Incorrect username/password.
    element text should be    ${error_message_login}    Incorrect username/password.


