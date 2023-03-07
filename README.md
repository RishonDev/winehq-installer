# get-wine-latest.sh
If you get a `permission denied` on any script present in this repository, even with `sudo`, run `sudo. chmod +x *.sh`
(The READEME.md is not a file to be executed)

a simple set of shell scripts to Install\Remove the latest version of wine from winehq's official repositories without any error.
To install wine, Simply copy this:

Ubuntu:
```
sudo apt install wget
wget https://raw.githubusercontent.com/RishonDev/get-wine-latest.sh/main/wine-installer-ubuntu.sh
chmod +x wine-installer-ubuntu.sh
./wine-installer-ubuntu
```

