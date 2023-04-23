*** Settings ***
Documentation  Page Objects for robot framework tests (Section 7 : 30,31)
Library    SeleniumLibrary
Library     Collections
Library    ../customLibraries/Shop.py
Test Setup      Open the browser with the Mortgage payment url
#Test Teardown    Close Browser Session
Resource    ../PO/Generic.robot
Resource    ../PO/LandingPage.robot
Resource    ../PO/Shop.robot

*** Variables ***
@{listofProducts}           Blackberry      Nokia Edge

*** Test Cases ***
validate unsuccessful login
    LandingPage.fill the login form     ${invalid_username}     ${invalid_password}
    LandingPage.wait until element is visible on page
    LandingPage.verify error message is correct


Validate Cards display in the shopping Page
    LandingPage.Fill the login form   ${valid_username}     ${valid_password}
    Shop.Wait until element is visible on page
    Shop.Verify card titles in the shop page
    add items to cart and checkout      ${listofProducts}
    #Shop.Select the Card     Blackberry

Select the form and navigate to child window
    LandingPage.Fill the Login Details and Login Form







