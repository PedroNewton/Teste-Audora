*** Settings ***
#Essa suíte verifica o site da amazon.com.br
Resource           amazon_resources.robot
Test Setup         Abrir navegador

*** Test Cases ***
Caso de teste
    #Esse teste verifica o site da amazon.com.br
    01 - Acesso ao home page de um e-commerce
    03 - Realizar o login
    04 - Adicionar algo ao carrinho do e-commerce
    05 - Remover os itens adicionados do e-commerce