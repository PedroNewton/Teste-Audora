*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                   https://www.amazon.com.br/
${BUSCA}                 twotabsearchtextbox

*** Keywords ***
Abrir navegador
    Open Browser    browser=chrome
    Maximize Browser Window

01 - Acesso ao home page de um e-commerce
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${BUSCA}