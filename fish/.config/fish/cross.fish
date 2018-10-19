if hostname | grep "e120" > /dev/null
  set DEBUG_FLAGS "-dp" "-da" "--save-temps -S"
  set WORKSPACE_HOME "/home/$USER/gnu-work/workspace"
  set PATH "$WORKSPACE_HOME/tools/dist" "$WORKSPACE_HOME" $PATH
  set PATH "$HOME/bin/gcc-arm-8.2-2018.08-x86_64-aarch64-linux-gnu/bin" $PATH
end
