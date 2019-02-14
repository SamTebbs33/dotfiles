# Vim
alias v 'mvim -v'
alias mkvim 'cd ~/Documents/Programming/vim/ sh mkvim.sh'
alias vimrc 'vim .vimrc'
alias vimbp 'vim ~/.bash_profile'

# Tmux
alias tmls "tmux ls"
alias tma "tmux attach -t"
alias tmnew "tmux new -s"
alias tmrename "tmux rename-session -t"

# Programs
alias fnd "find . -name "
alias grun 'java org.antlr.v4.runtime.misc.TestRig'
alias antlr4 'java -jar /usr/local/lib/antlr-4.5-complete.jar'
alias mkalias "java -jar ~/Documents/Programming/MkAlias.jar"
alias dirtag "java -jar ~/Documents/Programming/DirTag.jar"
alias gcci386 "~/Documents/Programming/cross/toolchain/gcc/i686-pc-elf/bin/gcc -I $HOME/Documents/Programming/cross/toolchain/gcc/lib/gcc/i686-pc-elf/4.6.2/include"
alias maple "java -jar $MAPLE_PATH"
alias ash "java -jar $ASH_PATH"

# Uni SSH
alias unisync "rsync -aP ~/Dropbox/University/ sxt567@tinky-winky.cs.bham.ac.uk:work"

# ls
alias ls 'ls --color=auto -alh -I "." -I ".."'
alias lsr "ls -R"
alias realls "/bin/ls"

function lss
    ls $argv | less
end

# Less
alias less "less -R"

# Cd
alias cdgit "cd $GIT_REPOS"
alias cddl "cd ~/Downloads"

# Other
alias . "open ."
alias .. 'cd ..'
alias mk "mkfile 0"
alias cls "clear"
alias starwars "telnet towel.blinkenlights.nl"
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
set PATH "/home/$USER/bin/zig-linux-x86_64-0.3.0+c7b9ab98" $PATH

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
    tail $file -n$from | head -n$num_lines
end
