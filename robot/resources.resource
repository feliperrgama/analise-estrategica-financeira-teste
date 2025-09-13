*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}        http://localhost:3000/
${LOCATOR_LOGO_CONEXAI_HOMEPAGE}     xpath da logo da conexai na homepage - tela de conversa



*** Keywords ***
Abrir O Navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar O Navegador
    Close All Browsers

Acessar url do projeto
    Go To    url=${URL}
    Sleep    time_=5s

Realizar login válido do usuário
    Click Element    locator=//*[@id="username"]
    Sleep    time_=3s
    Input Text    locator=//*[@id="username"]    text=cepedirestic36
    Click Element    locator=//*[@id="password"]
    Sleep    time_=3s
    Input Text    locator=//*[@id="password"]    text=dC2^OuQ$g1O4
    Sleep    time_=1s
    Click Button    locator=//*[@id="app"]/div/div[8]/form/button
    Sleep    time_=25s
    Wait Until Page Contains Element    locator=

Realizar login inválido do usuário
    Click Element    locator=//*[@id="username"]
    Sleep    time_=3s
    Input Text    locator=//*[@id="username"]    text=usuario_invalido
    Click Element    locator=//*[@id="password"]
    Sleep    time_=3s
    Input Text    locator=//*[@id="password"]    text=senha_invalida
    Sleep    time_=1s
    Click Button    locator=//*[@id="app"]/div/div[8]/form/button
    Sleep    time_=25s