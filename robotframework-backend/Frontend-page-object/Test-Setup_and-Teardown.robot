*** Settings ***
Library        SeleniumLibrary

*** Keywords ***
Setup
    Open Browser               http://localhost:8080/hotel        chrome
    Maximize Browser Window
    Title Should Be            Hotel Accomodation - login page

Teardown
    Close All Browsers