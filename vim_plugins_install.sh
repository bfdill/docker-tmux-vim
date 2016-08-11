#!/bin/bash

REPOS=(
vim-scripts/VimClojure
luchermitte/lh-cpp
rking/ag.vim
jlanzarotta/bufexplorer
raimondi/delimitmate
othree/html5.vim
gregsexton/matchtag
tomasr/molokai
scrooloose/nerdtree
kien/rainbow_parentheses.vim
scrooloose/syntastic
godlygeek/tabular
majutsushi/tagbar
marijnh/tern_for_vim
quramy/tsuquyomi
leafgarland/typescript-vim
sirver/ultisnips
bling/vim-airline
vim-airline/vim-airline-themes
tpope/vim-commentary
ap/vim-css-color
tpope/vim-dispatch
tpope/vim-fugitive
airblade/vim-gitgutter
pangloss/vim-javascript
jelera/vim-javascript-syntax
jason0x43/vim-js-indent
leshill/vim-json
mxw/vim-jsx
tpope/vim-markdown
moll/vim-node
tpope/vim-repeat
honza/vim-snippets
tpope/vim-surround
szw/vim-tags
christoomey/vim-tmux-navigator
tpope/vim-unimpaired
shougo/vimproc.vim
Valloric/YouCompleteMe
myusuf3/numbers.vim
)

for REPO in ${REPOS[@]}
do
  IFS='/' read -ra STUFF <<< ${REPO}
  PROJECT_NAME=${STUFF[1]}

  if [ ! -d  "${PROJECT_NAME}" ]
  then
    git clone https://github.com/${REPO} ${PROJECT_NAME}
  else
    cd ${PROJECT_NAME}
    git fetch
    git pull
    cd ..
  fi
done

cd YouCompleteMe
git submodule update --init --recursive
./install.py --tern-completer
cd ..
touch install_done
