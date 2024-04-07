# For remote servers

## .bashrc

```
if tmux ls; then
  tmux a
else
  tmux
fi
```

```
function t() {
    session_name=$(tmux ls | fzf | awk -F: '{print $1}')
    tmux a -t $session_name
}
```

## APT mirror changes

```
sudo sed -i.bak -e "s%http://jp.archive.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list
```

[apt-getの利用リポジトリを日本サーバーに変更する #Ubuntu - Qiita](https://qiita.com/fkshom/items/53de3a9b9278cd524099)

## sudo password less

```
sudo sed -e 's/%sudo\sALL=(ALL:ALL) /&NOPASSWD:/' /etc/sudoers | sudo EDITOR=tee visudo >/dev/null
```
