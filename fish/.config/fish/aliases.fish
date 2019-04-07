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
alias fnd "find . -name "

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
else
	alias cat "ccat"
end

# Path
set PATH "/home/$USER/bin" $PATH

# grep
function grp
    set branch (git symbolic-ref -q --short HEAD)
    if [ $branch != "fatal: Not a git repository (or any of the parent directories): .git" ]
        git grep -n $argv
    else
        grep -n $argv
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
