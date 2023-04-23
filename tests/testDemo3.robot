*** Settings ***
Documentation    Handling Child Window and Tabs (Section 4 : 19)
Library          SeleniumLibrary
Library          Collections
Library          String
Resource         resource.robot
Test Setup       Open the browser with the Mortgage payment url
Test Teardown    close browser

*** Variables ***
${error_message_login}      css:.alert-danger


*** Test Cases ***
Validate Child window Functionality
    Select the link of Child window
    Verify the user is Switch to Child window
    Grab the Email id in the Child Window
    Switch to Parent window and enter the Email

*** Keywords ***
Select the link of Child window
    click element       css:.blinkingText
    sleep               10

Verify the user is Switch to Child window
    switch window       NEW
    element text should be      css:h1   DOCUMENTS REQUEST

Grab the Email id in the Child Window
    ${text} =   get text    css:.red
    @{words}=   split string    ${text}     at
    #0 ->Please email u
    #1 ->mentor@rahulshettyacademy.com with below template to receive response
    ${text_split} =    Get From List	    ${words}    1
    log     ${text_split}

   @{words_2} =      split string    ${text_split}
    #0 ->mentor@rahulshettyacademy.com
    #1 ->with below template to receive response
    ${email} =      get from list    ${words_2}     0
    log     ${email}
    set global variable     ${email}

Switch to Parent window and enter the Email
    switch window       MAIN
    title should be     LoginPage Practise | Rahul Shetty Academy
    input text          id:username         ${email}
