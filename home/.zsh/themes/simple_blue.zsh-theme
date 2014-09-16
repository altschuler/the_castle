# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[blue]%}o"
# Prompt format: USER DIRECTORY BRANCH STATE $

RPROMPT="%{$fg_no_bold[white]%}%*%{$reset_color%}"
PROMPT="%{$fg[cyan]%}%2d%{$reset_color%}\
${git_info} \
%{$reset_color%}"
