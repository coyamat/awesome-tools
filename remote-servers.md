# For remote servers

## .zshrc

```
if tmux ls; then
  tmux a
else
  tmux
fi
```

```
function t() {
    session_name=$(tmux ls | peco | awk -F: '{print $1}')
    tmux a -t $session_name
}
```
