# nvm configuration
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Load Angular CLI autocompletion.
source <(ng completion script)

# If its not vs code or base terminal use of my posh and oh my zsh else use powerlevel10k
if [ "$TERM_PROGRAM" != "Apple_Terminal" ] && [ "$TERM_PROGRAM" != "vscode" ]; then
  autoload -U colors && colors
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
  export LS_COLORS="di=38;5;183"


  export ZSH="$HOME/.oh-my-zsh"
  ZSH_THEME=""
  plugins=(git)
  source $ZSH/oh-my-zsh.sh

  export LSCOLORS="ExFxBxDxCxegedabagacad"
  alias ls='ls -G'

  eval "$(oh-my-posh init zsh --config ~/.ohmyposh-themes/lavender.omp.json)"

else
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  export ZSH="$HOME/.oh-my-zsh"

  ZSH_THEME="powerlevel10k/powerlevel10k"
  plugins=(git)

  source $ZSH/oh-my-zsh.sh

  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

# source ~/.zshrc