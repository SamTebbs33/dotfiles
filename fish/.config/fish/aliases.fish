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

# Programs
function fnd -a pattern -a path
	if [ -z "$path" ]
		set path "."
	end
	find $path -name $pattern
end

# ls
alias ls 'ls --color=auto -alh -I "." -I ".."'
function lss
    ls $argv | less
end

# Less
alias less "less -R"

# Other
alias . "open ."
alias .. 'cd ..'
alias mk "mkfile 0"
alias cls "clear"
if [ (uname) = "Linux" ]
	alias aupdate "sudo apt-get update"
	alias arm "sudo apt-get remove"
	alias aget "sudo apt-get"
	alias ageti "sudo apt-get install"
	alias paci "sudo pacman -S"
	alias pacu "sudo pacman -Syyu"
else
	alias cat "ccat"
end

# grep
function grp
    git symbolic-ref -q --short HEAD 2> /dev/null
    if [ "$status" -eq 0 ]
        git grep -n $argv
    else
        grep -n $argv *
    end
end
alias grpi "grp -ni"
alias grpr "grp -nr"
alias grpri "grp -nri"
alias grpa "grp -nC"
alias grpra "grp -nrC"

# RM
alias rmr "rm -r"
alias rmf "rm -f"
alias rmrf "rm -rf"
alias rmi "rm -ri *"

# Other
function lines -a file -a from -a num_lines
    tail $file -n+$from | head -n$num_lines
end

# Tar
mk_abbrev "tarx" "tar -xvf"
mk_abbrev "tarc" "tar -cvf"
