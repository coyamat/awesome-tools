# For remote servers

## .zshrc

```
if tmux ls; then
  tmux a
else
  tmux
fi
```
