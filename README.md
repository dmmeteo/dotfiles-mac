# dofiles-mac

## Installation

```bash
git clone git@dmmetoe/dofiles-mac.git ~/.dofiles
cd ~/.dofiles
./install.sh
```

## Backup all dependencies in Brewfile
```bash
brew bundle dump --all --describe --global
```

## Restore all dependencies in Brewfile
```bash
brew bundle install --global
```