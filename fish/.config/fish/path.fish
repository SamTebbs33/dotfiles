function add_bin_dir -a dir
	if test -d $dir
		set PATH $dir $PATH
	end
end

add_bin_dir /home/$USER/bin/gcc/i686-elf/build/bin
add_bin_dir /home/$USER/bin/binutils/i686-elf/build/bin
add_bin_dir /home/$USER/bin/grub/build/bin
add_bin_dir /home/$USER/bin/llvm/build/bin
add_bin_dir /home/$USER/bin/llvm/build-8.0.0/bin
add_bin_dir /home/$USER/bin/clang/build/bin
add_bin_dir /home/$USER/repos/zig/build/bin
add_bin_dir /home/$USER/.gem/ruby/2.6.0/bin
