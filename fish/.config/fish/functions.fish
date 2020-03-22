function google -a query -d "Google a query"
	open "http://www.google.com/search?query=$query"
end

function cl -a dir args -d "Cd into dir then list files"
	cd $dir
	ls $args
end

function bkp -a dir -d "Backup a folder to a bkp directory"
	mkdir bkp
	cp -r $dir bkp/$dir
end

function fuck -d "Correct your previous console command"
	set -l exit_code $status
	set -x TF_ALIAS fuck
	set -l fucked_up_command $history[1]
	thefuck $fucked_up_command | read -l unfucked_command
	if [ "$unfucked_command" != "" ]
		eval $unfucked_command
		if test $exit_code -ne 0
			history --delete $fucked_up_command
			history --merge ^ /dev/null
			return 0
		end
	end
end

function hack -d "Hack some shit"
	set -l ip $argv[1]
	set -l times $argv[2]
	echo (tint: green "Hacking IP: " $ip)
	sleep 1
	ping -c 1  $ip
	sleep 1
	echo (tint: green "Retrieving data and passwords")
	sleep 1
	for i in 0 .. times
		set -l data (base64 /dev/urandom | head -c 400)
		echo (tint: green $data)
		sleep 0.3
	end
	echo (tint: green "Preventing government tracing")
	sleep 1
	echo (tint: green "Hack complete")
end

function dosudo
	eval command sudo $history[1]
end

function aur -a url
	git clone $url
	set dir (echo $url | sed 's/.*\///' | sed 's/\..*//')
	cd $dir
	makepkg -Acs && sudo pacman -U $dir*.tar.xz
end
