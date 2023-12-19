function fish_prompt
    set -l s $status
    set -l status_str ""
    if [ $s != 0 ]
        set status_str (printf " ("; set_color brred; printf "$s"; set_color normal; printf ")")
    end
	set -l name (set_color brblue; printf (whoami); set_color normal)
	set -l host (set_color brblue; printf (hostname); set_color normal)
	set -l at (set_color brwhite; printf "@"; set_color normal)
	set dir (pwd)
	set -l dir (set_color brcyan; printf (echo $dir | sed 's|'$HOME'|~|g'); set_color normal)
	set -l dir (set_color brcyan; printf (echo $dir | sed 's|gnu-work/workspace|wkspc|g'); set_color normal)
	set -l time (set_color brcyan; printf (date +"%H:%M"); set_color normal)
	echo "($time) $name$at$host ($dir)$status_str"
    echo "→ "
end

function fish_right_prompt
    set -g __fish_git_prompt_color_branch bryellow
    set -g __fish_git_prompt_char_stateseparator " | "
    fish_git_prompt
end
