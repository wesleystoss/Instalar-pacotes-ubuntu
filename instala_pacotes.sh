#!/bin/bash

echo "Iniciando a instalação de pacotes e ferramentas no Ubuntu..."

# Atualiza e faz upgrade no sistema
echo "Atualizando e fazendo upgrade no sistema..."
sudo apt update -y && sudo apt upgrade -y
echo "Sistema atualizado."

# --- Instalação de PHP e Ferramentas ---
echo "Instalando PHP e ferramentas relacionadas..."

# PHP
# Usaremos o PHP 8.2 como exemplo. Se precisar de outra versão, altere aqui.
echo "Adicionando PPA para PHP..."
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update -y
echo "Instalando PHP 8.2 e extensões comuns..."
sudo apt install php8.2 -y
sudo apt install php8.2-{cli,fpm,mysql,gd,curl,mbstring,xml,zip,intl} -y
echo "PHP 8.2 instalado."

# Composer
echo "Instalando Composer..."
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
echo "Composer instalado."

# PHPUnit (via Composer)
echo "Instalando PHPUnit globalmente via Composer..."
composer global require phpunit/phpunit --with-all-dependencies
echo "PHPUnit instalado."

# --- Instalação de Python ---
echo "Instalando Python 3 e venv..."
sudo apt install python3 python3-pip python3-venv -y
echo "Python 3 e venv instalados."

# --- Instalação de Aplicativos Desktop ---

# Cursor (Editor de Código)
echo "Instalando Cursor (via Flatpak)..."
# Primeiro, certifique-se de que o Flatpak está instalado
sudo apt install flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.github.cursor.Cursor -y
echo "Cursor instalado via Flatpak."

# WhatsApp Desktop (via Snap)
echo "Instalando WhatsApp Desktop (via Snap)..."
sudo snap install whatsapp-y
echo "WhatsApp Desktop instalado via Snap."

# Spotify (via Snap)
echo "Instalando Spotify (via Snap)...
echo "Instalando Spotify (via Snap)..."
sudo snap install spotify
echo "Spotify instalado via Snap."

echo "---"
echo "Instalação concluída! Alguns aplicativos podem precisar ser abertos para configuração inicial."
echo "Lembre-se de verificar as versões do PHP, Composer e Python para garantir que estão como você precisa."
echo "Você pode abrir o Cursor, WhatsApp e Spotify pelo menu de aplicativos."
