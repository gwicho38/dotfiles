# autoload -Uz +X compinit
# functions[compinit]=$'print -u2 \'compinit being called at \'${funcfiletrace[1]}
# '${functions[compinit]}
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH=$HOME/development/flutter/bin:$PATH
# Update your shell profile (.zshrc, .bash_profile, etc.)
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
