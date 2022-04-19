mk_abbrev gca "git commit --amend"
mk_abbrev gr "git reset"
mk_abbrev grh "git reset --hard"
mk_abbrev gu "git push"
mk_abbrev guo "git push origin"
mk_abbrev gp "git pull"
mk_abbrev gpo "git pull origin"
mk_abbrev gf "git fetch"
mk_abbrev gs "git status -sb"
mk_abbrev gl "git log --decorate --oneline"
mk_abbrev grb "git rebase"
mk_abbrev grbc "git rebase --continue"
mk_abbrev grba "git rebase --abort"
mk_abbrev grbi "git rebase -i"
mk_abbrev glr "git reflog --decorate --oneline"
mk_abbrev gb "git branch"
mk_abbrev gm "git merge"
mk_abbrev ga "git add"
mk_abbrev gap "git add -p"
mk_abbrev grm "git rm"
mk_abbrev gus "git push -u origin"
mk_abbrev gps "git pull -u origin"
mk_abbrev gco "git checkout"
mk_abbrev gcob "git checkout -b"
mk_abbrev gupdate "git pull --rebase --prune; git submodule update --init --recursive"
mk_abbrev gst "git stash"
mk_abbrev gstu "git commit -m WIP; git add .; git stash; git reset --soft HEAD^"
mk_abbrev gsta "git stash apply"
mk_abbrev gclean "git clean -fd"
mk_abbrev gcleanf "git clean -f"
mk_abbrev gcleand "git clean -d"
mk_abbrev gd "git diff"
mk_abbrev gdc "git diff --cached"
mk_abbrev gwho "git shortlog -s --"
mk_abbrev gshow "git show"
mk_abbrev gissues "git browse -- issues"
mk_abbrev gwiki "git browse -- wiki"
mk_abbrev gflow "git flow"
mk_abbrev gc "git commit -m"

function gignore -a file
	echo "$file" >> .gitignore
end

function glf -a filter
	gl --grep="$filter"
end

function gconf
	git config --global $argv
end

function gsf -a filter -d "Show all commits whose message contains a certain string"
	git show :/$filter
end

function gff -a remote -d "Fast forward to a remote, default is origin"
	if [ "$remote" = "" ]
		set remote "origin"
	end
	set -l branch (git branch ^/dev/null | sed -n '/\* /s///p')
	git merge --ff-only $remote/$branch
end

function gclonehttp -a repo -a dest
	git clone https://github.com/$repo $dest
end

function gclone -a repo -a dest
	git clone --recurse-submodules git@github.com:$repo $dest
end

alias gconf_ "git config"
gconf_ --global advice.implicitIdentity false
gconf_ --global advice.resolveConflict false
gconf_ --global advice.commitBeforeMerge false
gconf_ --global advice.statusHints false
gconf_ --global push.default matching
