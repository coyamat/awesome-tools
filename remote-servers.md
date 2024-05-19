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

```
function tmux-ssh() {
    agent="$HOME/.ssh/agent"
    if [ -S "$SSH_AUTH_SOCK" ]; then
        case $SSH_AUTH_SOCK in
        /tmp/*/agent.[0-9]*)
            ln -snf "$SSH_AUTH_SOCK" $agent && export SSH_AUTH_SOCK=$agent
        esac
    elif [ -S $agent ]; then
        export SSH_AUTH_SOCK=$agent
    else
        echo "no ssh-agent"
    fi
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

## パッケージの追加

```
sudo apt install \
  vim \
  git \
  ;
```

## ホスト名の変更

```
sudo hostnamectl set-hostname XXX
```


/etc/hostsを更新

```
sudo vim /etc/hosts
```

## 固定IPアドレスの設定

- Netplanで固定IPアドレスの設定
    - [Ubuntu22.04で固定IPの設定やDNSの変更をする (netplan)](https://tex2e.github.io/blog/linux/ubuntu-netplan)
- コマンド `netplan try` を使う方法
    - [netplanを用いてIPアドレスをセットする](https://www7390uo.sakura.ne.jp/wordpress/archives/388)

設定ファイルの例:

```yaml
network:
  ethernets:
    ens160:
      dhcp4: false
      addresses:
        - 172.17.2.50/25
      nameservers:
        addresses:
          - 172.17.2.1
      routes:
        - to: default
          via: 172.17.2.1
  version: 2
  ```

  コマンドの例:

  ```bash
  sudo netplan try --timeout 10
  ```

## Swap

[Ubuntu 20.04にスワップ領域を追加する方法 | DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-20-04-ja)

## ファイアウォール

- SYN Floodの対策
    - [iptables/SYN Flood対策をしたい
](https://vok.paburica.com/index.php?iptables%2FSYN%20Flood%E5%AF%BE%E7%AD%96%E3%82%92%E3%81%97%E3%81%9F%E3%81%84)
- DDoS/DoSの対策

