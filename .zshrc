source <(fzf --zsh)

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
alias ls="lsd"
alias la="ls -la"
alias ..="cd .."
alias ...="cd ../.."
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gcm="git commit -m"
alias gpo="git push origin"
alias gpl="git pull"
alias gcl="git clone"
alias gdf="git diff"
alias gsta="git stash"
alias gstp="git stash pop"
alias gbr="git branch"
alias grm="git rm"
alias grs="git reset"
alias grh="git reset --hard"
alias grs="git reset --soft"
alias gcp="git cherry-pick"
alias t="tree -L 2"
alias lst="ls --depth 2"
alias source="src"

neofetch

