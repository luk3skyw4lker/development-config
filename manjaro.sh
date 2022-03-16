#!/bin/sh
cd ~

$(clear >&2)
echo 'Installing GIT...'
sudo pacman -S --needed base-devel git

echo 'Installing Yay...'
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si

cd ~

echo 'Installing Fira Code...'
sudo pacman -S ttf-fira-code

git config --global credential.helper store

sleep 5
$(clear >&2)
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

sleep 5
$(clear >&2)
echo 'Installing ZSH and themes'
sudo pacman -S zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sh -c "$(curl -fsSL https://git.io/zinit-install)"

zsh -c "git clone https://github.com/denysdovhan/spaceship-prompt.git \"$ZSH_CUSTOM/themes/spaceship-prompt\" --depth=1 && ln -s \"$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme\" \"$ZSH_CUSTOM/themes/spaceship.zsh-theme\""

sudo mv /home/luk3skyw4lker/Documents/Personal/development-config/.zshrc /home/

# echo "Installing Insomnia"
# echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
#     | sudo tee -a /etc/apt/sources.list.d/insomnia.list
# sudo apt update
# sudo apt install insomnia

echo 'Installing code'
yay -S visual-studio-code-bin

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
code --install-extension adpyke.codesnap
code --install-extension rangav.vscode-thunder-client

echo 'Installing spotify' 
snap install spotify

echo 'Installing chrome' 
yay -S google-chrome


echo 'Installing NVM' 
sh -c "$(curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash)"

echo 'Installing docker' 
sudo pacman -S docker
sudo systemctl start docker.service
sudo systemctl enable docker.service
docker --version

# sudo groupadd docker
# sudo usermod -aG docker $USER
# newgrp docker

echo "Setup finished!"
