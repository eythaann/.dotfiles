sudo apt install curl wget exa zip unzip rsync

~/.dotfiles/installers/node.bash
~/.dotfiles/installers/brew.sh

curl -s https://ohmyposh.dev/install.sh | sudo bash -s

rm -rf ~/.bashrc
ln -sv ~/.dotfiles/.bashrc ~/.bashrc

rm -rf ~/.gitconfig
ln -sv ~/.dotfiles/.gitconfig ~/.gitconfig

rm -rf ~/.vscode-server/extensions/DeepTypes-Theme
ln -sv ~/.dotfiles/DeepType-Theme ~/.vscode-server/extensions/DeepTypes-Theme

source ~/.bashrc