# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"  # Make sure Powerlevel10k is installed in $ZSH/custom/themes

# Plugins
plugins=(
  git
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-history-substring-search
  zsh-vi-mode
  fzf
  fzf-tab
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# ---- Powerlevel10k Configuration ----
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ---- History Configuration ----
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# ---- Keybindings for history substring search ----
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ---- zsh-completions (ensure compinit is initialized properly) ----
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
  autoload -Uz compinit
  if [[ ! -f ~/.zcompdump ]]; then
    compinit
  else
    rm -f ~/.zcompdump
    compinit
  fi
fi

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

# ---- Aliases ----
alias ls="eza --icons=always"
alias tp="topgrade"
alias ollama_start='ollama run llama3.2'
alias ollama_stop='osascript -e "tell application \"Ollama\" to quit"'

# ---- Node / NVM Setup ----
export NVM_DIR="$HOME/.nvm"
export COREPACK_ENABLE_AUTO_PIN=0
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# ---- Optional: System Info ----
# Uncomment to show system info on shell startup
macchina
