export EDITOR="nvim"
export VISUAL="nvim"

# Tmux session on startup
if [ "$TMUX" = "" ]; then
  tmux attach || tmux new -s default;
fi

# fzf-git
[ -f ~/.fzf-git.sh ] && source ~/.fzf-git.sh

# Aliases
## General
alias fucking="sudo"
alias please="sudo"
alias rl="source ~/.zshrc"
alias bye="please shutdown -h now"

## Eza (better ls)
alias ls="eza -l --icons=always --git -o --color=always --hyperlink"
alias l="ls -la"
alias tree="eza --tree --icons=always --git -o --color=always --hyperlink"

## Zoxide (better cd)
alias cd="z"

## Vim
alias vim="nvim"
alias v="vim"

## Bat (better cat)
alias cat="bat"

## Tmux
## Quick access to last tmux session
alias tmux="tmux attach || tmux new"
alias t="tmux"
alias ta="tmux attach"

## Python
alias makevenv="python3 -m venv env && source ./env/bin/activate"

## Git
alias gitupdate="git add . && git commit && git pull && git push"

## Other
alias speedtest="networkQuality -v"

# Zoxide
eval "$(zoxide init zsh)"

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Created by `pipx` on 2024-07-03 12:47:09
export PATH="$PATH:/Users/cleeryy/.local/bin"

# Fzf
source <(fzf --zsh)

# CTF Write-Ups
# Add this to your ~/.bashrc or ~/.zshrc
function ctfwu() {
    if [ $# -lt 3 ]; then
        echo "Usage: ctfwu <ctf_name> <challenge_name> <category> [points]"
        return 1
    fi
    
    # Run the script and capture its output (last line is the directory path)
    local new_dir=$(~/scripts/ctf-writeup-gen.sh "$1" "$2" "$3" "$4")
    
    # Extract the last line of output which should be the directory path
    new_dir=$(echo "$new_dir" | tail -n 1)
    
    # Change to the new directory
    cd "$new_dir"
    
    # Open the write-up file in your preferred editor (optional)
    # If using VS Code:
    # code write-up.md
    # Or if using vim:
    vim write-up.md
}


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
    print -P "%F{33} %F{34}Installation successful.%f%b" || \
    print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
  zdharma-continuum/zinit-annex-as-monitor \
  zdharma-continuum/zinit-annex-bin-gem-node \
  zdharma-continuum/zinit-annex-patch-dl \
  zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light romkatv/powerlevel10k

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
[ -s "/Users/cleeryy/.bun/_bun" ] && source "/Users/cleeryy/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/cleeryy/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
