# env vars
EDITOR="emacs"
GTAGSCONF="$HOME/.globalrc"
GTAGSLABEL="ctags"

# path setup
paths=(
    /usr/local/sbin
    /usr/local/bin
    /usr/sbin
    /usr/bin
    /sbin
    /bin
    /home/simon/.cabal/bin
    /opt/android-sdk/tools
    /home/simon/.gem/ruby/2.2.0/bin
    /usr/local/heroku/bin
    /home/simon/dev/calc/bin
    /home/simon/.local/bin
    /home/simon/opt/android-sdk-linux/tools
    /home/simon/apps/webstorm/bin
    /home/simon/.cargo/bin
)
source ~/.zsh/paths.zsh

# lib files
source ~/.zsh/lib/git.zsh
source ~/.zsh/lib/theme.zsh
source ~/.zsh/lib/completions.zsh
source ~/.zsh/lib/history.zsh

# usability
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/keys.zsh

# theme
source ~/.zsh/themes/simple_blue.zsh-theme

# plugins
plugins=(wd)
source ~/.zsh/lib/plugins.zsh

# zsh config
source ~/.zsh/config.zsh
