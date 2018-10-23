*** Settings ***
Library                SeleniumLibrary
Resource               login-page.robot
Resource               Test-Setup_and-Teardown.robot
Resource               dashboard.robot

Test Setup             Setup
Test Teardown          Teardown

*** keywords ****


*** Test cases ***
Test Case 1 - Login
    Perform Valid Login
    Perform Logout