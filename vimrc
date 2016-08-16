execute pathogen#infect()
execute pathogen#helptags()

if &compatible
  set nocompatible             " be iMproved, required
  filetype off                 " be iMproved, required
end

filetype plugin indent on      " required

set noerrorbells               " don't beep at me
set number                     " turn on line numbers
set backspace=indent,eol,start " make backspace more powerful
set showcmd                    " show cmd I am typing

set noswapfile                 " Don't use swapfile
set nobackup                   " Don't create annoying backup files
set nowritebackup
set splitbelow                 " v-split to the right
set splitright                 " split below
set encoding=utf-8             " default encoding in utf-8
set autowrite                  " automatically save before :next, :make etc.
set autoread                   " automatically read changed files without asking
set laststatus=2               " always show airline
set hidden                     " allow unsaved background buffers and remember undo/marks

set ruler                      " show cursor position all the time

set fileformats=unix,dos,mac   " prefer unix over windows over os 9 formats

set noshowmatch                " do not show the matching brackets by flickering
set noshowmode                 " let airline show the mode
set hlsearch                   " hilight found searches
set incsearch                  " show the match while typing
set ignorecase                 " case insensitive search
set smartcase                  " but not when search includes an uppercase letter

set wrap                       " wrap long lines
set textwidth=79               " wrap at 79 chars
set formatoptions=qrn1         " text formatting options see :help fo-table
set autoindent                 " sanely indent
set showmatch                  " briefly display matching bracket
set smarttab                   " make the tab key smarter
set expandtab                  " use the appropriate number of spaces
set tabstop=2 shiftwidth=2     " always 2 spaces, always
set shiftround                 " round indent to multiples of shiftwidth

let mapleader = "\<Space>"     " space as leader is a game changer
let g:mapleader = "\<Space>"   " space as leader is a game changer

syntax enable
set background=dark
colorscheme molokai

" remember more commands and search history
set history=10000

" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces

" I don't always fold code, but when I do, I do it manually
set foldmethod=manual

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

" 80 columns yo
let &colorcolumn=join(range(121,999),",")

" remap jk to exit insert mode
imap jk <Esc>

" Navigate in a sane way
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" disable cursor keys in normal mode
" Uncomment to be a true Vimmer and disable the arrow keys
" map <Left>  :echo "no!"<cr>
" map <Right> :echo "no!"<cr>
" map <Up>    :echo "no!"<cr>
" map <Down>  :echo "no!"<cr>

" Yank from cursor to end of line, like C D
nnoremap Y y$

" Indent the current file
noremap <silent> <Leader>i mmgg=G`m

" Better code paste support
noremap <silent> <Leader>p :set paste<CR>i<esc>"*]p:set nopaste<CR>

" clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

" insert blank lines without going into insert mode
nmap go o<esc>
nmap gO O<esc>

autocmd VimResized * :wincmd =

" NERDTree
let NERDTreeHijackNetrw = 1
nmap <Leader>w :NERDTreeToggle<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers=['']

" Don't require .jsx extension to load JSX syntax
let g:jsx_ext_required = 0

" DelimitMate
let g:delimitMate_expand_cr = 1     
let g:delimitMate_expand_space = 1      
let g:delimitMate_expand_inside_quotes = 0

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Ag
let g:ag_working_path_mode="r"
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Allow project local vimrc
set exrc
set secure

" Rainbow parens
" TODO: This causes me trouble and doesn't always load like I expect
augroup rainbow_cmd
  autocmd!
  autocmd VimEnter * RainbowParenthesesActivate
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces
augroup END

let g:rbpt_colorpairs = [
      \ ['red',         'RoyalBlue3'],
      \ ['brown',       'SeaGreen3'],
      \ ['blue',        'DarkOrchid3'],
      \ ['gray',        'firebrick3'],
      \ ['green',       'RoyalBlue3'],
      \ ['magenta',     'SeaGreen3'],
      \ ['cyan',        'DarkOrchid3'],
      \ ['darkred',     'firebrick3'],
      \ ['brown',       'RoyalBlue3'],
      \ ['darkblue',    'DarkOrchid3'],
      \ ['gray',        'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkmagenta', 'SeaGreen3'],
      \ ['darkcyan',    'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ]

nnoremap <F9> :Dispatch<CR>
nnoremap <F10> :Dispatch npm test -s<CR>
nnoremap <Leader>d :Dispatch flow<CR>

let g:airline_powerline_fonts = 1

" Get totally tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,\zs<CR>
vmap <Leader>a, :Tabularize /,\zs<CR>
nmap <Leader>af :Tabularize /from<CR>
vmap <Leader>af :Tabularize /from<CR>

let g:UltiSnipsExpandTrigger="<C-k>"

nmap <Leader><Leader> :TagbarToggle<CR>

" Try to auto generate ctags
let g:vim_tags_auto_generate = 1

" try to tagbar for typescript
let g:tagbar_type_typescript = {
\ 'ctagstype': 'typescript',
\ 'kinds': [
	\ 'c:classes',
	\ 'n:modules',
	\ 'f:functions',
	\ 'v:variables',
	\ 'v:varlambdas',
	\ 'm:members',
	\ 'i:interfaces',
	\ 'e:enums',
\ ]
\ }

" cast should indent the same as switch
let g:js_indent_flat_switch = 1

" Disable tsuquyomi err checking in favor of syntastic
let g:tsuquyomi_disable_quickfix = 1

nnoremap <Leader>gw :wa<CR> :Git add .<CR>:Git commit -m "WIP"<CR> :Gpush<CR>
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']

set t_Co=256