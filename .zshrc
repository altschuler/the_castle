ZSH=$HOME/.oh-my-zsh
HISTFILE=~/.zsh_hist
ZSH_THEME="ys"
EDITOR="emacs"
COMPLETION_WAITING_DOTS="true"

# opts
setopt AUTO_PUSHD
setopt NO_BEEP

# haskell completions
autoload -U compinit
compinit

bindkey "\C-w" kill-region


alias nwn="cd ~/.wine/drive_c/GOG\ Games/Neverwinter\ Nights\ Diamond\ Edition && ./nwn"
alias juglab="java -jar /home/simon/dev/jugglinglab-code/bin/JugglingLab.jar"
alias e="exit"

mdir () {
    mkdir $1 && cd $1
}

alias scra="xrandr --output HDMI1 --auto --above eDP1"
alias scrb="xrandr --output HDMI1 --auto --below eDP1"
alias scrr="xrandr --output HDMI1 --auto --right-of eDP1"
alias scrl="xrandr --output HDMI1 --auto --left-of eDP1"

alias scroff="xrandr --output HDMI1 --off"

alias ww="sudo wifi-menu"

alias rld="source ~/.zshrc"

alias yao="yaourt --noconfirm"
alias pm="sudo pacman"
alias h="htop"

alias startmysql="sudo /usr/bin/mysqld_safe --datadir=/var/lib/mysql"

# oh my plugins
plugins=(git bower coffee java npm vbox curl ghc-pkg ghc ghci cabal grunt zsh-syntax-highlighting wd yaourt rails)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/simon/.cabal/bin:/opt/android-sdk/tools:/home/simon/.gem/ruby/2.1.0/bin

# define git aliases last to overwrite existing
alias gg="git status"

export WINEARCH=win32

xset r rate 300 25
wd() {
  #  . /home/simon/dev/wd/wd.sh
  . /home/simon/bin/wd/wd.sh
}
