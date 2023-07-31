*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Abrir navegador e acessar site do Organo
    Open Browser    url=http://localhost:3000/    browser=Chrome

Preencher os campos do formulário
    Input Text    id:form-nome      Eduarda
    Input Text    id:form-cargo     Desenvolvedora
    Input Text    id:form-imagem    https://picsum.photos/200/300
    Click Element    class:lista-suspensa
    Click Element    //option[contains(.,'Programação')]
    Sleep    10s
    Click Element    id:form-botao
    Element Should Be Visible    class:colaborador
    Sleep    5s