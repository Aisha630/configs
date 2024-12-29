source <(fzf --zsh)
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=yellow,fg=black,bold'

# Source all plugins in the plugins directory
for plugin in ~/.zsh/plugins/*; do
  plugin_name=$(basename "$plugin")

  if [[ -d "$plugin" && "$plugin_name" != "zsh-history-substring-search" ]]; then
    if [[ -f "$plugin/$plugin_name.plugin.zsh" ]]; then
      source "$plugin/$plugin_name.plugin.zsh"
    elif [[ -f "$plugin/init.zsh" ]]; then
      source "$plugin/init.zsh"
    elif [[ -f "$plugin/$plugin_name.zsh" ]]; then
      source "$plugin/$plugin_name.zsh"
    else
      echo "No suitable file to source in $plugin_name"
    fi
  fi
done

# This plugin should be sourced last according to the author. Otherwise, it may not work as expected. Refer to the plugin's README for more information.
source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Aliases
alias python="python3"
alias pip="pip3"
alias c="clear"
alias n="neofetch"
alias s="kitten ssh"
alias fzf='fzf --preview="bat --color=always {}"'
alias cpa="copypath"
alias cf="copyfile"
alias la="ls -la"

neofetch

eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/kushal.omp.json)"
