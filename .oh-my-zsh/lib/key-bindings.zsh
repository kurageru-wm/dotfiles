# TODO: Explain what some of this does..

bindkey -e  ## emacs key bindings
#bindkey '\ew' kill-region
#bindkey '^r' history-incremental-search-backward
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history

# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[OF" end-of-line
bindkey ' ' magic-space    # also do history expansion on space

#bindkey "^[[1;5C" forward-word
#bindkey "^[[1;5D" backward-word

#bindkey '^[[Z' reverse-menu-complete

# Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

# consider emacs keybindings:

#
#bindkey '^[[A' up-line-or-search
#bindkey '^[[B' down-line-or-search
#bindkey '^[^[[C' emacs-forward-word
#bindkey '^[^[[D' emacs-backward-word
#
#bindkey -s '^X^Z' '%-^M'
#bindkey '^[e' expand-cmd-path
#bindkey '^[^I' reverse-menu-complete
#bindkey '^X^N' accept-and-infer-next-history
#bindkey '^W' kill-region
#bindkey '^I' complete-word
## Fix weird sequence that rxvt produces
#bindkey -s '^[[Z' '\t'
#
#
#

#bindkey "^S" kill-whole-line
bindkey -M afu "^U" forward-char
#bindkey -M afu "^F" kill-whole-line
#bindkey "^N" clear-screen
#bindkey "^B" down-line-or-history
bindkey -M afu "^T" kill-line
#bindkey "^L" backward-char

# Custom Key Bindings

bindkey -M afu ',.' show-buffer-stack
bindkey -M afu '^o^o' peco-snippets
bindkey -M afu '^w' cddown_dir #peco-cd
bindkey -M afu '^q' peco-commands
bindkey -M afu '^o^r' peco-history
bindkey -M afu '^o' peco-autojump
bindkey -M afu '^o^p' peco-anamnesis
bindkey -M afu ',,' peco-select
bindkey -M afu '^r' bind-ls
bindkey -M afu '' key-binds
bindkey -M afu '[' backward-word
bindkey -M afu ']' forward-word

bindkey -M afu '' do-enter

bindkey -M afu "^]" edit-command-line
bindkey -M afu "^K" kill-clipboard
