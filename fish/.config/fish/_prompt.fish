function fish_prompt
	set -l name (set_color brblue; printf (whoami); set_color normal)
	set -l host (set_color brblue; printf (hostname); set_color normal)
	set -l at (set_color brwhite; printf "@"; set_color normal)
	set dir (pwd)
	set -l dir (set_color brcyan; printf (echo $dir | sed 's|'$HOME'|~|g'); set_color normal)
	set -l dir (set_color brcyan; printf (echo $dir | sed 's|gnu-work/workspace|wkspc|g'); set_color normal)
	set -l time (date +"%H:%M")
	set -l time (set_color brcyan; printf $time; set_color normal)
	echo "($time) $name$at$host ($dir)"
	echo "→ "
end

function fish_right_prompt
	set -l s $status
	set -l branch (git branch ^/dev/null | sed -n '/\* /s///p')
	#if set -q $BATTERY_IS_CHARGING
	#	printf "-[⚡]"
	#end
	if [ "$branch" != "" ]
		set -l git_diff (git status 2> /dev/null | tail -n1)
		if [ "$git_diff" = "nothing to commit, working directory clean" ]
			set branch_colour brgreen
		else
			set branch_colour bryellow
		end
		set -l git_unstaged (git ls-files --others --exclude-standard | wc -l --)
		if [ $git_unstaged -eq 0 ]
			set git_unstaged ""
		else
			set git_unstaged (printf " | "; set_color brgreen; printf "+$git_unstaged"; set_color normal)
		end
		printf " ("(set_color $branch_colour; printf $branch; set_color normal)"$git_unstaged)"
	end
	if [ "$s" != "0" ]
		printf " {"(set_color brred; printf $s; set_color normal)"}"
	end
end
