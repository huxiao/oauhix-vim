#!/usr/bin/env bash

oauhiinst="$HOME/.oauhix-vim/oauhix-vim"
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

lnif "$oauhiinst/.vimrc.fork"              "$HOME/.vimrc.fork"
lnif "$oauhiinst/.vimrc.before.fork"       "$HOME/.vimrc.before.fork"
lnif "$oauhiinst/.vimrc.bundles.fork"      "$HOME/.vimrc.bundles.fork"
lnif "$oauhiinst/.gvimrc"                  "$HOME/.gvimrc"

rm -rf "$HOME/.config/.vifm"
mkdir -p "$HOME/.config/zathura"

lnif "$oauhiinst/others/vifm"               "$HOME/.vifm"
lnif "$oauhiinst/others/zathura"            "$HOME/.config/zathura"
lnif "$oauhiinst/others/vifm"               "$HOME/.vifm"

# Useful for fork maintainers
touch  "$HOME/.vimrc.local"
touch  "$HOME/.gvimrc.local"
touch  "$HOME/.vimrc.before.local"
touch  "$HOME/.vimrc.bundles.local"

if [[ ! -e "$spf13inst" ]]; then
    ln -s "$HOME/.oauhix-vim/spf13-vim" "$spf13inst"
fi
