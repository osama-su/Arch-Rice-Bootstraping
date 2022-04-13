#!/bin/sh
# Osama's Auto Rice Boostrapping Script (OARBS)
# by Osama Ahmed <hello@osamaahmed.me>
# inspired and based on the work of Luke Smith (LARBS) <luke@lukesmith.xyz>

# Options and variables

while getopts ":a:r:b:p:h" o; do case "${o}" in
    h) printf "Optional arguments for custom use:\\n  -r: Dotfiles repository (local file or url)\\n  -b: Dotfiles branch (master is the default)\\n  -a: AUR helper (must have pacman-like syntax)\\n  -p: Dependencies and programs csv (local file or url)\\n  -h: Show this message\\n" && exit 1;;
    r) dotfilesrepo=${OPTARG} && git ls-remote "$dotfilesrepo" || exit 1;;
    b) dotfilesbranch=${OPTARG} ;;
    a) aurhelper=${OPTARG} ;;
    p) progsfile="${OPTARG}" ;;
    *) printf "Invalid option: -%s\\n" "$OPTARG" && exit 1;;
esac done

[ -z "$dotfilesrepo" ] && dotfilesrepo="https://github.com/osama-su/.dotfiles.git"
[ -z "$progsfile" ] && progsfile="https://raw.githubusercontent.com/osama-su/OARBS/main/progs.csv"
[ -z "$dotfilesbranch" ] && dotfilesbranch="master"
[ -z "$aurhelper" ] && aurhelper="yay"

# Functions

welcomemessage() { \
    dialog --title "Welcome to OARBS" --msgbox "Welcome to OARBS, Osama's Auto Rice Bootstraping Script.\n\n- This script will automatically install a fully-featured linux desktop, which I use as my main machine\\n\\n-Osama " 10 60
    dialog --colors --title "Important Note!" --yes-label "All ready!" --no-label "Return to Menu" --yesno "Be sure that you have the current pacman updates and refreshed Arch Keyring before proceeding.\\n\\nIf not, the installation of some programs might fail." 8 70
}

# The Script
#
welcomemessage || { echo "OARBS installation was cancelled."; exit 1; }
# Make zsh the default shell
# chsh -s /bin/zsh "$name" >/dev/null 2>&1
# sudo -u "$name" mkdir -p "/home/$name/.config/zsh/"