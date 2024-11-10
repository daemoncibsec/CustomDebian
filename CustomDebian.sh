#!/bin/bash

# Quick reminder, CustomDebian isn't actually fully
# completed yet. I plan on being as ambitious as
# posible with this system (mainly because it's me
# who's going to actually use it the most). That is
# why I want to keep up updating and upgrading this
# script, eliminating GNOME desktop environment,
# putting default aliases for a quicker usage, and
# even implementing a pentest automation script so
# you can rest and have a coffe while an exploited
# student does all the work for you. Anyways,
# I hope you enjoy this desktop. If you want to
# contribute, just let me know some cool things I
# could add to this script to make the final system
# one that is completely unique. If you took the
# time to actually read all of this, I have you
# have a nice day and capture lots of flags!

sudo clear
CUSDEB=$(pwd)
echo ''
echo ' ▗▄▄▖█  ▐▌ ▄▄▄  ■   ▄▄▄  ▄▄▄▄  ▗▄▄▄  ▗▞▀▚▖▗▖   ▄ ▗▞▀▜▌▄▄▄▄  '
echo '▐▌   ▀▄▄▞▘▀▄▄▗▄▟▙▄▖█   █ █ █ █ ▐▌  █ ▐▛▀▀▘▐▌   ▄ ▝▚▄▟▌█   █ '
echo '▐▌        ▄▄▄▀ ▐▌  ▀▄▄▄▀ █   █ ▐▌  █ ▝▚▄▄▖▐▛▀▚▖█      █   █ '
echo '▝▚▄▄▖          ▐▌              ▐▙▄▄▀      ▐▙▄▞▘█            '
echo '               ▐▌                                           '
echo ''

echo ''
echo 'Starting CustomDebian...'
echo ''
echo 'Installing Awesome, Kitty, Compton, Neofetch, Feh, Snap & Snapd!'
echo 'Please wait some minutes...'
echo ''
sudo apt install awesome kitty neofetch compton feh snap snapd -y &> /dev/null
#polybar

#echo ''
#echo 'Configuring Polybar files...'
#echo ''
#mkdir $HOME/.config/polybar
#sudo rm -f /etc/polybar/config.ini
#sudo cp config/config.ini /etc/polybar/
#sudo cp /etc/polybar/config.ini $HOME/.config/polybar/
#sudo cp boot/launch.sh $HOME/.config/polybar
#sudo chmod +x $HOME/.config/polybar/launch.sh

echo ''
echo 'Configuring Awesome files...'
echo ''
mkdir $HOME/.config/awesome
sudo cp config/rc.lua $HOME/.config/awesome
sudo cp config/theme.lua $HOME/.config/awesome/theme.lua
sudo cp config/theme.lua /usr/share/awesome/themes/default/theme.lua
sudo cp wallpapers/wallpaper3.jpg $HOME/.config/awesome/wallpaper3.jpg
sudo cp wallpapers/wallpaper3.jpg /usr/share/awesome/themes/default/wallpaper3.jpg

echo ''
echo 'Configuring Kitty terminal...'
echo ''
mkdir $HOME/.config/kitty
sudo cp config/kitty.conf $HOME/.config/kitty
mkdir -p $HOME/.config/kitty/kitty-themes/themes
cp themes/theme.conf $HOME/.config/kitty/kitty-themes/themes

echo ''
echo "Deleting stuff we're not using..."
echo ''
sudo apt purge gnome-terminal -y &> /dev/null

echo ''
echo 'Basic installation finished.'
echo ''

echo ''
echo "Installing tools for hacking! (I practice in my free time :D)"
echo 'This will take some time. Go grab a coffe and relax.'
echo ''
cd $HOME
mkdir $USERNAME
cd $USERNAME
sudo apt install git -y &> /dev/null
sudo apt install net-tools -y &> /dev/null

# Creating the tools directory to install all sorts of pentesting tools
mkdir tools
cd tools

# I'll add OpenVPN as well so you can play some CTF (I know you guys love it)
sudo apt install openvpn -y &> /dev/null

# Now I'm creating a "spoofer" directory so the user can have some anonymity or perform certain tecniques
mkdir spoofers
cd spoofers
git clone https://github.com/Und3rf10w/kali-anonsurf.git &> /dev/null
cd kali-anonsurf
sudo ./installer.sh &> /dev/null
cd $HOME/$USERNAME/tools

# Now I'm creating a "mqtt" directory so the user can perform attacks to IoT devices
mkdir mqtt
cd mqtt
git clone https://github.com/aravind0x7/Moxie.git &> /dev/null
cd Moxie
chmod +x moxie.sh
cd $CUSDEB

# Making a wordlist directory so it can be accessible ;)
mkdir $HOME/$USERNAME/wordlists
cp wordlists/* $HOME/$USERNAME/wordlists
#cp wordlists/rockyou.txt $HOME/$USERNAME/wordlists
#cp wordlists/100-common-passwords.txt $HOME/$USERNAME/wordlists
#cp wordlists/directory-list-2.3-medium.txt $HOME/$USERNAME/wordlists
#cp wordlists/directory-list-2.3-small.txt $HOME/$USERNAME/wordlists
#cp wordlists/unix_passwords.txt $HOME/$USERNAME/wordlists
#cp wordlists/unix_users.txt $HOME/$USERNAME/wordlists


# Other tools I'm installing that will be useful for performing various attacks
cd $HOME/$USERNAME/tools
sudo apt install mosquitto mosquitto-clients -y &> /dev/null
sudo apt install nmap -y &> /dev/null
sudo apt install wfuzz -y &> /dev/null
sudo apt install gobuster -y &> /dev/null
sudo apt install gpgv2 autoconf bison build-essential postgresql libaprutil1 libgmp3-dev libpcap-dev openssl libpq-dev libreadline6-dev libsqlite3-dev libssl-dev locate libsvn1 libtool libxml2 libxml2-dev libxslt-dev wget libyaml-dev ncurses-dev  postgresql-contrib xsel zlib1g zlib1g-dev curl -y &> /dev/null
sudo apt install curl -y &> /dev/null
mkdir -p $HOME/$USERNAME/tools/exploits/metasploit/
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > $HOME/$USERNAME/tools/exploits/metasploit/msfinstall &> /dev/null
chmod +x $HOME/$USERNAME/tools/exploits/metasploit/msfinstall

echo ''
echo 'Installation finished. Enjoy your CustomDebian!'
echo ''

