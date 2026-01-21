# Ethereum Docker

Este repositório demonstra como compilar contratos Solidity usando Docker ou localmente no Ubuntu, gerando o bytecode (BIN) e a ABI (Application Binary Interface).

## Instalar Solidity no Ubuntu via apt

    sudo apt install solc

    solc --version
    
Ou instalar via SELECT

    sudo apt install -y python3-pip

    pip3 install solc-select
    solc-select install 0.8.20
    solc-select use 0.8.20
    
    solc --version

## Via Docker

Compilar o contrato diretamente:

    docker run --rm -v $(pwd):/app ethereum/solc:0.8.20 solc /src/Main.sol

## Compile usando Docker (sem Dockerfile)

    docker run --rm -v $(pwd):/app ethereum/solc:0.8.20 /src/Main.sol

## Mostrar o bytecode e ABI (json interface do contrato, Application Binary Interface)

    docker run --rm -v $(pwd):/app ethereum/solc:0.8.20 /app/src/Main.sol --bin --abi
    
    docker run --rm -v $(pwd):/app ethereum/solc:0.8.20 /app/src/Main.sol --bin
    
    docker run --rm -v $(pwd):/app ethereum/solc:0.8.20 /app/src/Main.sol --abi

## Gerar e salvar o bytecode e ABI fisicamente

    docker run --rm -v $(pwd):/app ethereum/solc:0.8.20 /app/src/Main.sol --bin > src/Main.bin
    
    docker run --rm -v $(pwd):/app ethereum/solc:0.8.20 /app/src/Main.sol --abi > src/Main.abi
    
### Limpeza dos arquivos para remover titulo e deixar apenas o conteudo

    tail -n +4 src/Main.bin > src/Main_clean.bin

    tail -n +4 src/Main.abi > src/Main_clean.abi

* Main.bin          → com cabeçalho (opcional para referência)
* Main.abi          → com cabeçalho (opcional para referência)
* Main_clean.bin    → só o bytecode hexadecimal, pronto para Node.js/Hardhat
* Main_clean.abi    → só a ABI JSON, pronto para Node.js/Hardhat

## Observações

O caminho /app/src/Main.sol dentro do container deve corresponder à sua estrutura local: $(pwd)/src/Main.sol.

