function gc -a msg -d "Make a commit"
	set -l prev_commit (git log -1 --pretty=%B)
	if [ $prev_commit[1] = "WIP" ]
		echo "The previous commit was a WIP commit, please ammend it with 'gunwip'"
	else
		git commit -m $msg
	end
end
alias gca "git commit --amend"
alias gserve "git daemon --reuseaddr --verbose  --base-path=. --export-all"
alias gr "git revert"
function gcu -a msg -d "Commit then push to the remote"
	gc $msg
	guo
end
alias gu "git push"
alias guo "git push origin"
alias gp "git pull"
alias gpo "git pull origin"
alias gs "git status -sb"
alias gl "git log --date=short --decorate --oneline --graph"
function gignore -a file
	echo "$file" >> .gitignore
end
function glf -a filter
	gl --grep="$filter" 
end
alias grb "git rebase"
alias glr "git reflog --decorate --oneline"
alias gb "git branch"
alias gm "git merge"
alias ga "git add"
alias grm "git rm"
alias gus "git push -u origin"
alias gps "git pull -u origin"
alias gco "git checkout"
alias gcob "git checkout -b"
alias gupdate "git pull --rebase --prune; git submodule update --init --recursive"
alias gstash "git stash"
# Stash unstaged changes only
alias gstashu "git commit -m WIP; git add .; git stash; git reset --soft HEAD^"
alias gstasha "git stash apply"
function gwip -a wipmsg -d "Make a WIP commit with all changes staged"
	ga -A
	if count $wipmsg > /dev/null
		gc "WIP Commit: $wipmsg"
	else
		gc "WIP Commit"
	end
end
alias gunwip "git commit -a --amend -m"
function gclear -a msg -d "Clear local changes after adding them to an unreachable commit"
	git add -A
	if count $msg > /dev/null
		set fullmsg "Clear savepoint: $msg"
	else
		set fullmsg "Clear savepoint"
	end
	git commit -qm $fullmsg
	git reset HEAD~1 --hard
end
alias gwho "git shortlog -s --"
alias gconf "git config --global"
alias gdiff "git diff"
alias gd "git diff"
function gshow -a filter -d "Show all commits whose message contains a certain string"
	git show :/$filter
end
alias gissues "git browse -- issues"
alias gwiki "git browse -- wiki"
function gclonehttp -a repo -a dest
	git clone https://github.com/$repo $dest
end

function gclone -a repo -a dest
	git clone git@github.com:$repo $dest
end

function gclonerhttp -a repo -a dest
	git clone --recurse-submodules https://github.com/$repo $dest
end

function gcloner -a repo -a dest
	git clone --recurse-submodules git@github.com:$repo $dest
end

gconf advice.implicitIdentity false
gconf advice.resolveConflict false
gconf advice.commitBeforeMerge false
gconf advice.statusHints false
gconf push.default matching
