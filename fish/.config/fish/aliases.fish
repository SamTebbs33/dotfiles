# Vim
function vima
	set i 0
	for x in $argv[2..-1]
		# Convert counter to mark character
		set mark (echo -e "\x"(printf "%x" (expr $i + 97)))
		set marks "-c "$x"ma "$mark $marks
		set i (expr $i + 1)
	end
	vim $argv[1] $marks
end
alias vim nvim
alias v vim

# cd aliases
set dots "$HOME/dotfiles"
alias ddots "cd $dots"
set repos "$HOME/repos"
alias drepos "cd $repos"
set doti3 "$dots/i3/.config/i3"
alias ddoti3 "cd $doti3"
set doti3c "$doti3/config.i3config"
set dotvim "$dots/.vim"
alias ddotvim "cd $dotvim"
set dotvimc "$dots/vim/.vimrc"

# ls
alias ls 'exa --color=auto -alh -I "." -I ".."'
alias lg "ls --git"
alias tree "ls --tree"
mk_abbrev treed "tree --level"

# Less
alias less "less -R"

# Other
mk_abbrev . "open ."
mk_abbrev .. 'cd ..'
mk_abbrev mk "mkfile 0"
mk_abbrev cls "clear"
mk_abbrev ageti "sudo apt-get install"
mk_abbrev agetu "sudo apt-get update"
mk_abbrev paci "sudo pacman -S"
mk_abbrev pacs "sudo pacman -Syy"
mk_abbrev pacu "sudo pacman -Syyu"
mk_abbrev pacr "sudo pacman -R"
mk_abbrev pacf "sudo pacman -F"

# RM
alias rmr "rm -r"
alias rmf "rm -f"
alias rmrf "rm -rf"
alias rmri "rm -ri"

# Fuzzy finding with fzf
mk_abbrev h "history | fzf"

# Other
function lines -a file -a from -a num_lines
    tail $file -n+$from | head -n$num_lines
end

# Tar
mk_abbrev "tarx" "tar -xvf"
mk_abbrev "tarc" "tar -cvf"

# Zig
mk_abbrev "z" "zig"
mk_abbrev "zb" "zig build"
function h2d -a hex
	printf "%d\n" $hex
end
function d2h -a dec
	printf "%x\n" $dec
end
function h2b -a hex
	echo "ibase=16;obase=2;$hex" | bc
end
function d2b -a dec
	printf "%b\n" $dec
end
