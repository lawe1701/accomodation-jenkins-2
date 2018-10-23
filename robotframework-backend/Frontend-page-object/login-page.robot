*** Settings ***
Library                                   SeleniumLibrary
Resource                                  dashboard.robot


*** Variables ***
${login pg title}                         Hotel Accomodation - login page
${login pg username txt}                  id=login
${login pg password txt}                  id=senha
${login pg login btn}                     id=loginBtn

*** Keywords ***
Perform Valid Login
    Input Text                            ${login pg username txt}    marc
    Input Text                            ${login pg password txt}    1010
    Click Element                         ${login pg login btn}
    Wait Until Page Contains              ${dashboard pg top-left-hand lbl}