cd $HOME
rm -r .wine
rm .config/menus/applications-merged/wine*
rm -r .local/share/applications/wine
rm .local/share/desktop-directories/wine*
rm .local/share/icons/????_*.xpm
sudo apt purge winehq-stable && sudo apt autoremove
sudo apt-get update
sudo apt-get autoclean
sudo apt-get clean
sudo apt-get autoremove
