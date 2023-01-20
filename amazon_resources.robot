*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                   https://www.amazon.com.br/
${BUSCA}                 twotabsearchtextbox
${MENU_ELETRONICO}       //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${SUBMENU}               //img[contains(@alt,'Celulares e Comunicação')]
${MARCA}                 //img[@alt='Samsung']
${PRODUTO}               //*[contains(text(),'Samsung Galaxy')]
${ADICIONAR_CARRINHO}    //input[contains(@name,'submit.add-to-cart')]

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
    Wait Until Element Is Visible    locator=//h1[contains(.,'Eletrônicos e Tecnologia')]
    # Submenu Celular
    Click Element                    locator=${SUBMENU}
    Wait Until Element Is Visible    locator=//h1[contains(.,'Celulares e Comunicação')]
    # Marca Samsung
    Click Element                    locator=${MARCA} 
    Wait Until Element Is Visible    locator=${PRODUTO} 
    # Produto Samsung Galaxy
    Click Element                    locator=${PRODUTO}
    # Adiciona ao carrinho
    Click Element                    locator=${ADICIONAR_CARRINHO}   
    # Cancela Seguro
    Click Element                    locator=attach-popover-lgtbox 
    # Verifica se adicionou no carrinho
    Wait Until Element Is Visible    locator=NATC_SMART_WAGON_CONF_MSG_SUCCESS