# Path
set EDITOR /usr/bin/nvim
set VISUAL $EDITOR
#set -x MOZ_ENABLE_WAYLAND 1
#set -x SDL_VIDEODRIVER wayland

function mk_abbrev -a abbrv -a expansion
	abbr -a $abbrv $expansion
end

for file in ~/.config/fish/*.fish
	set filename (basename $file)
	if [ "$filename" != "config.fish" ]; and [ "$filename" != "_*" ]; source $file; end
end

# opam configuration
source /home/sam/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
