*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}        http://localhost:3001/

${LOCATOR_LOGO_CONEXAI_HOMEPAGE}     //*[@id="app"]/div/div[1]/div/div[1]/div[1]/img

${BTN-START}   //*[@class="btn"]   #X path do botão start do chat

${SUGESTÃO-DE-CONVERSA-6}    //*[@id="app"]/div/div[1]/div/div[2]/div[1]/div/div[1]/div[6]

${SUGESTÃO_DE_CONVERSA_1}    //*[@id="app"]/div/div[1]/div/div[2]/div[1]/div/div[1]/div[1]

${INPUT_TEXT_CHAT}    //*[@id="app"]/div/div[1]/div/div[2]/div[2]/input

${BTN_DE_ENVIAR_PROMPT}    //*[@id="app"]/div/div[1]/div/div[2]/div[2]/img

${SUGESTÃO_DE_CONVERSA_1}    //*[@id="app"]/div/div[1]/div/div[2]/div[1]/div/div[1]/div[1]

${RESPOSTA-DO-MODEL}    //*[@id="app"]/div/div[1]/div/div[2]/div[1]/div/div/div[2]


@{LIST_OF_OPTIONS_FONT_SIZE}    //*[@id="app"]/div/div[1]/div/div[1]/div[3]/div/ul/li[1]    //*[@id="app"]/div/div[1]/div/div[1]/div[3]/div/ul/li[2]    //*[@id="app"]/div/div[1]/div/div[1]/div[3]/div/ul/li[3]    //*[@id="app"]/div/div[1]/div/div[1]/div[3]/div/ul/li[4]    //*[@id="app"]/div/div[1]/div/div[1]/div[3]/div/ul/li[5]    //*[@id="app"]/div/div[1]/div/div[1]/div[3]/div/ul/li[6]    //*[@id="app"]/div/div[1]/div/div[1]/div[3]/div/ul/li[7]

@{FONTS_SIZES}    12px    14px    16px    18px    20px    22px    24px

${PROMPT_GRAPHS}    Analise a performance das minhas vendas este ano

${OPÇÕES_DA_CONVERSA}    //*[@id="app"]/div/div[1]/div/div[2]/div/div[2]/ul/li[1]/div[2]/img

${BTN_EDITAR_TÍTULO_DA_CONVERSA}    //*[@id="app"]/div/div[1]/div/div[2]/div/div[2]/ul/li[1]/div[2]/div/div[1]

${BTN_REMOVER_CONVERSA}    //*[@id="app"]/div/div[1]/div/div[2]/div/div[2]/ul/li[n]/div[2]/div/div[2]

${BTN_DE_ENVIAR_PROMPT}    //*[@id="app"]/div/div[1]/div/div[2]/div[2]/img

${INPUT_EDITAR_TÍTULO_DA_CONVERSA}    //*[@id="app"]/div/div[1]/div/div[2]/div/div[2]/ul/li/div/div/input//div    #Talvez seja necessário remover este '//div' do final do locator

${INPUT_FILTRO_CONVERSAS}    //*[@id="app"]/div/div[1]/div/div[2]/div/div[1]/input

${BTN-LIKE}    //*[@id="app"]/div/div[1]/div/div[2]/div[1]/div/div/div[2]/div[2]/button[3]

${BTN-DESLIKE}    //*[@id="app"]/div/div[1]/div/div[2]/div[1]/div/div/div[2]/div[2]/button[4]




*** Keywords ***
Abrir O Navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar O Navegador
    Close All Browsers

Acessar url do projeto
    Go To    url=${URL}
    Sleep    time_=0.2s

Realizar login válido do usuário
    Click Element    locator=//*[@id="username"]
    Input Text    locator=//*[@id="username"]    text=cepedirestic36
    Click Element    locator=//*[@id="password"]
    Input Password    locator=//*[@id="password"]    password=dC2^OuQ$g1O4
    Sleep    time_=1s
    Click Button    locator=//*[@id="app"]/div/div[8]/form/button
    Wait Until Page Contains Element    locator=${BTN-START}  timeout=5s

Realizar login inválido do usuário
    Click Element    locator=//*[@id="username"]
    Sleep    time_=3s
    Input Text    locator=//*[@id="username"]    text=usuario_invalido
    Click Element    locator=//*[@id="password"]
    Sleep    time_=3s
    Input Text    locator=//*[@id="password"]    text=senha_invalida
    Sleep    time_=1s
    Click Button    locator=//*[@id="app"]/div/div[8]/form/button
    Sleep    time_=2s

Entrar no chat
    Wait Until Page Contains Element    locator=${BTN-START}  timeout=5s
    Click Element    locator=${BTN-START}
    Sleep    time_=1s
    Wait Until Page Contains Element    locator=${LOCATOR_LOGO_CONEXAI_HOMEPAGE}  timeout=5s
    Element Should Be Visible    locator=${LOCATOR_LOGO_CONEXAI_HOMEPAGE} 

Enviar prompt ao chat via sugestão de conversa
    Wait Until Element Is Visible    locator=${SUGESTÃO-DE-CONVERSA-6}  timeout=2s
    Click Element    locator=${SUGESTÃO-DE-CONVERSA-6}
    Sleep    time_=10s
#    Capture Page Screenshot
    
Verificar resposta do chat
    ${RESULT}=  Run Keyword And Return Status    Page Should Contain Element    locator=${BTN-LIKE}
    IF    ${RESULT}==${True}
        Log    message=/=====================/${\n}
        Log    A resposta do modelo foi carregada! (O modelo gerou uma resposta)${\n}
        Log    message=/=====================/${\n}

        Log To Console    message=/=====================/${\n}
        Log To Console   A resposta do modelo foi carregada! (O modelo gerou uma resposta)${\n}
        Log To Console    message=/=====================/${\n}

        ${RESPOSTA_DO_MODELO}=   Get Text    locator=//*[@id="app"]/div/div[1]/div/div[2]/div[1]/div/div/div[2]
        Log    ${\n} ${RESPOSTA_DO_MODELO} ${\n}
        IF    ${RESPOSTA_DO_MODELO} == *Resposta do modelo via API*
            Log    message=/=====================/${\n}
            Log    message=A resposta do modelo foi carregada corretamente.
            Log    message=/=====================/${\n}

            Log To Console    message=/=====================/${\n}
            Log To Console    message=A resposta do modelo foi carregada corretamente.
            Log To Console    message=/=====================/${\n}
        ELSE
            Log    message=/=====================/${\n}
            Fail    A resposta do modelo não foi carregada corretamente.message
            Log    message=/=====================/${\n}

            Log To Console    message=/=====================/${\n}
            Log To Console    A resposta do modelo não foi carregada corretamente.message
            Log To Console    message=/=====================/${\n}
        
        END
    ELSE IF    ${RESULT}==*Frase de erro no processamente da resposta por parte do modelo*
        Log    message=/=====================/${\n}
        Fail    A resposta do modelo não foi carregada. (O modelo não gerou nenhuma reposta)${\n}
        Log    message=/=====================/${\n}

        Log To Console    message=/=====================/${\n}
        Log To Console    message=A resposta do modelo não foi carregada. (O modelo não gerou nenhuma reposta)${\n}
        Log To Console    message=/=====================/${\n}
    END

    

Enviar prompt ao chat via input de texto
    Wait Until Element Is Visible    locator=${INPUT_TEXT_CHAT}  timeout=2s
    Click Element    locator=${INPUT_TEXT_CHAT}
    Input Text    locator=${INPUT_TEXT_CHAT}   text=Liste os nomes dos clientes que cancelaram e o valor total de seus contratos.
    Click Element    locator=${BTN_DE_ENVIAR_PROMPT}
    Press Keys       ${INPUT_TEXT_CHAT}        ENTER
    Sleep    time_=10s

Expandir a tela do chat
    Wait Until Element Is Visible    locator=//*[@id="app"]/div/div[1]/div/div[1]/div[2]/button[2]
    Click Element    locator=//*[@id="app"]/div/div[1]/div/div[1]/div[2]/button[2]
    Sleep    time_=2.5s
    Click Element    locator=//*[@id="app"]/div/div[1]/div/div[1]/div[2]/button[2]
    Sleep    time_=2.5s

Entrar no menu do chat
    Wait Until Element Is Visible    locator=//*[@id="app"]/div/div[1]/div/div[1]/div[2]/div
    Click Element    locator=//*[@id="app"]/div/div[1]/div/div[1]/div[2]/div
    Sleep    time_=3.5s
    Wait Until Element Is Visible    locator=//*[@id="app"]/div/div[1]/div/div[1]/div[2]/div/div/div[1]    #Opção 'Histórico' no menu de opções
    Wait Until Element Is Visible    locator=//*[@id="app"]/div/div[1]/div/div[1]/div[2]/div/div/div[2]    #Opção 'Transcrição' no menu de opções
    Wait Until Element Is Visible    locator=//*[@id="app"]/div/div[1]/div/div[1]/div[2]/div/div/div[3]    #Opção 'Tamanho da fonte' no menu de opções

Entrar no histórico do chat
    Click Element    locator=//*[@id="app"]/div/div[1]/div/div[1]/div[2]/div/div/div[1]
    Wait Until Element Is Visible    locator=//*[@id="app"]/div/div[1]/div/div[2]/div/div[2]/ul/li[1]    timeout=5s    #Conversa salva mais recente no histórico
    Wait Until Element Is Visible    locator=${INPUT_FILTRO_CONVERSAS}    timeout=5s


Verificar se os tamanhos da fonte estão visíveis no menu
    Click Element    locator=//*[@id="app"]/div/div[1]/div/div[1]/div[2]/div/div/div[3]
    Sleep    time_=2s
    FOR    ${FONT_SIZE}    IN    @{LIST_OF_OPTIONS_FONT_SIZE}
        ${status_1}=    Run Keyword And Return Status    Wait Until Element Is Visible    locator=${FONT_SIZE}    timeout=2s
        ${status_2}=    Run Keyword And Return Status    Page Should Contain Element    locator=${FONT_SIZE}
        ${status_3}=    Run Keyword And Return Status    Element Should Be Visible    locator=${FONT_SIZE}
    
        IF    ${status_1}
            Log To Console    message=/=====================/${\n}
            Log To Console    O status 1 funcionou ${\n}
            Log To Console    message=/=====================/${\n}
        ELSE IF    ${status_2}
            Log To Console    message=/=====================/${\n}
            Log To Console    O status 2 funcionou ${\n}
            Log To Console    message=/=====================/${\n}
        ELSE IF    ${status_3}
            Log To Console    message=/=====================/${\n}
            Log To Console    O status 3 funcionou ${\n}
            Log To Console    message=/=====================/${\n}
        ELSE
            Log To Console    message=/=====================/${\n}
            Fail    A opção de tamanho de fonte, que tem o locator -> ${FONT_SIZE}, não está visível no menu.\${\n} 
            Log To Console    message=/=====================/${\n}
        END
    END
#    FOR    ${FONT_SIZE}    IN    @{LIST_OF_OPTIONS_FONT_SIZE}
#        ${RESULT}=    Run Keyword And Return Status    Page Should Contain Element    locator=${FONT_SIZE}
#        IF    ${RESULT}==${True}
#            FOR    ${counter}    IN RANGE    0    6    1
#                IF    ${FONT_SIZE}==${LIST_OF_OPTIONS_FONT_SIZE[${counter}]}
#                    Log    message=/=====================/${\n}
#                    Log    message=O tamanho da fonte ${FONTS_SIZES[${counter}]} está visível! ${\n}
#                    Log    message=/=====================/${\n}
#
#                    Log To Console    message=/=====================/${\n}
#                    Log To Console    message=O tamanho da fonte ${FONTS_SIZES[${counter}]} está visível! ${\n}
#                    Log To Console    message=/=====================/${\n}
#                END
#            END
#        ELSE
#            Log    message=/=====================/${\n}
#            Fail    A opção de tamanho de fonte, que tem o locator -> ${FONT_SIZE}, não está visível no menu.\${\n} 
#            Log    message=/=====================/${\n}
#
#           Log To Console    message=/=====================/${\n}
#            Log To Console    message=A opção de tamanho de fonte, que tem o locator -> ${FONT_SIZE}, não está visível no menu.\${\n} 
#            Log To Console    message=/=====================/${\n}
#        END
    # END

Trocar o tamanho das fontes no chat via menu
#    Click Element    locator=//*[@id="app"]/div/div[1]/div/div[1]/div[2]/div/div/div[3]

    FOR    ${FONT_SIZE}    IN    @{LIST_OF_OPTIONS_FONT_SIZE}
        Click Element    locator=${FONT_SIZE}
        ${css_font_size}=    Execute Javascript    return window.getComputedStyle(document.querySelector('${SUGESTÃO-DE-CONVERSA-6}')).getPropertyValue('font-size');

        FOR    ${counter}    IN RANGE    0    6    1
            IF    ${FONT_SIZE}==${LIST_OF_OPTIONS_FONT_SIZE[${counter}]}
                Log    message=/=====================/${\n}
                Log    message=Fonte escolhida: ${FONTS_SIZES[${counter}]} - Font-size da sugestão de conversa 6: ${css_font_size}${\n}
                Log    message=/=====================/${\n}

                Log To Console    message=/=====================/${\n}
                Log To Console    message=Fonte escolhida: ${FONTS_SIZES[${counter}]} - Font-size da sugestão de conversa 6: ${css_font_size}${\n}
                Log To Console    message=/=====================/${\n}
            END
            
        END
    END
#        Capture Page Screenshot
#        ${SUGESTÃO_STYLE}=    Get Element Attribute    locator=${SUGESTÃO-DE-CONVERSA-6}    attribute=style
#        FOR    ${counter}    IN RANGE    0    6    1
#            IF    ${FONT_SIZE}==${LIST_OF_OPTIONS_FONT_SIZE[${counter}]}
#                Log    message=/=====================/${\n}
#                Log    message=Fonte escolhida: ${FONTS_SIZES[${counter}]} - Style da sugestão de conversa 6: ${SUGESTÃO_STYLE}${\n}
#                Log    message=/=====================/${\n}

#                Log To Console    message=/=====================/${\n}
#                Log To Console    message=Fonte escolhida: ${FONTS_SIZES[${counter}]} - Style da sugestão de conversa 6: ${SUGESTÃO_STYLE}${\n}
#                Log To Console    message=/=====================/${\n}
#            END
#        END
#        Entrar no menu do chat
#        Entrar no histórico do chat 
#    END


Verificar se os opções de transcrição da conversa estão visíveis no menu
    Click Element    locator=//*[@id="app"]/div/div[1]/div/div[1]/div[2]/div/div/div[2]
    Wait Until Element Is Visible    locator=//*[@id="app"]/div/div[1]/div/div[1]/div[2]/div/div/div[2]/div/ul/li[1]    timeout=5s

    

Escolher a opção de transcrição da conversa
    Click Element    locator=*Tenho que colocar aqui as opções de transcrição de conversa*
    

Iniciar uma nova conversa
    Sleep    time_=10s
    Click Element    locator=//*[@id="app"]/div/div[1]/div/div[1]/div[2]/button[1]
    Sleep    time_=2.5s
    ${RESULT}=   Run Keyword And Return Status    Page Should Contain Element    locator=${SUGESTÃO_DE_CONVERSA_1}
    IF    ${RESULT}==${True}
        Log    message=/=====================/${\n}
        Log    A nova conversa foi iniciada com sucesso! Pois a sugestão 6 apareceu na tela do chat.\${\n}
        Log    message=/=====================/${\n}

        Log To Console    message=/=====================/${\n}
        Log To Console    A nova conversa foi iniciada com sucesso! Pois a sugestão 6 apareceu na tela do chat.\${\n}
        Log To Console    message=/=====================/${\n}
    ELSE
        Log    message=/=====================/${\n}
        Fail    A nova conversa não foi iniciada com sucesso! Pois a sugestão 6 não apareceu na tela do chat.${\n}
        Log    message=/=====================/${\n}

        Log To Console    message=/=====================/${\n}
        Log To Console    A nova conversa não foi iniciada com sucesso! Pois a sugestão 6 não apareceu na tela do chat.${\n}
        Log To Console    message=/=====================/${\n}
    END


Iniciar uma nova conversa via histórico
    Click Element    locator=//*[@id="app"]/div/div[1]/div/div[1]/div[2]/button[1]
    Sleep    time_=2.5s
    ${RESULT}=   Run Keyword And Return Status    Page Should Contain Element    locator=${SUGESTÃO-DE-CONVERSA-6}
    IF    ${RESULT}==${True}
        Log    message=/=====================/${\n}
        Log    A nova conversa foi iniciada com sucesso! Pois a sugestão 6 apareceu na tela do chat.${\n}
        Log    message=/=====================/${\n}

        Log To Console    message=/=====================/${\n}
        Log To Console    A nova conversa foi iniciada com sucesso! Pois a sugestão 6 apareceu na tela do chat.${\n}
        Log To Console    message=/=====================/${\n}
    ELSE
        Log    message=/=====================/${\n}
        Fail    A nova conversa não foi iniciada com sucesso! Pois a sugestão 6 não apareceu na tela do chat.${\n}
        Log    message=/=====================/${\n}

        Log To Console    message=/=====================/${\n}
        Log To Console    A nova conversa não foi iniciada com sucesso! Pois a sugestão 6 não apareceu na tela do chat.${\n}
        Log To Console    message=/=====================/${\n}
    END


Enviar prompt ao chat via input de texto para gerar gráfico
    Click Element    locator=${INPUT_TEXT_CHAT}
    Input Text    locator=${INPUT_TEXT_CHAT}   text=${PROMPT_GRAPHS}


Verificar se há um gráfico na resposta do modelo via tela
    Sleep    time_=15s
    Capture Page Screenshot


Entrar nas opções da conversa no histórico
    Click Element    locator=${OPÇÕES_DA_CONVERSA}
    Wait Until Element Is Visible    locator=${BTN_EDITAR_TÍTULO_DA_CONVERSA}    timeout=5s
    Wait Until Element Is Visible    locator=${BTN_REMOVER_CONVERSA}    timeout=5s

Modificar o título de uma conversa no histórico do chat
    Click Element    locator=${BTN_EDITAR_TÍTULO_DA_CONVERSA}
    Wait Until Element Is Visible    locator=${INPUT_EDITAR_TÍTULO_DA_CONVERSA}    timeout=5s
    Input Text    locator=${INPUT_EDITAR_TÍTULO_DA_CONVERSA}    text=Batatinha quando nasce
    Click Element    locator=${BTN_EDITAR_TÍTULO_DA_CONVERSA}
    ${RESULT}=    Run Keyword And Return Status     Page Should Contain    text=Batatinha quando nasce
    IF    ${RESULT}
        Log    message=/=====================/${\n}
        Log    O título da conversa foi modificado com sucesso! Pois o novo título apareceu no histórico.\${\n}
        Log    message=/=====================/${\n}

        Log To Console   message=/=====================/${\n}
        Log To Console   O título da conversa foi modificado com sucesso! Pois o novo título apareceu no histórico.\${\n}
        Log To Console    message=/=====================/${\n}
    ELSE
        Log    message=/=====================/${\n}
        Fail    O título da conversa não foi modificado com sucesso! Pois o novo título não apareceu no histórico.${\n}
        Log    message=/=====================/${\n}

        Log To Console    message=/=====================/${\n}
        Log To Console    message=O título da conversa não foi modificado com sucesso! Pois o novo título não apareceu no histórico.${\n}
        Log To Console    message=/=====================/${\n}
    END


Excluir uma conversa no histórico do chat
    ${TEXT}=    Get Text    locator=//*[@id="app"]/div/div[1]/div/div[2]/div/div[2]/ul/li[1]    #pegar o texto específico da conversa que serpa excluida
    Click Element    locator=${BTN_REMOVER_CONVERSA}
    Wait Until Element Is Visible    locator=//*[@id="app"]/div/div[9]/div/div[2]/div/button[2]    timeout=1.5s    #Botão para confirmar a exclusão da conversa
    Click Element    locator=//*[@id="app"]/div/div[9]/div/div[2]/div/button[2]        #Clicar no botão para confirmar a exclusão da conversa
    Sleep    time_=2s
    Capture Page Screenshot
    ${RESULT}=   Run Keyword And Return Status    Page Should Contain    text=${TEXT}
    IF    ${RESULT}==${True}
        Log    message=/=====================/${\n}
        Log    A conversa foi excluída com sucesso! Pois o texto da conversa não aparece mais no histórico.${\n}
        Log    message=/=====================/${\n}

        Log To Console    message=/=====================/${\n}
        Log To Console    message=A conversa foi excluída com sucesso! Pois o texto da conversa não aparece mais no histórico.${\n}
        Log To Console    message=/=====================/${\n}
    ELSE
        Log    message=/=====================/${\n}
        Fail    A conversa não foi excluída com sucesso! Pois o texto da conversa ainda aparece no histórico.${\n}
        Log    message=/=====================/${\n}

        Log To Console    message=/=====================/${\n}
        Log To Console    message=A conversa não foi excluída com sucesso! Pois o texto da conversa ainda aparece no histórico.${\n}
        Log To Console    message=/=====================/${\n}
    END


Copiar resposta da IA 
    Click Element    locator=//*[@id="app"]/div/div[1]/div/div[2]/div[1]/div/div/div[2]/div[2]/button[2]
    Click Element    locator=${INPUT_TEXT_CHAT}
    Press Keys       ${INPUT_TEXT_CHAT}        CTRL+c
    ${TEXT}=    Get Text    locator=${INPUT_TEXT_CHAT}
    IF    ${TEXT}==*reposta do modelo via API*
        Log    message=/=====================/${\n}
        Log    A resposta da IA foi copiada com sucesso!${\n}
        Log    message=/=====================/${\n}

        Log To Console    message=/=====================/${\n}
        Log To Console    message=A resposta da IA foi copiada com sucesso!${\n}
        Log To Console    message=/=====================/${\n}
    ELSE
        Log        message=/=====================/${\n}
        Fail       A resposta da IA não foi copiada${\n}
        Log        message=/=====================/${\n}

        Log To Console    message=/=====================/${\n}
        Log To Console    message=A resposta da IA não foi copiada${\n}
        Log To Console    message=/=====================/${\n}
    END


Dar "Like" na resposta da IA
    Click Element    locator=${BTN-LIKE}
    Capture Element Screenshot    locator=${BTN-LIKE}
    
Dar "Dislike" na resposta da IA
    Click Element    locator=${BTN-DESLIKE}
    Capture Element Screenshot    locator=${BTN-DESLIKE}


