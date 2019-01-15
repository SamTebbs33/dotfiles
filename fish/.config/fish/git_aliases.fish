function mk_abbrev
	set -U fish_user_abbreviations $fish_user_abbreviations "$argv[1]=$argv[2]"
end

function gc -a msg -d "Make a commit"
	set -l prev_commit (git log -1 --pretty=%B)
	if [ $prev_commit[1] = "WIP" ]
		echo "The previous commit was a WIP commit, please ammend it with 'gunwip'"
	else
		git commit -m $msg
	end
end
mk_abbrev "gca" "git commit --amend"
mk_abbrev gserve "git daemon --reuseaddr --verbose  --base-path=. --export-all"
mk_abbrev gr "git revert"
function gcu -a msg -d "Commit then push to the remote"
	gc $msg
	guo
end
mk_abbrev gu "git push"
mk_abbrev guo "git push origin"
mk_abbrev gp "git pull"
mk_abbrev gpo "git pull origin"
mk_abbrev gs "git status -sb"
mk_abbrev gl "git log --date=short --decorate --oneline --graph"
function gignore -a file
	echo "$file" >> .gitignore
end
function glf -a filter
	gl --grep="$filter" 
end
mk_abbrev grb "git rebase"
mk_abbrev glr "git reflog --decorate --oneline"
mk_abbrev gb "git branch"
mk_abbrev gm "git merge"
mk_abbrev ga "git add"
mk_abbrev grm "git rm"
mk_abbrev gus "git push -u origin"
mk_abbrev gps "git pull -u origin"
mk_abbrev "gco" "git checkout"
mk_abbrev gcob "git checkout -b"
mk_abbrev gupdate "git pull --rebase --prune; git submodule update --init --recursive"
mk_abbrev gstash "git stash"
# Stash unstaged changes only
mk_abbrev gstashu "git commit -m WIP; git add .; git stash; git reset --soft HEAD^"
mk_abbrev gstasha "git stash apply"
function gwip -a wipmsg -d "Make a WIP commit with all changes staged"
	ga -A
	if count $wipmsg > /dev/null
		gc "WIP Commit: $wipmsg"
	else
		gc "WIP Commit"
	end
end
mk_abbrev gunwip "git commit -a --amend -m"
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
mk_abbrev gwho "git shortlog -s --"
function gconf
	git config --global $argv
end
mk_abbrev gdiff "git diff"
mk_abbrev gd "git diff"
function gsearch -a filter -d "Show all commits whose message contains a certain string"
	git show :/$filter
end
mk_abbrev gshow "git show"
mk_abbrev gissues "git browse -- issues"
mk_abbrev gwiki "git browse -- wiki"
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
