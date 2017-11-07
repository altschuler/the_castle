# directories
alias ll='ls -lh'
alias la='ls -lAh'

# package managing
alias yao='yaourt --noconfirm'
alias pm='sudo pacman'

# git
alias gg='git status'
alias gd='git diff'
alias gdc='git diff --cached'

# misc
alias suspend='sudo systemctl suspend'
alias ww='sudo wifi-menu'
alias p='evince'
alias startmysql="sudo /usr/bin/mysqld_safe --datadir=/var/lib/mysql"
alias rld='source ~/.zshrc'
alias e="exit"
alias pk="pkill"
alias rk="sudo rfkill unblock all"
alias yo="yarn outdated"

# connect to a wifi network
alias q="sudo ip link set wlp2s0 down &&\
  sudo netctl start"
