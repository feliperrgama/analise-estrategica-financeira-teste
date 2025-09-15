*** Settings ***
Documentation     Casos de teste para a automatização de testes no projeto ConexAI
Library           SeleniumLibrary
Resource          ../robot/resources.resource
Test Setup        Abrir O Navegador
Test Teardown     Fechar O Navegador


*** Test Cases ***
CT-001: Login válido no sistema
    [Documentation]    Verificar se o usuário consegue realizar login com credenciais válidas 
    Acessar url do projeto
    Realizar login válido do usuário

CT-001.1: Login inválido no sistema
    [Documentation]    Verificar se o usuário consegue realizar login com credenciais inválidas e se o sistema exibe uma notificação de erro ao usar as credenciais inválidas.
    Acessar url do projeto
    Realizar login inválido do usuário

CT-002: Entrar no chat
    [Documentation]    Verificar se o usuário consegue entrar no chat após realizar login com sucesso.
    Acessar url do projeto
    Realizar login válido do usuário
    Entrar no chat