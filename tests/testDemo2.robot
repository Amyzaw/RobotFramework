*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library     Collections
Resource    resource.robot
Test Setup      Open the browser with the Mortgage payment url
#Test Teardown    Close Browser Session

*** Variables ***
${error_message_login}      css:.alert-danger
${shop_page_load}           css:.nav-link

*** Test Cases ***
#validate unsuccessful login
    #fill the login form     ${invalid_username}     ${invalid_password}
    #wait until element is visible on page   ${error_message_login}
    #verify error message is correct


Validate Cards display in the shopping Page
    Fill the login form   ${valid_username}     ${valid_password}
    Wait until element is visible on page       ${shop_page_load}
    Verify card titles in the shop page
    Select the Card     Blackberry

Select the form and navigate to child window
    Fill the Login Details and Login Form

*** Keywords ***
Fill the login form
    [arguments]         ${username}     ${password}
    input text          id:username     ${username}
    input password      id:password     ${password}
    click button        signInBtn

Wait until element is visible on page
    [arguments]    ${element}
    wait until element is visible    ${element}

verify error message is correct
    ${result}=    get text    ${error_message_login}
    should be equal as strings    ${result}     Incorrect username/password.
    element text should be    ${error_message_login}    Incorrect username/password.

Verify card titles in the shop page
    @{expectedList} =  Create List   iphone X    Samsung Note 8  Nokia Edge  Blackberry
    ${list_data} =    Get WebElements    css:.card-title
    @{actualList} =    create list
    FOR    ${data}   IN    @{list_data}
        log    ${data.text}
        append to list    ${actualList}     ${data.text}
    END

    lists should be equal       ${expectedList}     ${actualList}

Select the Card
    [arguments]         ${cardName}
    ${list_data} =    Get WebElements    css:.card-title
    ${index} =  set variable    1

    FOR    ${data}   IN    @{list_data}
       Exit For Loop If   '${cardName}' == '${data.text}'
       ${index} =  Evaluate    ${index} + 1
    END

    click button    xpath:(//*[@class="card-footer"])[${index}]/button

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

