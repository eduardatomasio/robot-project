*** Settings ***
Library          SeleniumLibrary
Resource         setup_teardown.robot
Test Setup       Dado que eu acesse o site Organo
Test Teardown    Fechar o navegador

*** Variables ***
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
${OPCAO_PROGRAMACAO}      //option[contains(.,'Programação')]
${OPCAO_FRONT}            //option[contains(.,'Front-End')]
${OPCAO_DADOS}            //option[contains(.,'Data Science')]
${OPCAO_DEVOPS}           //option[contains(.,'Devops')] 
${OPCAO_UX}               //option[contains(.,'UX e Design')]
${OPCAO_MOBILE}           //option[contains(.,'Mobile')]
${OPCAO_INOVACAO}         //option[contains(.,'Inovação e Gestão')]

*** Test Cases ***
Verificar se ao preencher os campos do formulário corretamente o card é criado no time certo

    Dado que preencha o formulário
    E clique no botão criar card
    Então identificar o card no time esperado    

Verificar se é possível criar mais de um card se preenchidos os dados corretamente
    Dado que preencha o formulário
    E clique no botão criar card
    Então identificar 3 cards no tipo esperado

*** Keywords ***
 Dado que preencha o formulário
    Input Text    ${CAMPO_NOME}          Eduarda
    Input Text    ${CAMPO_CARGO}     Desenvolvedora
    Input Text    ${CAMPO_IMAGEM}    https://picsum.photos/200/300
    Click Element    ${CAMPO_TIME}
    Click Element    ${OPCAO_PROGRAMACAO}
    Sleep    5s

E clique no botão criar card
    Click Element    ${BOTAO_CARD}
    
 Então identificar o card no time esperado
    Element Should Be Visible    class:colaborador
    Sleep    5s

Então identificar 3 cards no tipo esperado
    FOR    ${i}    IN RANGE    1    3
         Dado que preencha o formulário
         E clique no botão criar card
    END
    Sleep    5s
    

