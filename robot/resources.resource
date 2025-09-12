*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    https://localhost:3000/
&{LIST_FRUTAS}    banana=amarela    morango=vermelho    uva=roxa
@{PESSOA}    Felipe    22    1.80    True




*** Keywords ***
Abrir O Navegador
    Open Browser    ${URL}    browser=chrome
    Maximize Browser Window

Fechar O Navegador
    Close All Browsers