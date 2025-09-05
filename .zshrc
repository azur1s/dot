# Created by newuser for 5.9
autoload -Uz compinit promptinit
compinit
promptinit

PROMPT="%F{red}%n%F{grey}@%m %1~ "
RPROMPT="%D{%D %H:%M}"

alias ls='ls -la --color=auto'

