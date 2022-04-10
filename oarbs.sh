# Functions

welcomemessage() { \
    dialog --title "Welcome to OARBS" --msgbox "Welcome to OARBS, Osama's Auto Rice Bootstraping Script.\n\n- This script will automatically install a fully-featured linux desktop, which I use as my main machine\\n\\n-Osama " 10 60
    dialog --colors --title "Important Note!" --yes-label "All ready!" --no-label "Return to Menu" --yesno "Be sure that you have the current pacman updates and refreshed Arch Keyring before proceeding.\\n\\nIf not, the installation of some programs might fail." 8 70
}

# The Script
#
welcomemessage || { echo "OARBS installation was cancelled."; exit 1; }
# Make zsh the default shell
chsh -s /bin/zsh "$name" >/dev/null 2>&1
sudo -u "$name" mkdir -p "/home/$name/.config/zsh/"