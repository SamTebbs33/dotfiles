function fish_prompt
	set -l name (set_color blue; printf (whoami); set_color normal)
	set -l dir (set_color green; printf (pwd | sed 's|'$HOME'|~|g'); set_color normal)
	echo "[$name]─[$dir]─> "
end

function fish_right_prompt
	set -l s $status
	set -l branch (git branch ^/dev/null | sed -n '/\* /s///p')
	set -l time (date +"%H:%M")
	printf "["(set_color cyan; printf $time; set_color normal)"]"
	#if set -q $BATTERY_IS_CHARGING
	#	printf "-[⚡]"
	#end
	if [ "$branch" != "" ]
		set -l git_diff (git status 2> /dev/null | tail -n1)
		if [ "$git_diff" = "nothing to commit, working directory clean" ]
			set branch_colour green
		else
			set branch_colour yellow
		end
		printf "─["(set_color $branch_colour; printf $branch; set_color normal)"]"
	end
	if [ "$s" != "0" ]
		printf "─["(set_color red; printf $s; set_color normal)"]"
	end
end
