# ZSH

Start up sequence:

```
~/.zshenv          # sets ZDOTDIR
$ZDOTDIR/.zprofile # (login shell)
$ZDOTDIR/.zshrc    # (interactive shell)
$ZDOTDIR/.zlogin   # (login shell)
```

All zsh dot files reside in $ZDOTDIR except .zshenv.
