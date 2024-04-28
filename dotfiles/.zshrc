# NOTE:
# font:
#   https://github.com/miiton/Cica
# golang: #   https://golang.org/dl/
# zsh-completions:
#   https://github.com/zsh-users/zsh-completions
# sudo apt install xsel figlet peco
# ghq:
#   go get github.com/motemen/ghq 

# 言語設定
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# PATHの設定
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/bin"

# zsh-completions
if type brew &>/dev/null; then
  FPATH=/opt/homebrew/share/zsh-completions:$FPATH
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  autoload -Uz compinit && compinit
fi

# cd alternative
eval "$(zoxide init zsh)"

#予測入力
# autoload predict-on
# predict-on

# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# node
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/opt/go/bin"

# homebrew
export PATH="/opt/homebrew/sbin:$PATH"

# krew
export PATH="${PATH}:${HOME}/.krew/bin"

# texlive
export PATH="${PATH}:/usr/local/texlive/2022/bin/universal-darwin"
launchctl setenv PATH $PATH

# エディタ
export EDITOR=vim

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zhistory
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# viキーバインド
bindkey -e

# インクリメンタルからの検索
bindkey "^R" history-incremental-search-backward
#入力途中の履歴補完を有効化する
autoload history-search-end
#/foo/barでいきなりcd
setopt AUTO_CD
#変数名を補完する
setopt AUTO_PARAM_KEYS
#echo {a-z}などを使えるようにする
setopt BRACE_CCL
#コマンドのスペルの訂正を使用する
setopt CORRECT
#引数のスペルの訂正を使用する
# setopt CORRECT_ALL
#aliasを展開して補完
setopt COMPLETE_ALIASES
#語の途中でもカーソル位置で補完
setopt COMPLETE_IN_WORD
#ヒストリに時刻情報もつける
setopt EXTENDED_HISTORY
# ワイルドカード展開を使用する
setopt extended_glob
#$0 にスクリプト名/シェル関数名を格納
setopt FUNCTION_ARGZERO
# 重複を記録しない
setopt hist_ignore_dups
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify
# 余分な空白は詰めて記録
setopt hist_reduce_blanks
# 古いコマンドと同じものは無視
setopt hist_save_no_dups
# 履歴をインクリメンタルに追加
setopt inc_append_history
# historyを共有
setopt share_history

##
# Git Branch表示
##

# vcs_infoを読み込み
autoload -Uz vcs_info
 
# vcs_info_msg_0_変数をどのように表示するかフォーマットの指定
## デフォルトのフォーマット
### %s: どのバージョン管理システムを使っているか（git, svnなど）
### %b: ブランチ名
zstyle ':vcs_info:*' formats '(%s)[%b]'
## 特別な状態（mergeでコンフリクトしたときなど）でのフォーマット
### %a: アクション名（merge, rebaseなど）
zstyle ':vcs_info:*' actionformats '(%s)[%b|%a]'
 
# プロンプトが表示される毎にバージョン管理システムの情報を取得
## precmd: プロンプトが表示される毎に実行される関数
## vcs_info: バージョン管理システムから情報を取得
precmd () { vcs_info }
 
# 右プロンプトに表示
## prompt_subst: プロンプトを表示する際に変数を展開するオプション
setopt prompt_subst
## vcs_info_msg_0_: バージョン管理システムの情報
## RPROMPT: 右プロンプトに情報を表示するときの環境変数
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

##
# Alias
##

# base
alias ls='ls -F'
alias ll='ls -laF'
alias la='ls -aF'
alias lns='ln -s'
alias emacs='vim'
alias sl='ls'
alias l='ls'
alias cdd='cd $_'
alias suod='sudo'
alias vm='vim'
alias g='git'

# overwrite
alias exiftool='exiftool -lang ja'
alias exiftool-all='exiftool -lang ja -all='
alias vim='vim -o'

# short-tool 
alias simple="export PS1='$ '"
alias ports='netstat -antu | grep -i listen'
alias mkwdir='mkdir work_$(date +%Y%m%d); cd $_'
alias gpom='git push origin master'
alias py='python3'
alias jwhois="whois -h whois.jprs.jp"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
# alias pbcopy="xsel --clipboard --input"
# alias pbcopy='clip.exe'
function pdf-unlock {
    if [[ -z $2 ]]; then
        echo -n "Password> "
        read pdf_password
    else
        pdf_password="$2"
    fi
    pdftk $1 input_pw $pdf_password output output.pdf
}

# docker
alias docker-trr='docker run -it --rm tomoyk/docker-trr'
alias docker-php="docker run --rm -p 8000:80 -v ~/public_html:/var/www/html --name php7 -d php:7.0-apache"

# check sum
alias sha512sum='openssl dgst -sha512'
alias sha256sum='openssl dgst -sha256'
alias md5sum='md5'

alias k=kubectl
alias ether='ifconfig enp0s31f6'

function docker-ts {
    curl -s https://registry.hub.docker.com/v1/repositories/$1/tags | sed "s/,/\n/g" | grep name | cut -d '"' -f 4
}

# prompt
# export PROMPT='%F{green}%n@%m%f:%~# '
# 色付け
autoload -Uz colors && colors
# powerline風
export PROMPT="%{${bg[white]}%}%{${fg[black]}%}%D{%Y-%m-%d %H:%M:%S} %~ %{${reset_color}%}%{${fg[white]}%}  %{${reset_color}%}"

# peco git repository
function peco-src () {
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER" --prompt "REPOSITORY>")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

# fzf history
function fzf-select-history() {
    BUFFER=$(history -n -r 1 | fzf --query "$LBUFFER" --reverse)
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^R' fzf-select-history

# peco kubectx
function peco-kubectx() {
    local kube_context=$(kubectx | peco --prompt "Kube Context>")
    if [ -n "$kube_context" ]; then
        BUFFER="kubectx ${kube_context}"
        zle accept-line
    fi
}
zle -N peco-kubectx
bindkey '^K' peco-kubectx

# peco kubens
function peco-kubens() {
    local kube_ns=$(kubens | peco --prompt "Kube Namespace>")
    if [ -n "$kube_ns" ]; then
        BUFFER="kubens ${kube_ns}"
        zle accept-line
    fi
}
zle -N peco-kubens
bindkey '^N' peco-kubens

[[ /usr/bin/kubectl ]] && source <(kubectl completion zsh)

if [ $(pgrep ssh-agent) -eq 0 ]; then
    rm -f /tmp/ssh-agent.sock
    eval $(ssh-agent -a /tmp/ssh-agent.sock) &> /dev/null
    ssh-add ~/.ssh/id_ed25519  &> /dev/null
else
    export SSH_AUTH_SOCK=/tmp/ssh-agent.sock;
    export SSH_AGENT_PID=$(pidof ssh-agent);
fi

alias pin1='ping 1.1.1.1'
chpwd(){ls}

export TERM=xterm-256color

alias thesis='code /Users/tkoyama/ghq/github.com/tomoyk/master-thesis'
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="$HOME/.embulk/bin:$PATH"

function heic2jpg() {
    if [ -z "$1" ]; then
        echo "Invalid options"
        exit 1
    fi
    fname=$(echo $1 | gsed 's/.HEIC$/.jpg/i')
    sips -s format jpeg "$1" -o "$fname"
}

alias codeh='code -r .'


# fzf-cd
fzf-cd() {
  local selected_dir
  selected_dir=$(find ${1:-.} -type d 2> /dev/null | fzf-tmux +m) && cd "$selected_dir"
}
zle -N fzf-cd-widget fzf-cd
bindkey '^G' fzf-cd-widget

# fzf-vim
fzf_vim_edit() {
    local file
    file=$(fzf --reverse --preview="bat --color=always --style=header,grid --line-range :40 {}" --preview-window=right:60%:wrap)
    if [ -n "$file" ]; then
        vim "$file"
    fi
}
alias v='fzf_vim_edit'

# fzf-git-branch
function fzf-co() {
  git checkout $(git branch -a | \
    tr -d " " | \
    fzf --height 100% --prompt "CHECKOUT BRANCH>" --preview "git log --color=always {}" | \
    head -n 1 | sed -e "s/^\*\s*//g" | \
    perl -pe "s/remotes\/origin\///g")
}
zle -N fzf-co
bindkey '^B' fzf-co

# fzf-git-show
function fzf-git-show {
    git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
    fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort --preview "git show --color=always {1} | less -R" --preview-window=:wrap --bind "enter:execute: (grep -o '[a-f0-9]\{7\}' | head -1 | xargs -I % git show --color=always % | less -R)"
}
alias glog='fzf-git-show'

# zoxide-cd
zle -N zi
bindkey '^z' zi

#source ~/.zshrc_1password

alias glow='glow -p'
alias tf=terraform

#source ~/.zshrc_mercari

alias -s json='jq .'
alias -s yaml='yq .'
alias -s md=glow
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias -s zip=unzip
alias -s tgz='tar -xzvf'
alias -s tar.gz='tar -xzvf'
alias -s csv=bat
alias -s py=python
