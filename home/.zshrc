# Start up - Welcome logo
figlet "Welcome" | lolcat

# Vi mode
bindkey -v

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
stty stop undef        # Disable ctrl-s to freeze terminal.

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)        # Include hidden files.

# Load aliases and shortcuts if existent.
[ -f "$HOME/zsh/aliasrc" ] && source "$HOME/zsh/aliasrc"

# setup comments
setopt interactivecomments
setopt HIST_IGNORE_SPACE

# plugins (end of config) 
source ~/.zshaliases
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
export PATH=$PATH:~/.local/bin:~/scripts/
