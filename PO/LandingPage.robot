*** Settings ***
Documentation   Page Objects for robot framework tests (Section 7 : 30,31)
Library    SeleniumLibrary
Library     Collections
Library    ../customLibraries/Shop.py
Test Setup      Open the browser with the Mortgage payment url
#Test Teardown    Close Browser Session
Resource    ../PO/Generic.robot

*** Variables ***
${error_message_login}      css:.alert-danger

*** Keywords ***
Fill the login form
    [arguments]         ${username}     ${password}
    input text          id:username     ${username}
    input password      id:password     ${password}
    click button        signInBtn

Wait until element is visible on page
    Wait Until element passed is located on Page    ${error_message_login}


verify error message is correct
    ${result}=    get text    ${error_message_login}
    should be equal as strings    ${result}     Incorrect username/password.
    element text should be    ${error_message_login}    Incorrect username/password.

Fill the Login Details and Login Form
    input text          id:username     rahulshettyacademy
    input password      id:password     learning
    click element       css:input[value='user']
    wait until element is visible        css:.modal-body
    click Button       id:okayBtn
    click Button       id:okayBtn
    wait until element is not visible    css:.modal-body
    Select From List By Value       xpath://select[@class='form-control']   teach
    select checkbox     terms
    checkbox should be selected    terms