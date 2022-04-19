function add_bin_dir -a dir
	if test -d $dir
		set PATH $dir $PATH
	end
end

add_bin_dir $HOME/bin
add_bin_dir /var/lib/snapd/snap/bin

export XDG_CONFIG_HOME=$HOME/.config
