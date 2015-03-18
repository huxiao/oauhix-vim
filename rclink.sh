#!/usr/bin/env bash

ovroot="$HOME/.oauhix-vim"
vimcustom="$ovroot/oauhix-vim"
spf13inst="$HOME/.spf13-vim-3"

lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
    ret="$?"
}

lnif "$spf13inst/.vimrc"                    "$HOME/.vimrc"
lnif "$spf13inst/.vimrc.before"             "$HOME/.vimrc.before"
lnif "$spf13inst/.vimrc.bundles"            "$HOME/.vimrc.bundles"
lnif "$spf13inst/.vim"                      "$HOME/.vim"

lnif "$vimcustom/.vimrc.fork"               "$HOME/.vimrc.fork"
lnif "$vimcustom/.vimrc.before.fork"        "$HOME/.vimrc.before.fork"
lnif "$vimcustom/.vimrc.bundles.fork"       "$HOME/.vimrc.bundles.fork"
lnif "$vimcustom/.gvimrc"                   "$HOME/.gvimrc"

rm -rf "$HOME/.config/.vifm"
mkdir -p "$HOME/.config/zathura"

lnif "$vimcustom/others/vifm"               "$HOME/.vifm"
lnif "$vimcustom/others/zathurarc"          "$HOME/.config/zathura/zathurarc"

lnif "$ovroot/otherconf/.vimperatorrc"      "$HOME/.vimperatorrc"
lnif "$ovroot/otherconf/.zshrc"             "$HOME/.zshrc"

# Useful for fork maintainers
touch  "$HOME/.vimrc.local"
touch  "$HOME/.gvimrc.local"
touch  "$HOME/.vimrc.before.local"
touch  "$HOME/.vimrc.bundles.local"

if [[ ! -e "$spf13inst" ]]; then
    ln -s "$HOME/.oauhix-vim/spf13-vim" "$spf13inst"
fi
