# NOTE:
# font:
#   https://github.com/miiton/Cica
# sudo apt install xsel figlet peco
# bat:
#   echo '--theme="Monokai Extended"' >> $(bat --config-file)

function load_if_exist() {
	[[ -e $1 ]] && source $1
}

source ~/.zshrc_opt
source ~/.zshrc_path_completion
source ~/.zshrc_alias
source ~/.zshrc_key_binding
source ~/.zshrc_style
load_if_exist "$HOME/.zshrc_1password"
load_if_exist "$HOME/.zshrc_mercari"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=vim

# history
export HISTFILE=${HOME}/.zhistory
export HISTSIZE=1000
export SAVEHIST=100000

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
chpwd() {
	ls
}
