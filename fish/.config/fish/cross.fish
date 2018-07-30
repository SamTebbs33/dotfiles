if hostname | grep "elin" > /dev/null
  set WORKSPACE_HOME "/home/$USER/gnu-work/workspace"
  set PATH "$WORKSPACE_HOME/tools" $PATH

  set arm_cross "/home/samteb01/gnu-work/workspace/build-aarch64-none-linux-gnu"
  set arm_cross_elf "/home/samteb01/gnu-work/workspace/build-aarch64-none-elf"
  set arm_cross_bin "$arm_cross/install/bin"
  set arm_cross_elf_bin "$arm_cross_elf/install/bin"
  set PATH $arm_cross_bin $arm_cross_elf_bin $PATH

  alias gcc-a64 "aarch64-none-linux-gnu-gcc"
  alias g++-a64 "aarch64-none-linux-gnu-g++"
  alias gcc-a64-elf "aarch64-none-elf-gcc"
  alias g++-a64-elf "aarch64-none-elf-g++"
  alias objdump-a64 "aarch64-none-linux-gnu-objdump"
  alias objdump-a64-elf "aarch64-none-elf-objdump"
end
