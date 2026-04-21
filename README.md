# dotfiles
Install:
* fish
* base-devel
Add user
Switch to user
Install:
* stow
* inetutils
* github-cli
* openssh
* exa (for fancy ls commands)
Run:
* ssh-keygen

Clone this repo with --recursive, mkdir ~/bin and stow each subdir (remove ~/.config/fish before stowing fish)

Install from aur:
* yay (needs fakeroot and debugedit)
Install:
* reflector (and enable reflector.timer with systemctl, for updating pacman mirror list automatically every week)
* xorg
* xorg-xinit
* xsel
* i3
* alsa-utils (for unmuting sound channels)
* htop
* tar
* nvim
* rofi (alternative launcher to dmenu)
* rofi-calc
* terminator
* vifm
* openssh
* firefox
* github-cli
* otf-font-awesome
* pulseaudio
* pulseaudio-alsa
* tk (for bumblebee-status system module)
* autorandr
* install nodejs and npm
Install with yay:
* bumblebee-status
* ttf-sourcecodepro-nerd
mkdir ~/log (for bumblebee-status.log)
run ~/.config/i3/combine_config.sh
Set git user.email and user.name
Run npm ci in .vim/bundle/coc.nvim

Ask user to install nvidia driver from https://wiki.archlinux.org/title/NVIDIA#
Ask user to reboot, log in to firefox, log in to bitwarden, put ssh key in github.
Then configure screens with xrandr and save config with autorandr.
