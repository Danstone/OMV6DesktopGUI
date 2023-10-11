# OMV6DesktopGUI
Desktop Environment On Open Media Vault 6.1

Prerequisites:

Debian Base Files

OMV 6 Extras Package

OMV-EXTRAS-APT-TOOL

OMV-EXTRAS-SHARE-ROOTFS

Add full debian 11 Repository to Open Media Vault Aptitude sources.

Getting started:

1.Install Dbus [sudo apt install dbus]
2. Install Systemd [sudo apt install systemd]
3. Install Xorg [sudo apt install xorg]
4. Install Xorg tools
6. Install xwm [sudo apt install xwm]
7. Reinstall open media vault files (installing x kinda breaks web Gui)
8. Use omv-fistaid to join the web Gui back to network
9. Use omv-fistaid to re enter web Gui admin password
10. Fix PHP permissions because for some reason x session manager breaks PHP because of root user permissions. un: [omv-salt deploy run phpfpm]

Relaunch nginx, re-salt the server. Run: [omv-salt deploy run nginx]
Note do not set X to auto start, this will break open media vault, instead use xinit or startx from cli when you need to use the gui
Use ctrl+c to close a desktop app.
