# NOTE:
# font:
#   https://github.com/miiton/Cica
# golang: #   https://golang.org/dl/
# zsh-completions:
#   https://github.com/zsh-users/zsh-completions
# sudo apt install xsel figlet peco
# ghq:
#   go get github.com/motemen/ghq
# bat:
#   echo '--theme="Monokai Extended"' >> $(bat --config-file)

function load_if_exist() {
	[[ -e $1 ]] && source $1
}

source ~/.zshrc_path_completion
source ~/.zshrc_alias
source ~/.zshrc_key_binding
load_if_exist "~/.zshrc_1password"
load_if_exist "~/.zshrc_mercari"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=vim

# zsh-syntax-highlight
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ssh-agent
if [ $(pgrep ssh-agent | wc -l) -eq 0 ]; then
	rm -f /tmp/ssh-agent.sock
	eval $(ssh-agent -a /tmp/ssh-agent.sock) &>/dev/null
	ssh-add ~/.ssh/id_ed25519 &>/dev/null
else
	export SSH_AUTH_SOCK=/tmp/ssh-agent.sock
	export SSH_AGENT_PID=$(pidof ssh-agent)
fi

# cd -> ls
chpwd() {ls}

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
function precmd() {
	vcs_info
}

# 右プロンプトに表示
## prompt_subst: プロンプトを表示する際に変数を展開するオプション
setopt prompt_subst
## vcs_info_msg_0_: バージョン管理システムの情報
## RPROMPT: 右プロンプトに情報を表示するときの環境変数
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

##
# 色付け
##
autoload -Uz colors && colors
export PROMPT="%{${bg[white]}%}%{${fg[black]}%}%D{%Y-%m-%d %H:%M:%S} %~ %{${reset_color}%}%{${fg[white]}%}  %{${reset_color}%}"
