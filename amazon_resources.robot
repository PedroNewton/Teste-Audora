*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                            https://www.amazon.com.br/
${BUSCA}                          twotabsearchtextbox
${SELECIONA_BUSCA}                nav-search
${BOTAO_BUSCA}                    nav-search-submit-button
${PRODUTO}                        //*[contains(text(),'Samsung Galaxy')]
${ADICIONAR_CARRINHO}             //input[contains(@name,'submit.add-to-cart')]
${IR_CARRINHO}                    //span[@class='a-button a-spacing-top-base a-button-span12 a-button-base celwidget'][contains(.,'Ir para o carrinho')]
${VERIFICA_CARRINHO}              //h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]
${CANCELA_SEGURO}                 attach-popover-lgtbox 
${VERIFICA_ADICIONOU_CARRINHO}    NATC_SMART_WAGON_CONF_MSG_SUCCESS
${EXCLUIR_CARRINHO}               //*[contains(text(),'Excluir')]
${VERIFICA_CARRINHO_COMPRAS}      //h1[contains(.,'Carrinho de compras')]
${LOGIN}                          //span[@class='nav-line-1 nav-progressive-content'][contains(.,'Olá, faça seu login')]
${VERIFICA_TELA_LOGIN}            //h1[contains(.,'Fazer login')]
${CAMPO_EMAIL}                    ap_email
${EMAIL}                          yomeno9337@ibansko.com
${CONTINUE}                       continue
${VERIFICA_TELA_SENHA}            //label[@for='ap_password'][contains(.,'Senha')]
${CAMPO_SENHA}                    ap_password
${SENHA}                          234567
${FAZER_LOGIN}                    signInSubmit

*** Keywords ***
Abrir navegador
    Open Browser    browser=chrome
    Maximize Browser Window
    #Set Window Size    width=2048    height=1080

01 - Acesso ao home page de um e-commerce
    Go To    url=${URL}
    Wait Until Element Is Visible    id=${BUSCA}

03 - Realizar o login
    # Clica no Login
    Click Element                     locator=${LOGIN}
    Wait Until Element Is Visible     locator=${VERIFICA_TELA_LOGIN}
    # Insere o Email
    Input Text                        id=${CAMPO_EMAIL}     text=${EMAIL}
    # Clica para continuar
    Click Button                      id=${CONTINUE}  
    Wait Until Element Is Visible     locator=${VERIFICA_TELA_SENHA} 
    # Clica no campo senha
    Click Button                      id=${CAMPO_SENHA} 
    # Insere a senha
    Input Text                        id=${CAMPO_SENHA}      text=${SENHA} 
    # Clica no botão "Fazer Login"
    Click Button                      id=${FAZER_LOGIN}   
    Wait Until Element Is Visible     id=${BUSCA}

04 - Adicionar algo ao carrinho do e-commerce
    # Seleciona a pesquisa
    Click Element                    id=${SELECIONA_BUSCA}
    # Insere a pesquisa por "Celular Samsung"
    Input Text                       id=${BUSCA}    text=Celular Samsung
    # Clica na busca
    Click Button                     id=${BOTAO_BUSCA}
    Wait Until Element Is Visible    locator=${PRODUTO} 
    # Produto Samsung Galaxy
    Click Element                    locator=${PRODUTO}
    # Adiciona ao carrinho
    Click Element                    locator=${ADICIONAR_CARRINHO}   
    # Verifica se adicionou no carrinho
    Wait Until Element Is Visible    locator=${VERIFICA_ADICIONOU_CARRINHO}

05 - Remover os itens adicionados do e-commerce
    # Ir ao carrinho
    Click Element                    locator=${IR_CARRINHO}
    Wait Until Element Is Visible    locator=${VERIFICA_CARRINHO_COMPRAS} 
    # Excluir do carrinho
    Click Element                    locator=${EXCLUIR_CARRINHO} 
    # Verifica se o carrinho esta vazio
    Wait Until Element Is Visible    locator=${VERIFICA_CARRINHO} 