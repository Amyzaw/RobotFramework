*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
#Resource
Test Teardown    close browser

*** Variables ***
${error_message_login}      css:.alert-danger


*** Test Cases ***
Validate Unsuccessful Login
    Open the browser with the Mortgage payment url
    Fill the login form
    wait until it checks and displays error message
    verify error message is correct

*** Keywords ***
Open the browser with the Mortgage payment url
    open browser    https://rahulshettyacademy.com/loginpagePractise/   chrome
    maximize browser window

Fill the login form
    input text    id:username   amyzaw
    input password    id:password   amy@123
    click button    signInBtn

wait until it checks and displays error message
    wait until element is visible    ${error_message_login}

verify error message is correct
    ${result}=    get text    ${error_message_login}
    should be equal as strings    ${result}     Incorrect username/password.
    element text should be    ${error_message_login}    Incorrect username/password.


