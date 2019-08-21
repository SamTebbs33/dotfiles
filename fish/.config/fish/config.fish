# Path
set PATH $HOME/bin $PATH
set PATH $HOME/repos/zig/build $PATH

# z88dk variables
set ZCCCFG $HOME/repos/z88dk/lib/config

for file in ~/.config/fish/*.fish
	set filename (basename $file)
	if [ "$filename" != "config.fish" ]; and [ "$filename" != "_*" ]; source $file; end
end
