#!/bin/sh
cd ~

sudo apt-get update

echo 'Installing GIT...'
sudo apt install git fonts-firacode

echo 'Installing curl...' 
sudo apt install curl -y

git config --global credential.helper store

echo 'Creating work dir...'
mkdir /home/luk3skyw4lker/Documents/Bristom

echo 'Cloning work repos...'
cd /home/luk3skyw4lker/Documents/Bristom

git clone -q https://code.supera.com.br/Bristom/api.git bristom-strapi
cd bristom-strapi

git config user.name "Lucas Henrique"
git config user.email "lucashenriqueblemos@gmail.com"

cd ..

git clone -q https://code.supera.com.br/Bristom/bristom-sql-api.git bristom-api
cd bristom-api

git config user.name "Lucas Henrique"
git config user.email "lucashenriqueblemos@gmail.com"

cd ..

git clone -q https://code.supera.com.br/Bristom/bristom-pro.git
cd bristom-pro

git config user.name "Lucas Henrique"
git config user.email "lucashenriqueblemos@gmail.com"

cd ..

git clone -q https://code.supera.com.br/Bristom/weather-crawler.git
cd weather-crawler

git config user.name "Lucas Henrique"
git config user.email "lucashenriqueblemos@gmail.com"

cd ..

git clone -q https://code.supera.com.br/Bristom/bristom-painel.git
cd bristom-painel

git config user.name "Lucas Henrique"
git config user.email "lucashenriqueblemos@gmail.com"

cd ..

git clone -q https://code.supera.com.br/Bristom/ultralog-collector.git
cd ultralog-collector

git config user.name "Lucas Henrique"
git config user.email "lucashenriqueblemos@gmail.com"

cd ..

echo 'Creating personal dirs'
mkdir /home/luk3skyw4lker/Documents/Personal

echo 'Cloning personal repos'
cd /home/luk3skyw4lker/Documents/Personal

git clone -q https://github.com/luk3skyw4lker/luk3skyw4lker-blog.git
cd luk3skyw4lker-blog

git config user.name "luk3skyw4lker"
git config user.email "lucashenriqueblemos@gmail.com"

cd ..

git clone -q https://github.com/luk3skyw4lker/development-config.git
cd development-config

git config user.name "luk3skyw4lker"
git config user.email "lucashenriqueblemos@gmail.com"

cd ~

echo 'Installing ZSH and themes'
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

zsh -c "git clone https://github.com/denysdovhan/spaceship-prompt.git \"$ZSH_CUSTOM/themes/spaceship-prompt\" --depth=1 && ln -s \"$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme\" \"$ZSH_CUSTOM/themes/spaceship.zsh-theme\""

sudo mv /home/luk3skyw4lker/Documents/Personal/development-config/.zshrc /home/

echo 'Installing code'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y # or code-insiders

echo 'Installing VSCode extensions'
code --install-extension naumovs.color-highlight
code --install-extension mikestead.dotenv
code --install-extension dbaeumer.vscode-eslint
code --install-extension eamodio.gitlens
code --install-extension pkief.material-icon-theme
code --install-extension rocketseat.theme-omni
code --install-extension wix.vscode-import-cost
code --install-extension golang.go
code --install-extension esbenp.prettier-vscode
code --install-extension rocketseat.rocketseatreactjs
code --install-extension ms-azuretools.vscode-docker

echo 'Installing spotify' 
snap install spotify

echo 'Installing chrome' 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo 'Installing NVM' 
sh -c "$(curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash)"

echo 'Installing docker' 
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
docker --version

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

echo "Setup finished!"
