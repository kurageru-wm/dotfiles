PROMPT="%{$fg_bold[blue]%}┌[%T]%{$reset_color%}%{$fg[blue]%} [%~$(git_prompt_info)] %{$reset_color%}
└> %{$fg[red]%}%{$reset_color%}"
RPS1='%{$fg[green]%}%n@%M%{$reset_color%} '
#RPS1='%{$fg[green]%}%{$fg[normal]%}%2~$(git_prompt_info) %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" (%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ⚡%{$fg[yellow]%}"

