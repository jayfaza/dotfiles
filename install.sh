echo "What setup do you want?"
echo "1 - desktop, 2 - laptop"
read setup

sudo pacman -S --needed base-devel
if [ $setup = '2' ]; then
    echo "installing dependencies for laptop setup. OK"
    sudo pacman -S which swaybg vim nvim nwg-look fuzzel lsd stow npm pipewire wireplumber rustup tlp tlp-pd niri kitty nautilus firefox waybar mako fish xdg-desktop-portal xdg-desktop-portal-gnome xdg-desktop-portal-gtk gnome-keyring git
fi

if [ $setup = '1' ]; then
    echo "installing dependencies for desktop setup. OK"
    sudo pacman -S which swaybg nvim nvim nwg-look fuzzel lsd stow npm pipewire wireplumber rustup niri kitty nautilus firefox waybar mako fish xdg-desktop-portal xdg-desktop-portal-gnome xdg-desktop-portal-gtk gnome-keyring git
fi

cd ~

echo "do you want to install yay/paru/don't install. (1/2/n)"
read pkg_man

mkdir -p ~/.cache
if [ $pkg_man = '1' ]; then
    echo "installing yay..."
    cd ~/.cache
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd .. && rm -rf yay
    cd ~
    yay -S bibata-cursor-theme-bin
elif [ $pkg_man = '2' ]; then
    echo "installing paru..."
    cd ~/.cache
    git clone https::/aur.archlinux.org/paru.git
    cd paru 
    makepkg -si
    cd .. && rm -rf paru
    cd ~
    paru -S bibata-cursor-theme-bin
elif [ $pkg_man = '3' ]; then
    echo "skipping pkg manager installation."
fi

sudo pacman -S adw-gtk-theme
    
if [ -e "~/.config" ]; then
    echo "~/.config exists"
else
    echo "~/.config doesn't exist, creating. OK"
    mkdir ~/.config
fi

echo "cleaning .config directory. OK"
rm -rf ~/.config/*
cd ~/dotfiles
echo "setting up .bash_profile. OK"
rm -rf ~/.bash_profile
echo "stowing all configs. OK"
stow .
echo "unstowing fish_variables. OK"

rm -rf ~/.config/fish/fish_variables
rm -rf ~/dotfiles/.config/fish/fish_variables

echo "stowing xdg-dirs.conf. OK"

if [ -e /etc/xdg/user-dirs.conf ]; then
    sudo rm -rf /etc/xdg/user-dirs.conf && sudo ln -s ~/dotfiles/.config/xdg/user-dirs.conf /etc/xdg/user-dirs.conf
else
    sudo ln -s ~/dotfiles/.config/xdg/user-dirs.conf /etc/xdg/user-dirs.conf
fi
    

echo "setting up rust components. OK"
rustup default stable
rustup component add rust-analyzer
echo "setting up grub config. OK"
sudo rm -rf /etc/default/grub 
sudo ln -s ~/dotfiles/.config/grub/grub /etc/default/grub
echo "updating grub config. OK"
sudo grub-mkconfig -o /boot/grub/grub.cfg

if [ -e "/usr/bin/commitdots" ]; then
    echo "commitdots script is exists..."
else  
    echo "adding commitdots script. OK"
    sudo ln -s ~/dotfiles/scripts/commitdots /usr/bin/cs
fi

if [ $setup = '2' ]; then
    echo "setting up tlp. OK"
    sudo rm -rf /etc/tlp.conf
    sudo ln -s ~/dotfiles/.config/tlp/tlp.conf /etc/tlp.conf
    echo "enabling tlp"
    sudo systemctl enable --now tlp tlp-pd
elif [ $setup = 1 ]; then
    echo "removing tlp configs for desktop setup..."
    sudo rm -rf ~/.config/tlp
    sudo rm -rf ~/dotfiles/.config/tlp
fi

if [ $(sudo systemctl is-enabled pipewire) = 'disabled' ]; then
    echo "pipewire servers isn't running, enabling..."
    systemctl --user enable --now pipewire wireplumber
fi

if [ $(sudo systemctl is-enabled xdg-desktop-portal) = 'disabled' ]; then
    echo "xdg-desktop-portal isn't running, enabling..."
    systecmt --user enable --now xdg-desktop-portal
fi

if [ $(sudo systemctl is-enabled sddm) = 'enabled' ]; then
    echo "disabling sddm. OK"
    sudo systemctl disable sddm
fi

if [ -e "/home/$(whoami)/install.sh" ]; then
    echo "removing install script from home directory. OK"
    rm -rf ~/install.sh
fi

if [ -e "/home/$(whoami)/scripts/" ]; then
    echo "do you like to delete scripts_folder from home directory? (y\n)"
    read scripts_folder
    if [ $scripts_folder = 'n' ]; then
        echo "skipping scripts folder..."
    elif [ $scripts_folder = 'y' ]; then
        echo "removing scripts folder from home directory..."
        rm -rf ~/scripts
    else 
        echo "you've entered $scripts_folder, skipping scripts_folder..."
    fi
fi

echo "removing archinstall config from home directory. OK"
rm -rf ~/user_configuration.json
echo "setting dark theme. OK"
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

echo ""
echo "********************************************************"
echo "Everything has been prepared and installed, Welcome $(whoami)!"
echo "********************************************************"



