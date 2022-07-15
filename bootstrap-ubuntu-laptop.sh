# Update apt bits
sudo apt update && sudo apt upgrade -y

# Install VS Code
sudo snap install --classic code

# Install Brave browser
sudo apt install apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser

# Install 1Password
 curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg

 echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list

 sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
 curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
 sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
 curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

 sudo apt update && sudo apt install 1password

 # Install Timeshift
sudo apt install timeshift

# Install Plasma KDE and Chrome Remote Desktop
## More context can be found in the following articles
### https://cloud.google.com/architecture/chrome-desktop-remote-on-compute-engine
### https://support.google.com/chrome/answer/1649523#zippy=%2Cuse-chrome-remote-desktop-on-linux

sudo apt install --assume-yes tasksel

wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb

sudo apt install --assume-yes ./chrome-remote-desktop_current_amd64.deb

sudo DEBIAN_FRONTEND=noninteractive \
    apt install --assume-yes  task-kde-desktop

sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/startkde" > /etc/chrome-remote-desktop-session'