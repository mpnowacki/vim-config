" vim: fdm=marker

" Vim Settings {{{

if !has('nvim')

  set nocompatible   " disable vi-compatibility
  set t_Co=256       " explicitly tell Vim that the terminal supports 256 colors

  set encoding=utf-8
  set fileencoding=utf-8
endif

syntax on
filetype plugin indent on

set noerrorbells             " No beeps
set noswapfile               " Don't use swapfile
set nobackup                 " Don't create annoying backup files
set nosplitright             " Split vertical windows left bo the current windows
set splitbelow               " Split horizontal windows below to the current windows
set hidden

" statusline always visible
set laststatus=2

" search
set ignorecase
set smartcase
set hlsearch
set incsearch
nnoremap <silent> <CR> :nohlsearch<CR>

" tabs
set tabstop=2
set shiftwidth=2
set expandtab
set shiftround

" handle long lines
set number
set wrap
set linebreak
set breakindent
let &showbreak = '↳ '
"let &showbreak = '↪ '
set textwidth=79
set formatoptions=qrn1
set colorcolumn=100
hi ColorColumn ctermbg=lightgrey

set matchtime=0

set modeline

if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set clipboard=unnamed
  else
    set clipboard=unnamedplus
  endif
endif

autocmd FileType help wincmd H " open help vertically

set wildignore+=*/log/*,*/target/*,*.class     " MacOSX/Linux

let mapleader = ","
let maplocalleader = ","

inoremap jk <esc>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <C-a> ^
nnoremap <C-e> $
inoremap <C-a> <Esc>I
inoremap <C-e> <Esc>A
nnoremap <M-0> <C-a>
nnoremap <M--> <C-x>
nnoremap <S-h> :bp<CR>
nnoremap <S-l> :bn<CR>
nnoremap j gj
nnoremap k gk

vnoremap " <esc><esc>`<i"<esc>`>la"<esc>

"onoremap in( :<c-u>normal! f(vi(<cr>
"onoremap il( :<c-u>normal! F)vi(<cr>

iabbrev @@ kopiczko@gmail.com
iabbrev retunr return
iabbrev reutnr return

execute pathogen#infect()
if has('mac')       " mac settigns
elseif has('unix')  " linux settings
  let g:netrw_browsex_viewer = 'xdg-open'
endif

" }}}

" python {{{
"
" https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
if has('nvim')
  let g:python_host_prog = '/Users/mnowacki/.vim/pyvenv2/bin/python'
  let g:python3_host_prog = '/Users/mnowacki/.vim/pyvenv3/bin/python'
endif
" }}}

" Solarized theme {{{
"set background=dark
colorscheme darcula
" }}}

" CtrlP {{{
let g:ctrlp_working_path_mode = 'ra'
" }}}

" deoplete {{{
let g:deoplete#enable_at_startup = 1

" Go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = $HOME.'/.config/nvim/cache/deoplete/go/'.$GOOS.'_'.$GOARCH
" }}}

" lightline {{{
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ }
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" }}}

" syntastic {{{
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
" }}}

" tabar {{{
nmap <F3> :TagbarToggle<CR>
" }}}

" vim-go {{{

let g:go_fmt_command = "goimports"

augroup vimgo
  autocmd!

  autocmd FileType go nmap <leader>r <Plug>(go-run)
  autocmd FileType go nmap <leader>d <Plug>(go-doc)
  autocmd FileType go nmap <C-]> <Plug>(go-def)

  autocmd FileType go setlocal noexpandtab tabstop=8 shiftwidth=8 softtabstop=8

augroup END

" }}}

" rust {{{

augroup rust
  autocmd!

  autocmd FileType rust nmap  <C-]> :YcmComplete GoTo<CR>
augroup END

" }}}

" ycm_extra_conf {{{
" this is not recommended, it's just a temporary fix for c/cpp projects without
" their own ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" }}}

" case insensitive :q and :w {{{
" I always lift SHIFT too late after typing the ":" :)
command Q q
command W w
command WQ wq
command Wq wq
" }}}

:map <expr> <silent> <F3> system('osascript -e "tell application \"System Events\" to keystroke 
\                                 \":YcmCompleter \""; osascript -e "tell application 
\                                 \"System Events\" to key code 48"')

:map! <F3> <ESC> <F3>

augroup markdown
  autocmd!
  autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

noremap <F2> :NERDTreeFind<CR>

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <Esc>\ :TmuxNavigatePrevious<cr>
