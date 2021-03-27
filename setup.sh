#!/usr/bin/env sh

home=$HOME
config="$HOME/.config"
yes="y"

bashrc_local="$home/.bashrc"
bashrc_dots="$home/dotfiles/.bashrc"
bashrc_link="ln -s $bashrc_dots $bashrc_local"
bashrc_backup="mv $bashrc_local ${bashrc_local}_backup"

picom_local="$config/picom.conf"
picom_dots="$home/dotfiles/picom.conf"
picom_link="ln -s $picom_dots $picom_local"
picom_backup="mv $picom_local ${picom_local}_backup"

omb_dots="$home/dotfiles/omb/themes/custom/custom.theme.sh"
omb_local="~/.oh-my-bash/custom/themes/custom/custom.theme.sh"
omb_link="ln -s $omb_dots $omb_local"
omb_backup="mv $omb_local ${omb_local}_backup"

i3_dots="$home/dotfiles/i3"
i3_local="$config/i3"
i3_link="ln -s $i3_dots $i3_local"
i3_backup="mv $i3_local ${i3_local}_backup"

kitty_dots="$home/dotfiles/kitty"
kitty_local="$config/kitty"
kitty_link="ln -s $kitty_dots $kitty_local"
kitty_backup="mv $kitty_local ${kitty_local}_backup"

polybar_dots="$home/dotfiles/polybar"
polybar_local="$config/polybar"
polybar_link="ln -s $polybar_dots $polybar_local"
polybar_backup="mv $polybar_local ${polybar_local}_backup"

test_command="neofetch"

display() {
    echo "==> $*"
}

err() {
    echo "ERR $*"
}

backup_and_symlink() {
    display "Backing Up $1"
    case $1 in
    "bashrc")
        display "$bashrc_backup"
        bash -c "$bashrc_backup"
        display "$bashrc_link"
        bash -c "$bashrc_link"
        ;;
    "picom")
        display "$picom_backup"
        bash -c "$picom_backup"
        display "$picom_link"
        bash -c "$picom_link"
        ;;
    "omb")
        display "$omb_backup"
        bash -c "$omb_backup"
        display "$omb_link"
        bash -c "$omb_link"
        ;;
    "i3")
        display "$i3_backup"
        bash -c "$i3_backup"
        display "$i3_link"
        bash -c "$i3_link"
        ;;
    "kitty")
        display "$kitty_backup"
        bash -c "$kitty_backup"
        display "$kitty_link"
        bash -c "$kitty_link"
        ;;
    "polybar")
        display "$polybar_backup"
        bash -c "$polybar_backup"
        display "$polybar_link"
        bash -c "$polybar_link"
        ;;
    *)
        err "Unknown Option"
        ;;
    esac
}

update() {
    display "Updating $1"
    case $1 in
    "bashrc")
        backup_and_symlink "bashrc"
        ;;
    "picom")
        backup_and_symlink "picom"
        ;;
    "omb")
        backup_and_symlink "omb"
        ;;
    "i3")
        backup_and_symlink "i3"
        ;;
    "kitty")
        backup_and_symlink "kitty"
        ;;
    "polybar")
        backup_and_symlink "polybar"
        ;;
    *)
        err "Unknown Option"
        ;;
    esac
}

echo "Update bashrc?"
read opt
if [ "$opt" == "$yes" ]; then
    update "bashrc"
fi

echo "Update picom?"
read opt
if [ "$opt" == "$yes" ]; then
    update "picom"
fi

echo "Update omb?"
read opt
if [ "$opt" == "$yes" ]; then
    update "omb"
fi

echo "Update i3?"
read opt
if [ "$opt" == "$yes" ]; then
    update "i3"
fi

echo "Update kitty?"
read opt
if [ "$opt" == "$yes" ]; then
    update "kitty"
fi

echo "Update polybar?"
read opt
if [ "$opt" == "$yes" ]; then
    update "polybar"
fi
