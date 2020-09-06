sudo dnf install dnf-plugins-core &&

sudo dnf config-manager --add-repo https://brave-browser-rpm-nightly.s3.brave.com/x86_64/ &&

sudo rpm --import https://brave-browser-rpm-nightly.s3.brave.com/brave-core-nightly.asc &&

sudo dnf install brave-browser-nightly &&

sudo dnf install flatpak &&

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
