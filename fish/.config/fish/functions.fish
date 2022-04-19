function google -a query -d "Google a query"
	firefox "http://www.google.com/search?query=$query"
end

function d -a alias
    cd (dx $alias)
end

function cl -a dir args -d "Cd into dir then list files"
	cd $dir
	ls $args
end

function bkp -a dir -d "Backup a folder to a bkp directory"
	mkdir bkp
	cp -r $dir bkp/$dir
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

function aur -a url
	git clone --recurse-submodules $url
	set dir (echo $url | sed 's/.*\///' | sed 's/\..*//')
	cd $dir
	makepkg -Acs; and sudo pacman -U $dir*.pkg.*
end
