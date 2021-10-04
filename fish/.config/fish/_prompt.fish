function fish_prompt
	set -l name (set_color brblue; printf (whoami); set_color normal)
	set -l host (set_color brblue; printf (hostname); set_color normal)
	set -l at (set_color brwhite; printf "@"; set_color normal)
	set dir (pwd)
	set -l dir (set_color brcyan; printf (echo $dir | sed 's|'$HOME'|~|g'); set_color normal)
	set -l dir (set_color brcyan; printf (echo $dir | sed 's|gnu-work/workspace|wkspc|g'); set_color normal)
	set -l time (set_color brcyan; printf (date +"%H:%M"); set_color normal)
	echo "($time) $name$at$host ($dir)"
	echo "→ "
end

set git_indicator_cmds "git diff --name-only --cached" "git ls-files --others --exclude-standard" "git ls-files --modified --exclude-standard"
set git_indicator_symbols "*" "+" "~"

function fish_right_prompt
	set pwd (pwd)
	switch $pwd
		case "$HOME/work/llvm-remote"
			echo ""
		case "*"
			set git_indicator_values
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

				for i in (seq 1 (count $git_indicator_cmds))
					set cmd $git_indicator_cmds[$i]
					set -l val (eval $cmd | wc -l --)
					if [ "$val" -gt 0 ]
						set val $git_indicator_symbols[$i]$val
						set git_indicator_values $git_indicator_values $val
					end
				end

				printf " ("(set_color $branch_colour; printf $branch; set_color normal)
				for i in (seq 1 (count $git_indicator_values))
					printf " | "
					set_color brcyan
					printf $git_indicator_values[$i]
					set_color normal
				end
				printf ")"
			end
			if [ "$s" != "0" ]
				printf " ("(set_color brred; printf $s; set_color normal)")"
			end
		end
end
