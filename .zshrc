export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"

#######################################
# go path
#######################################
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin


#######################################
# peco hitory
#######################################
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

