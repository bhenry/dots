# dots
Add this to your .zshrc
```bash
export DOTS=$HOME/.dots
source $DOTS/zsh
```

```bash
git clone git@github.com:bhenry/dots.git
mv dots ~/.dots
touch .zshrc
echo "export DOTS=$HOME/.dots\nsource $DOTS/zsh" > .zshrc
```