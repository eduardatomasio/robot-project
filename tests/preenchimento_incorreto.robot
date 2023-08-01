*** Settings ***
Resource    ../resources/main.robot
Test Setup       Dado que eu acesse o site Organo
Test Teardown    Fechar o navegador

*** Test Cases ***
Verificar se quando um campo obrigatório não for preenchido corretamente o sistema exibe mensagem de cmapo obrigatório
    Dado que eu clique no botão criar card
    Então o sistema deve apresentar mensagem de campo obrigatório


