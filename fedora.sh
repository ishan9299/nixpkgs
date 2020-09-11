#! /bin/sh

echo "fastestmirror=True" | sudo tee -a /etc/dnf/dnf.conf
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf
echo "keepcache=1" | sudo tee -a /etc/dnf/dnf.conf
sudo sed -n 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
sudo dnf group install gnome-desktop @virtualization -y
sudo dnf config-manager --add-repo https://brave-browser-rpm-nightly.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-nightly.s3.brave.com/brave-core-nightly.asc
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm brave-browser-nightly fish clang clang-devel clang-tools-extra lua java-latest-openjdk java-latest-openjdk-devel -y
sudo dnf remove totem gnome-boxes yelp gnome-maps
sudo dnf upgrade -y
sudo dnf groupupdate Multimedia
sudo systemctl enable gdm
sudo systemctl set-default graphical-target
sudo systemctl disable NetworkManager-wait-online.service
sudo setenforce 0
sh <(curl -L https://nixos.org/nix/install) --daemon
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install celluloid gimp

echo " Remember to change the permissions for virt manager "
