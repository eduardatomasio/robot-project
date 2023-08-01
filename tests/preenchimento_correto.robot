*** Settings ***
Resource    ../resources/main.robot
Test Setup       Dado que eu acesse o site Organo
Test Teardown    Fechar o navegador

*** Test Cases ***
Verificar se ao preencher os campos do formulário corretamente o card é criado no time certo

    Dado que preencha o formulário
    E clique no botão criar card
    Então identificar o card no time esperado    

Verificar se é possível criar mais de um card se preenchidos os dados corretamente
    Dado que preencha o formulário
    E clique no botão criar card
    Então identificar 3 cards no tipo esperado

Verificar se é possível criar um card para cada time se preenchidos os dados corretamente
     Dado que preencha o formulário
     Então criar e identificar um card para cada um dos time


    

