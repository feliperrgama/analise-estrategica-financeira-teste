*** Settings ***
Documentation     Casos de teste para a automatização de testes no projeto ConexAI
Library           SeleniumLibrary
Resource          ../robot/resources.resource
Test Setup        Abrir O Navegador
Test Teardown     Fechar O Navegador


*** Test Cases ***
CT-001: Login válido no sistema
    [Documentation]    Verificar se o usuário consegue realizar login com credenciais válidas e se o sistema exibe uma notificação de erro ao usar credenciais inválidas.
    Acessar url do projeto
    Realizar login válido do usuário

CT-001.1: Login inválido no sistema
    [Documentation]    Verificar se o usuário consegue realizar login com credenciais válidas e se o sistema exibe uma notificação de erro ao usar credenciais inválidas.
    Acessar url do projeto
    Realizar login inválido do usuário