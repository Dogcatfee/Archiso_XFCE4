#!/bin/bash

set -e -u

##Gen locales
sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
#echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen

##Set timezone - Set to US Pacific -8
ln -sf /usr/share/zoneinfo/US/Pacific-New /etc/localtime

##Configure root user, password = toor
usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/
chmod 700 /root
echo -e "toor\ntoor" | passwd root

##Add base user, password = password
useradd -m -G wheel user || echo "User exists"
echo -e "password\npassword" | passwd user
## Add user to sudo
echo 'user ALL=(ALL:ALL) ALL' >> /etc/sudoers
## Change user shell to zsh
chsh -s /bin/zsh user

##Get decorative images for xfce & cinnamon - Now supplied in airootfs/home
#mkdir /home/user/images
#curl https://raw.githubusercontent.com/Dogcatfee/Archiso_XFCE4/master/image_source/images/xfce4_background.png > /home/user/images/xfce4_background.png
#curl  https://raw.githubusercontent.com/Dogcatfee/Archiso_XFCE4/master/image_source/images/xfce4_launcher.png> /home/user/images/xfce4_launcher.png

##Xfce4 configs - Now supplied in airootfs
#mkdir /home/user/.config
#mkdir /home/user/.config/xfce4
#wget https://github.com/Dogcatfee/xfce4_configs/archive/master.zip -P /tmp/xfce4
#unzip /tmp/xfce4/master.zip -d /tmp/xfce4
#cp -r /tmp/xfce4/xfce4_configs-master/xfce4/* /home/user/.config/xfce4

##Cinnamon configs - don't work
#wget https://github.com/Dogcatfee/cinnamon_configs/archive/master.zip -P  /tmp/cinnamon
#unzip /tmp/cinnamon/master.zip -d /tmp/cinnamon
#cp -r /tmp/cinnamon/cinnamon_configs-master/cinnamon /home/user/.cinnamon
#cp /tmp/cinnamon/cinnamon_configs-master/Arc-Dark/cinnamon.css /usr/share/themes/Arc-Dark/cinnamon/

##Fix permissions
# chown root /home - Check in iso for correct home permissions
chown -R user /home/user/images
chown -R user /home/user/.config
#chown -R user /home/user/.cinnamon

##zsh config - need to run as user somehow
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

##Lightdm config - Now supplied in airootfs
#curl https://raw.githubusercontent.com/Dogcatfee/Archiso_XFCE4/master/image_source/images/background.jpg > /etc/lightdm/background.jpg
#echo  "[greeter]" > /etc/lightdm/lightdm-gtk-greeter.conf
#echo  "theme-name = Arc-Dark" >> /etc/lightdm/lightdm-gtk-greeter.conf
#echo  "icon-theme-name = Arc" >> /etc/lightdm/lightdm-gtk-greeter.conf
#echo  "position = 25%,end -50%,center" >> /etc/lightdm/lightdm-gtk-greeter.conf
#echo  "background = /etc/lightdm/background.jpg" >> /etc/lightdm/lightdm-gtk-greeter.conf
#echo  "default-user-image = #applications-internet" >> /etc/lightdm/lightdm-gtk-greeter.conf

##Cinnamon theme settings for Arc-Dark, don't work
#gsettings set org.cinnamon.desktop.wm.preferences theme "Arc-Dark"
#gsettings set org.cinnamon.theme name "Arc-Dark"

##Misc services
#sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

##Enable system services
systemctl enable pacman-init.service choose-mirror.service
systemctl enable lightdm
systemctl enable tlp

##Set graphical for lightdm
systemctl set-default graphical.target
