*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Abrir navegador e acessar site do Organo
    Open Browser    url=http://localhost:3000/    browser=Chrome