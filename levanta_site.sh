#!/bin/bash

# DELETANDO REGISTRO ANTERIOR

rm levanta.log

# TROCANDO INFORMACOES NECESSARIAS

echo _________________________________________________________________
echo _________________________________________________________________
echo DIGITE O LINK HTTPS DO REPOSITORIO NO GITHUB:
read linkGithub
echo _________________________________________________________________

# CLONANDO, DO REPOSITORIO, O SITE

echo _________________________________________________________________
echo CLONANDO REPOSITORIO... >> levanta.log
echo CLONANDO REPOSITORIO... 
git clone $linkGithub
echo RETORNO DA EXECUCAO: $? >> levanta.log
echo _________________________________________________________________

# INSTALANDO PACOTES

echo _________________________________________________________________
echo BAIXANDO INFORMACOES DE PACOTES... >> levanta.log
echo BAIXANDO INFORMACOES DE PACOTES... 
apt update
echo RETORNO DA EXECUCAO: $? >> levanta.log
echo _________________________________________________________________
echo _________________________________________________________________
echo INSTALANDO NODE.JS... >> levanta.log
echo INSTALANDO NODE.JS...
apt install nodejs
echo RETORNO DA EXECUCAO: $? >> levanta.log
echo _________________________________________________________________
echo _________________________________________________________________
echo INSTALANDO NPM... >> levanta.log
echo INSTALANDO NPM... 
apt install npm
echo RETORNO DA EXECUCAO: $? >> levanta.log
echo _________________________________________________________________
echo _________________________________________________________________
echo INSTALANDO PM2... >> levanta.log
echo INSTALANDO PM2... 
npm install -g pm2
echo RETORNO DA EXECUCAO: $? >> levanta.log
echo _________________________________________________________________
echo _________________________________________________________________
echo INSTALANDO DEPENDENCIAS DO PROJETO... >> levanta.log
echo INSTALANDO DEPENDENCIAS DO PROJETO... 
cd ./coltrekking/
npm --force install
echo RETORNO DA EXECUCAO: $? >> levanta.log
cd ..
echo _________________________________________________________________

# CORRIGINDO POTENCIAIS PROBLEMAS
echo _________________________________________________________________
echo AUDITORIA >> levanta.log
echo AUDITORIA
npm audit fix --force
echo RETORNO DA EXECUCAO: $? >> levanta.log
npm audit fix --force
echo RETORNO DA EXECUCAO: $? >> levanta.log
echo _________________________________________________________________
# EXECUTANDO O SERVIDOR

echo _________________________________________________________________
echo EXECUTANDO O SERVIDOR >> levanta.log
echo EXECUTANDO O SERVIDOR 
pm2 start ./coltrekking/index.js
echo RETORNO DA EXECUCAO: $? >> levanta.log
echo _________________________________________________________________
echo _________________________________________________________________
echo AUDITORIA DO PROCESSO:
cat levanta.log
echo _________________________________________________________________
echo _________________________________________________________________

unset linkGithub
