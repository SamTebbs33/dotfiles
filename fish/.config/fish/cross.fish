if hostname | grep "e120" > /dev/null
  set WORKSPACE_HOME "/home/$USER/gnu-work/workspace"
  set PATH "$WORKSPACE_HOME/tools" $PATH
end
