# directories
alias ll='ls -lh'
alias la='ls -lAh'

# monitors
alias scra='xrandr --output HDMI1 --auto --above eDP1'
alias scrb='xrandr --output HDMI1 --auto --below eDP1'
alias scrr='xrandr --output HDMI1 --auto --right-of eDP1'
alias scrl='xrandr --output HDMI1 --auto --left-of eDP1'
alias scroff='xrandr --output HDMI1 --off'

# package managing
alias yao='yaourt --noconfirm'
alias pm='sudo pacman'

# git
alias gg='git status'

# misc
alias ww='sudo wifi-menu'
alias startmysql="sudo /usr/bin/mysqld_safe --datadir=/var/lib/mysql"
alias rld='source ~/.zshrc'
alias e="exit"
