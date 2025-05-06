# ---- Powerlevel10k Instant Prompt ----
# This should stay near the top. It speeds up prompt load.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---- Powerlevel10k Theme ----
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ---- History Configuration ----
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history             # Share history across all sessions
setopt hist_expire_dups_first   # Expire duplicate entries first when trimming history
setopt hist_ignore_dups         # Don't store duplicate commands
setopt hist_verify              # Don't execute immediately on history expansion

# ---- Enhanced Command Line Experience ----
bindkey '^[[A' history-search-backward   # Up arrow searches backward
bindkey '^[[B' history-search-forward    # Down arrow searches forward

# ---- Plugins ----
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- Aliases ----
alias ls="eza --icons=always"            # Use eza as improved ls with icons
alias tp="topgrade"                      # Shortcut to run system updates

# Ollama commands
alias ollama_start='ollama run llama3.2'
alias ollama_stop='osascript -e "tell application \"Ollama\" to quit"'

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

# ---- Node Version Manager ----
export NVM_DIR="$HOME/.nvm"
export COREPACK_ENABLE_AUTO_PIN=0

# ---- Optional: System Info on Shell Start ----
# Uncomment to display system info when shell starts
macchina
