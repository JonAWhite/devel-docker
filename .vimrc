" Quickly edit/reload the vimrc file
nmap <silent> <leader>ve :e $MYVIMRC<CR>
nmap <silent> <leader>vs :so $MYVIMRC<CR>

" Pathogen
execute pathogen#infect()
filetype plugin indent on

Helptags

set nocompatible    " Disable vi-compatibility
set laststatus=2    " Always show the statusline
filetype off        " required
"set autochdir       " Let the working directory be the same as the file I am editing

if has("multi_byte")
 if &termencoding == ""
  let &termencoding = &encoding
 endif
 set encoding=utf-8
 setglobal fileencoding=utf-8
 "setglobal bomb
 set fileencodings=ucs-bom,utf-8,latin1
endif

" GVim
set guioptions+=c
set guioptions+=R
set guioptions-=m
set guioptions-=r
set guioptions-=b
set guioptions-=T
set guioptions-=R
set guioptions-=L
set guioptions-=e

" Vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Bundle 'Shougo/neocomplete.vim'
" Bundle 'bling/vim-airline'
" Bundle 'jiangmiao/auto-pairs'
" Bundle 'jlanzarotta/bufexplorer'
" Bundle 'tpope/vim-git'
" Bundle 'vim-scripts/c.vim'
" Bundle 'vim-scripts/perforce.vim'
" Bundle 'xolox/vim-easytags'
" Bundle 'xolox/vim-misc'

Bundle 'AndrewRadev/linediff.vim'
"Bundle 'vim-scripts/DirDiff.vim'
Bundle 'JonAWhite/vim-cpplint'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'Lokaltog/vim-distinguished'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'Raimondi/delimitMate'
Bundle 'Shutnik/jshint2.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'chrisbra/NrrwRgn'
Bundle 'chrisbra/csv.vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'drmikehenry/vim-headerguard'
Bundle 'garbas/vim-snipmate'
Bundle 'godlygeek/tabular'
Bundle 'honza/vim-snippets'
"Bundle 'idbrii/vim-perforce'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'jewes/Conque-Shell'
Bundle 'kien/ctrlp.vim'
"Bundle 'kshenoy/vim-signature'
Bundle 'lekv/vim-clewn'
Bundle 'majutsushi/tagbar'
Bundle 'marijnh/tern_for_vim'
Bundle 'mileszs/ack.vim'
Bundle 'mrtazz/DoxygenToolkit.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'navicore/vis.vim'
Bundle 'navicore/vissort.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'rhysd/vim-clang-format'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tomtom/tcomment_vim'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/AutoAdapt'
Bundle 'vim-scripts/L9'
Bundle 'vim-scripts/ZoomWin'
Bundle 'vim-scripts/a.vim'
Bundle 'vim-scripts/dbext.vim'
Bundle 'vim-scripts/genutils'
Bundle 'vim-scripts/ingo-library'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" END of Vundle

let mapleader=","
highlight comment ctermfg=darkmagenta
highlight Identifier ctermfg=red
highlight search ctermbg=lightgreen
syntax on
set backspace=indent,eol,start
set number
set autoindent
set expandtab
set smarttab
set ts=4
set shiftwidth=1
set nowrap
set wildmode=list:longest,full
set ignorecase
set smartcase
set incsearch
set hlsearch
" set cursorline        " have a line indicate the cursor location
set spl=en           " english spellchecking
nnoremap <F6> :set pastetoggle<CR>

set t_Co=256
" colorscheme desert
colorscheme distinguished

" searchfold
nnoremap <silent> ufa :set foldlevel=99<CR>
let g:searchfold_usestep = 3

nnoremap <silent> zj o<Esc>

map + <C-W>+
map - <C-W>-

" Vimgrep
" Search the current file for what's currently in the search register and display matches
nmap <silent> <leader>gs :vimgrep /<C-r>// ./* %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Search the current file for the word under the cursor and display matches
nmap <silent> <leader>gw :vimgrep /<C-r><C-w>/ ./* %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>


" NERDTree
nnoremap <F10> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.d$', '\.adserial$', '\.serial_parse$']
let NERDTreeDirArrows=0

" Syntastic
let g:syntastic_cpp_check_header = 1

" CtrlP
map <silent> <leader>be :CtrlPBuffer<CR>

" powerline
let g:Powerline_cache_dir = '/home/user/jwhite/tmp'
let g:Powerline_symbols   = 'compatible'

set tags+=./tags
set tags+=~/tags

" Create ctag file of current directory
map <F11> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Refresh ctags from Ref
map <F12> :!ctags -f ~/tags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q 
   \ /home/dev/fonix/online/ref/src/pol*.* 
   \ /home/dev/fonix/online/ref/src/nis*.*


" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
 " Use Ag over Grep
 set grepprg=ag\ --nogroup\ --nocolor
 let g:agprg="ag --column --ignore=tags"

 " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
 let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" xterm copy/paste
set clipboard=unnamedplus

" YouCompleteMe / YCM
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>ld :YcmCompleter GoTo<CR>
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" Tagbar
let g:tagbar_sort = 0
nnoremap <F9> :TagbarToggle<CR>

if filereadable(expand("~/.vimrc.local"))
 source ~/.vimrc.local
endif

" vim-easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s2)
map <Leader>w <Plug>(easymotion-w)
" or
" nmap `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-s2)
" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" Custom
" New Line without going into insert mode
nnoremap <silent> [<space>  :<c-u>put!=repeat([''],v:count)<bar>']+1<cr>
nnoremap <silent> ]<space>  :<c-u>put =repeat([''],v:count)<bar>'[-1<cr>

" Tmux Navigator
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

set pastetoggle=<F5>
map <F6> :setlocal spell! spelllang=en_us<CR>

" Cpp-lint
let g:cpplint_cmd="cpplint.py"

" Clang-Format

map <C-I> :pyf /usr/share/vim/addons/syntax/clang-format-3.5.py<CR>
imap <C-I> <ESC>:pyf /usr/share/vim/addons/syntax/clang-format-3.5.py<CR>i


" Vim-Easytags
"let g:easytags_dynamic_files = 2

" HexMe
let $in_hex=0
function HexMe()
 set binary
 set noeol
 if $in_hex>0
  :%!xxd -r
  let $in_hex=0
 else
  :%!xxd
  let $in_hex=1
 endif
endfunction
