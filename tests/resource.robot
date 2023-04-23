*** Settings ***
Documentation       All the page objects and keywords of landing page
Library             SeleniumLibrary


*** Variables ***
${valid_username}            rahulshettyacademy
${invalid_username}     amy
${invalid_password}     12345678
${valid_password}       learning
${url}                  https://rahulshettyacademy.com/loginpagePractise/


*** Keywords ***
Open the browser with the Mortgage payment url
    open browser        ${url}  chrome
    maximize browser window

Close Browser Session
    close browser


