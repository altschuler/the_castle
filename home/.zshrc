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
    /home/simon/.gem/ruby/2.3.0/bin
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

# ng complete

###-begin-ng-completion###
#
# ng command completion script
#
# Installation: ng completion >> ~/.bashrc (or ~/.zshrc)
#

ng_opts='new init build serve generate autocomplete e2e format lint test version'
init_opts='--dry-run --verbose --blueprint --skip-npm --skip-bower --name'
new_opts='--dry-run --verbose --blueprint --skip-npm --skip-bower --skip-git --directory'
build_opts='--environment --output-path --watch --watcher'
serve_opts='--port --host --proxy --insecure-proxy --watcher --live-reload --live-reload-host
            --live-reload-port --environment --output-path --ssl --ssl-key --ssl-cert'
generate_opts='component directive pipe route service'
test_opts='--watch --browsers --colors --log-level --port --reporters'

if type complete &>/dev/null; then
  _ng_completion() {
    local cword pword opts

    COMPREPLY=()
    cword=${COMP_WORDS[COMP_CWORD]}
    pword=${COMP_WORDS[COMP_CWORD - 1]}

    case ${pword} in
      ng) opts=$ng_opts ;;
      i|init) opts=$init_opts ;;
      new) opts=$new_opts ;;
      b|build) opts=$build_opts ;;
      s|serve|server) opts=$serve_opts ;;
      g|generate) opts=$generate_opts ;;
      test) opts=$test_opts ;;
    esac

    COMPREPLY=( $(compgen -W '${opts}' -- $cword) )

    return 0
  }
  complete -o default -F _ng_completion ng
elif type compctl &>/dev/null; then
  _ng_completion () {
    local words cword opts
    read -Ac words
    read -cn cword
    let cword-=1

    case $words[cword] in
      ng) opts=$ng_opts ;;
      i|init) opts=$init_opts ;;
      new) opts=$new_opts ;;
      b|build) opts=$build_opts ;;
      s|serve|server) opts=$serve_opts ;;
      g|generate) opts=$generate_opts ;;
      test) opts=$test_opts ;;
    esac

    setopt shwordsplit
    reply=($opts)
    unset shwordsplit
  }
  compctl -K _ng_completion ng
fi
###-end-ng-completion###
