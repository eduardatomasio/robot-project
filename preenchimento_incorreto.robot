*** Settings ***
Library          SeleniumLibrary
Resource         setup_teardown.robot
Test Setup       Dado que eu acesse o site Organo
Test Teardown    Fechar o navegador

*** Variables ***
${BOTAO_CARD}             id:form-botao

*** Test Cases ***
Verificar se quando um campo obrigatório não for preenchido corretamente o sistema exibe mensagem de cmapo obrigatório
    Dado que eu clique no botão criar card
    Então o sistema deve apresentar mensagem de campo obrigatório


*** Keywords ***
Dado que eu clique no botão criar card
    Click Element    ${BOTAO_CARD}

Então o sistema deve apresentar mensagem de campo obrigatório
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro