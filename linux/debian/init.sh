sudo apt update
sudo apt upgrade -y

sudo apt install git -y

git clone https://github.com/Eythaann/.dotfiles.git

cd .dotfiles/linux/debian

./setup.sh