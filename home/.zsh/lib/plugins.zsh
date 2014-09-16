ZSH_PLUGIN_ROOT=~/.zsh/plugins

for plugin ($plugins); do
    # source the actual plugin
    source $ZSH_PLUGIN_ROOT/$plugin/$plugin.plugin.zsh
    # load completiongs
    fpath=($ZSH_PLUGIN_ROOT/$plugin $fpath)
done

# gogo compinit
autoload -U compinit
compinit -i
