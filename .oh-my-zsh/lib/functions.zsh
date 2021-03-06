function zsh_stats() {
  history | awk '{print $2}' | sort | uniq -c | sort -rn | head
}

function uninstall_oh_my_zsh() {
  /usr/bin/env ZSH=$ZSH /bin/sh $ZSH/tools/uninstall.sh
}

function upgrade_oh_my_zsh() {
  /usr/bin/env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh
}

function take() {
  mkdir -p $1
  cd $1
}

# sheet
compdef _sheets sheet
function _sheets {
  local -a cmds
  _files -W  ~/.sheets/ -P '~/.sheets/'
 
  cmds=('list' 'edit' 'copy')
  _describe -t commands "subcommand" cmds
 
  return 1;
}

chpwd() {
    ls_abbrev
}

ls_abbrev() {
    if [[ ! -r $PWD ]]; then
        return
    fi
    # -a : Do not ignore entries starting with ..
    # -C : Force multi-column output.
    # -F : Append indicator (one of */=>@|) to entries.
    local cmd_ls='ls'
    local -a opt_ls
    opt_ls=('-CF' '--color=always')
    case "${OSTYPE}" in
        freebsd*|darwin*)
            if type gls > /dev/null 2>&1; then
                cmd_ls='gls'
            else
                # -G : Enable colorized output.
                opt_ls=('-aCFG')
            fi
            ;;
    esac

    local ls_result
    ls_result=$(CLICOLOR_FORCE=1 COLUMNS=$COLUMNS command $cmd_ls ${opt_ls[@]} | sed $'/^\e\[[0-9;]*m$/d')

    local ls_lines=$(echo "$ls_result" | wc -l | tr -d ' ')

    if [ $ls_lines -gt 10 ]; then
        echo "$ls_result" | head -n 5
        echo '...'
        echo "$ls_result" | tail -n 5
        echo "$(command ls -1 -A | wc -l | tr -d ' ') files exist"
    else
        echo "$ls_result"
    fi
}


function peco-snippets() {
    BUFFER=$(cat <(echo "") <(grep "" ~/.sheets/*) | awk '{FS="sheets/"; print $2}' | peco --query "$LBUFFER" | cut -d ":" -f 2-)
    #zle accept-line
    #zle clear-screen
}

function peco-history() {

    BUFFER=$( fc -l -n 1 | tail -n 50 | tac | peco --query "$LBUFFER")
    zle accept-line
}

function peco-autojump() {

    BUFFER=$( cat ~/.local/share/autojump/autojump.txt | cut -f2 | peco --query "$LBUFFER")
    zle accept-line
}

function peco-cd() {

# yarizurai cara hutuuni cd
    BUFFER=$(ls --color=none -d */ | peco --query "$LBUFFER")
#    pushln 'cd '
    zle accept-line
}
function cddown_dir(){
    com='$SHELL -c "ls -AF . | grep / "'
    while [ $? = 0 ] # $?: the exit status of the last command, failed-> not zero
    do
        cdir=`eval $com | peco --query '^[^.] ^'`
        if [ $? = 0 ];then # check the exit status of cdir=...
            cd $cdir # $? is zero
            eval $com # for while check. if there is no dir, $? is not zero
        else
            break
        fi
    done
    zle reset-prompt
}

function peco-commands() {
    BUFFER=$(cat <(commands) <(alias | cut -d= -f1) | peco --query '^')
    zle end-of-line
    zle magic-space
}

function peco-select() {
    IFS='\ '
    RES=$(ls --color=none | peco | tr -d '\r')
    LBUFFER+=" "$RES" "
    zle reset-prompt
}

function bind-ls() {
    echo
    no
    zle accept-line
}

function do-enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    ls_abbrev
    zle reset-prompt
    return 0
}
zle -N do-enter

function show-buffer-stack(){
    POSTDISPLAY="
    stack: $LBUFFER"
    zle push-line
}

zle -N peco-snippets
zle -N peco-history
zle -N peco-autojump
zle -N peco-cd
zle -N cddown_dir
zle -N peco-commands
zle -N peco-select
zle -N bind-ls
zle -N show-buffer-stack


function key-binds() {
    ag -A 100 "Custom" ~/.oh-my-zsh/lib/key-bindings.zsh
    zle accept-line
}
zle -N key-binds


function peco-anamnesis(){
    BUFFER=$(anamnesis -l 200 | tail --lines=+3 | cut -d, -f 3 | cut -d \' -f2 | grep -v '\\u' | peco)
}
zle -N peco-anamnesis

function kill-clipboard(){
    zle kill-line
    echo $CUTBUFFER | xsel -i -b
}
zle -N kill-clipboard

function agvim() {
vim $(ag $@ | peco | awk -F : '{print "-c " $2 " "$1}')
}
