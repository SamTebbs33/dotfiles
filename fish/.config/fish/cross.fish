set PATH $HOME/bin/gcc/build-gcc-8.2.0/bin $PATH
set PATH $HOME/bin/grub/bin $PATH
set PATH $HOME/bin/binutils/bin $PATH
if hostname | grep "e120" > /dev/null
  set DEBUG_FLAGS "-dp" "-da" "--save-temps -S"
  set WORKSPACE_HOME "/home/$USER/gnu-work/workspace"
  set GCC_SRC $WORKSPACE_HOME"/gcc-src"
  set GCC_SRC_BUILD $WORKSPACE_HOME"/src/gcc"
  set A64_TESTSUITE $GCC_SRC"/gcc/testsuite/gcc.target/aarch64"
  set A64_CONFIG $GCC_SRC"/gcc/config/aarch64"
  set PATH "$WORKSPACE_HOME/tools/dist" "$WORKSPACE_HOME" $PATH
  set PATH "$HOME/bin/gcc-arm-8.2-2018.08-x86_64-aarch64-linux-gnu/bin" $PATH
end
