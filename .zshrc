# zshrc config
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="/usr/local/mysql/bin:$PATH"


plugins=(git zsh-syntax-highlighting zsh-autosuggestions web-search)
source $ZSH/oh-my-zsh.sh

alias nv="nvim"
alias notes="cd && cd Documents/Obsidian\ Vault && nv"
alias t="tmux"
alias ta="tmux attach"
alias lg="lazygit"
alias v="cd && source Virtual_Environments/hls_venv/bin/activate"
alias ghost="cd $HOME/Library/Application\ Support/com.mitchellh.ghostty/"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias vim="nvim"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(starship init zsh)" 
