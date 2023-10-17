sudo apt install curl wget exa zip unzip rsync

curl -s https://ohmyposh.dev/install.sh | sudo bash -s

rm -rf ~/.bashrc
ln -sv ~/.dotfiles/.bashrc ~/.bashrc

rm -rf ~/.gitconfig
ln -sv ~/.dotfiles/.gitconfig ~/.gitconfig

source ~/.bashrc