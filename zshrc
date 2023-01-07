# Load depdencies
source ~/.zsh/zsh_path
# Path to zsh aliases
source ~/.zsh/zsh_aliases
# Path to zsh environment functions
source ~/.zsh/zsh_env
# Path to zsh functions
source ~/.zsh/zsh_functions
# Path to zsh utilities
source ~/.zsh/zsh_utilities/zoxide
# setting nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# adding special sourcing configs
source $(dirname $(gem which colorls))/tab_complete.sh
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /home/lefv/repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# bun completions
[ -s "/home/lefv/.bun/_bun" ] && source "/home/lefv/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
