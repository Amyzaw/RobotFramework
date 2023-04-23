*** Settings ***
Documentation   Page Objects for robot framework tests (Section 7 : 30,31)
Library    SeleniumLibrary
Library     Collections
Library    ../customLibraries/Shop.py
Test Setup      Open the browser with the Mortgage payment url
Test Teardown    Close Browser Session
Resource    ../PO/Generic.robot

*** Variables ***
${shop_page_load}           css:.nav-link

*** Keywords ***
Wait until element is visible on page
    Wait Until element passed is located on Page    ${shop_page_load}


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