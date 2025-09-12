*** Settings ***
Documentation     Casos de teste para a automatização de testes no projeto ConexAI
Library           SeleniumLibrary
Resource          ../robot/resources.resource
Test Setup        Abrir O Navegador
Test Teardown     Fechar O Navegador


*** Test Cases ***