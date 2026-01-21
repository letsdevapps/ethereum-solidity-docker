#!/bin/bash

# Caminho do contrato
CONTRACT=src/Main.sol

# Docker image
IMAGE=ethereum/solc:0.8.20

# Diretório dentro do container
MOUNT_DIR=/app

echo "Compilando $CONTRACT..."

# Gerar BIN (com cabeçalho)
docker run --rm -v $(pwd):$MOUNT_DIR $IMAGE $MOUNT_DIR/$CONTRACT --bin > Main.bin
echo "Bytecode salvo em Main.bin"

# Gerar ABI (com cabeçalho)
docker run --rm -v $(pwd):$MOUNT_DIR $IMAGE $MOUNT_DIR/$CONTRACT --abi > Main.abi
echo "ABI salva em Main.abi"

# Limpar BIN (remover cabeçalho)
tail -n +4 Main.bin > Main_clean.bin
echo "Bytecode limpo salvo em Main_clean.bin"

# Limpar ABI (remover cabeçalho)
tail -n +4 Main.abi > Main_clean.abi
echo "ABI limpa salva em Main_clean.abi"

echo "Compilação concluída!"

