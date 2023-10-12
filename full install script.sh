# Step 1: Install wget
sudo apt install wget

# Step 2: Install OMV-EXTRAS
wget -O - https://github.com/OpenMediaVault-Plugin-Developers/packages/raw/master/install | bash
# In web GUI under updates enable extras, install share rootfs, and install apt tool.

# Enable OMV-Extras features
sudo omv-config -s -d omvextrasorg
sudo omv-mkconf omvextrasorg apttool
sudo omv-mkconf omvextrasorg rootfs

# Enable OMV-Extras features
sudo omv-config -s -d omvextrasorg
sudo omv-mkconf omvextrasorg apttool
sudo omv-mkconf omvextrasorg rootfs

# Add full Debian 11 Bullseye repositories
echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" | sudo tee -a /etc/apt/sources.list

# Update package lists
sudo apt update

# Continue with your original script from Step 3
# ...



# Step 3: Install Dbus
sudo apt install dbus

# Step 4: Install Systemd
sudo apt install systemd

# Step 5: Install Xorg
sudo apt install xserver-xorg

# Step 6: Install Xorg tools
sudo apt install xorg-x11-utils && xorg-tools

# Step 7: Install xwm
sudo apt install xw.

# Step 8: Reinstall open media vault files
sudo apt install tasksel
wget -O - https://github.com/OpenMediaVault-Plugin-Developers/packages/raw/master/install | sudo bash

# Disable Xorg auto start on login
sudo systemctl set-default multi-user.target

# Allow web panel access via 127.0.0.1
sudo sed -i 's/0.0.0.0/127.0.0.1/g' /etc/openmediavault/config.xml

# Step 9: Use omv-firstaid to join the web GUI back to the network
sudo omv-confdbadm setconf webgui port 80
sudo systemctl restart openmediavault-engined

# Step 10: Use omv-firstaid to re-enter web GUI admin password
sudo omv-confdbadm setconf webadmin password openmediavault
# This will set the password for web GUI to default!

# Step 11: Fix PHP permissions
sudo omv-salt deploy run phpfpm
sudo systemctl restart php-fpm