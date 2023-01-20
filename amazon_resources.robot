*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                            https://www.amazon.com.br/
${BUSCA}                          twotabsearchtextbox
${MENU_ELETRONICO}                //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${SUBMENU}                        //img[contains(@alt,'Celulares e Comunicação')]
${MARCA}                          //img[@alt='Samsung']
${PRODUTO}                        //*[contains(text(),'Samsung Galaxy')]
${ADICIONAR_CARRINHO}             //input[contains(@name,'submit.add-to-cart')]
${IR_CARRINHO}                    //span[@class='a-button a-spacing-top-base a-button-span12 a-button-base celwidget'][contains(.,'Ir para o carrinho')]
${VERIFICA_CARRINHO}              //h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]
${VERIFICA_MENU_ELETRONICO}       //h1[contains(.,'Eletrônicos e Tecnologia')]
${VERIFICA_SUBMENU}               //h1[contains(.,'Celulares e Comunicação')]
${CANCELA_SEGURO}                 attach-popover-lgtbox 
${VERIFICA_ADICIONOU_CARRINHO}    NATC_SMART_WAGON_CONF_MSG_SUCCESS
${EXCLUIR_CARRINHO}               //*[contains(text(),'Excluir')]
${VERIFICA_CARRINHO_COMPRAS}      //h1[contains(.,'Carrinho de compras')]

*** Keywords ***
Abrir navegador
    Open Browser    browser=chrome
    Maximize Browser Window

01 - Acesso ao home page de um e-commerce
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${BUSCA}

04 - Adicionar algo ao carrinho do e-commerce
    # Menu Eletronico
    Click Element                    locator=${MENU_ELETRONICO}
    Wait Until Element Is Visible    locator=${VERIFICA_MENU_ELETRONICO} 
    # Submenu Celular
    Click Element                    locator=${SUBMENU}
    Wait Until Element Is Visible    locator=${VERIFICA_SUBMENU}
    # Marca Samsung
    Click Element                    locator=${MARCA} 
    Wait Until Element Is Visible    locator=${PRODUTO} 
    # Produto Samsung Galaxy
    Click Element                    locator=${PRODUTO}
    # Adiciona ao carrinho
    Click Element                    locator=${ADICIONAR_CARRINHO}   
    # Cancela Seguro
    Click Element                    locator=${CANCELA_SEGURO}
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