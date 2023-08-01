*** Settings ***
Resource    ../main.robot

*** Keywords ***
Dado que eu acesse o site Organo
    Open Browser    url=http://localhost:3000/    browser=Chrome

Fechar o navegador
    Close Browser