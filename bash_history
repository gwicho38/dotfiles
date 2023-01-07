which $SHELL
zsh
sudo dnf config-manager --add-repo https://repo.vivaldi.com/archive/vivaldi-fedora.repo
sudo dnf install vivaldi-stable
sudo dnf upgrade
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
udo grubby --update-kernel=ALL --args="nvme.noacpi=1"
sudo grubby --update-kernel=ALL --args="nvme.noacpi=1"
dnf install tlp
sudo dnf install tlp
tlp
tlp start
sudo tlp start
reboot
sudo grubby --update-kernel=ALL --args="module_blacklist=hid_sensor_hub"
sudo systemctl enable tlp.service
sudo systemctl start tlp.service
sudo systemctl status tlp.service
sudo systemctl stop power-profiles-daemon.service
sudo systemctl disable power-profiles-daemon.service
sudo systemctl mask power-profiles-daemon.service
sudo dnf install powertop
sudo powertop
sudo powertop --calibrate
sudo grubby --update-kernel=ALL --args="module_blacklist=hid_sensor_hub"
reboot
exit
history | grep sudo dnf
history | grep sudo dfn
history
sudo dnf install rc
sudo dnf install rcm
rcm
man rcm
lsrc
clear
ls
ssh-keygen -t ed25519 -C "luis@lefv.info
ssh-keygen -t ed25519 -C "luis@lefv.info"
man eval
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
ls
ls -a
cd .config/
ls
cd ..
ls
clear
ls
mkrc -v ~/.bashrc
mkdir ~/.dotfiles
mkrc -v ~/.bashrc
lsrc
cd ~/.dotfiles/
git init
git config --global init.defaultBranch main
git branch -m main
clear
ls
git log
clear
ls
git remote add origin git@github.com:gwicho38/dotfiles.git
git status
git add .
git status
git commit -m "Adding bashrc as initial commit."
git config --global user.email "luis@lefv.info"
git config --global user.name "Luis E. Fernandez de la Vara."
git commit -m "Adding bashrc as initial commit."
git push - u origin master
git push -u origin master
git push
git push --set-upstream origin main
git pull
git branch --set-upstream-to=origin/main main
git pull
git push - u origin master
clear
git push -f
git pull
clear
ls
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ls
clear
cd
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
cd
ls
ls -a
/usr/local/
ls
cd /usr/local/
ls
cd bin/
ls
ln -s ~/.local/kitty.app/bin/kitty /usr/local/bin
clear
$HOME
whereis $HOME
cd $HOME
l
sls
ls
clear
mkdir $HOME/.local/bin
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
mkdir -p $HOME/.local/share/applications
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
man sed
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
ls
clear
exit
whoami
clear
sudo dnf install zsh
chsh
zsh
exit
