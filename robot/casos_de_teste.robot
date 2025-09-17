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

CT-003: Enviar prompt ao chat via sugestão de conversa
    [Documentation]    Verificar se o usuário consegue enviar um prompt ao chat via sugestão de conversa e se o chat responde corretamente.
    Acessar url do projeto
    Realizar login válido do usuário
    Entrar no chat
    Enviar prompt ao chat via sugestão de conversa
    Verificar resposta do chat

CT-004: Enviar prompt ao chat via input de texto
    [Documentation]    Verificar se o usuário consegue enviar um prompt ao chat via input de texto e se o chat responde corretamente.
    Acessar url do projeto
    Realizar login válido do usuário
    Entrar no chat
    Enviar prompt ao chat via input de texto
    Verificar resposta do chat

CT-005: Expandir a tela do chat e voltar ao tamanho normal
    [Documentation]    Verificar se o usuário consegue expandir a tela do chat para o modo tela expandida e se ele consegue fazer o processo inverso - voltar ao tamanho original.
    Acessar url do projeto
    Realizar login válido do usuário
    Entrar no chat
    Expandir a tela do chat

CT-006: Menu do chat
    [Documentation]    Verificar se o usuário consegue acessar o menu de opções - o ícone 'hamburguer'
    Acessar url do projeto
    Realizar login válido do usuário
    Entrar no chat
    Entrar no menu do chat

CT-007: Entrar no histórico do chat via menu
    [Documentation]    Verificar se o usuário consegue entrar o histórico do chat via menu.
    Acessar url do projeto
    Realizar login válido do usuário
    Entrar no chat
    Entrar no menu do chat
    Entrar no histórico do chat

CT-008: Trocar o tamanho das fontes no chat via menu
    [Documentation]    Verificar se o usuário consegue trocar o tamanho das fontes no chat.
    Acessar url do projeto
    Realizar login válido do usuário
    Entrar no chat
    Entrar no menu do chat
    Verificar se os tamanhos da fonte estão visíveis no menu
    Trocar o tamanho das fontes no chat via menu

CT-009: Transcrição da conversa
    [Documentation]    Verificar se o usuário consegue baixar a trasncrição da conversa atual do chat
    Acessar url do projeto
    Realizar login válido do usuário
    Entrar no chat
    Entrar no menu do chat
    Verificar se os opções de transcrição da conversa estão visíveis no menu
    Escolher a opção de transcrição da conversa

CT-010: Iniciar uma nova conversa
    [Documentation]    Verificar se o usuário consegue iniciar uma nova conversa no chat pelo botão de Nova
    Acessar url do projeto
    Realizar login válido do usuário
    Entrar no chat
    Enviar prompt ao chat via sugestão de conversa
    Enviar prompt ao chat via input de texto
    Iniciar uma nova conversa

CT-010.1: Iniciar uma nova conversa via histórico
    [Documentation]    Verificar se o usuário consegue iniciar uma nova conversa no chat pelo histórico de conversas
    Acessar url do projeto
    Realizar login inválido do usuário
    Entrar no chat
    Enviar prompt ao chat via sugestão de conversa
    Enviar prompt ao chat via input de texto
    Entrar no menu do chat
    Entrar no histórico do chat
    Iniciar uma nova conversa via histórico


CT-011: Verificar a geração de gráficos do modelo
    [Documentation]    Verificar se o modelo gera gráficos quando o prompt enviado requer a geração de gráficos.
    Acessar url do projeto
    Realizar login válido do usuário
    Entrar no chat
    Enviar prompt ao chat via input de texto para gerar gráfico
    Verificar resposta do chat
    Verificar se há um gráfico na resposta do modelo via tela

CT-012: MOdificar o título de uma conversa no histórico do chat
    [Documentation]    Verificar se o usuário consegue modificar o título de uma conversa no histórico do chat.
    Acessar url do projeto
    Realizar login válido do usuário
    Entrar no chat
    Entrar no menu do chat
    Entrar no histórico do chat
    Entrar nas opções da conversa no histórico
    Modificar o título de uma conversa no histórico do chat
    