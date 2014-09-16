# env vars
EDITOR="emacs"

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
    /home/simon/.gem/ruby/2.1.0/bin
)
source ~/.zsh/paths.zsh

# lib files
source ~/.zsh/lib/git.zsh
source ~/.zsh/lib/theme.zsh
source ~/.zsh/lib/completions.zsh

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
