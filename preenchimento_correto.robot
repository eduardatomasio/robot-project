*** Settings ***
Library          SeleniumLibrary
Library          FakerLibrary    locale=pt_BR
Resource         setup_teardown.robot
Test Setup       Dado que eu acesse o site Organo
Test Teardown    Fechar o navegador

*** Variables ***
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
@{times}
...                //option[contains(.,'Programação')]
...                //option[contains(.,'Front-End')]
...                //option[contains(.,'Data Science')]
...                //option[contains(.,'Devops')] 
...                //option[contains(.,'UX e Design')]
...                //option[contains(.,'Mobile')]
...                //option[contains(.,'Inovação e Gestão')]

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

*** Keywords ***
 Dado que preencha o formulário
    ${Nome}    FakerLibrary.First Name
    Input Text    ${CAMPO_NOME}          ${Nome}
    ${Cargo}    FakerLibrary.Job
    Input Text    ${CAMPO_CARGO}     ${Cargo}
    ${Imagem}    FakerLibrary.Image Url    width=100    height=100
    Input Text    ${CAMPO_IMAGEM}    ${Imagem}
    Click Element    ${CAMPO_TIME}
    Click Element    ${times}[0]
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

Então criar e identificar um card para cada um dos time
    FOR    ${index}    ${time}    IN ENUMERATE    @{times}
         Dado que preencha o formulário
         Click Element    ${time}
         E clique no botão criar card
    END

    Sleep    5s
    

