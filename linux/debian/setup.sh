sudo apt install -y \
  curl \
  wget \
  zip \
  unzip \

# install kubectl
curl -LO /tmp/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 /tmp/kubectl /usr/local/bin/kubectl
rm -f /tmp/kubectl

# customizations
curl -sS https://starship.rs/install.sh | sh

# create symlinks
ln -sf ~/.dotfiles/linux/debian/.bashrc ~/.bashrc
ln -sf ~/.dotfiles/linux/debian/.config ~/.config
ln -sf ~/.dotfiles/linux/debian/.config/git/config ~/.gitconfig