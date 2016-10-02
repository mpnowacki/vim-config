# Install

## Clone the repository and update submodules

```
git clone git@github.com:mpnowacki/vim-config.git ~/.vim
cd ~/.vim && git submodule update --init --recursive
```

## Install [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)

See [installation instructions](https://github.com/Valloric/YouCompleteMe#installation)
for your OS.

On my mac I do it like this (if you want to use `--gocode-completer` flag you
have to have [go](http://golang.org/doc/install) installed):

```
brew install --with-clang llvm # use your OS package manager
cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer --gocode-completer
```

