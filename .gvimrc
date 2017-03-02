set nocompatible
set noswapfile
set ttimeout
set ttimeoutlen=0
set matchtime=0

" For Vim-Plug {{{
filetype off
call plug#begin()

Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'rakr/vim-one'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gabesoft/vim-ags'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/YankRing.vim'
Plug 'Valloric/YouCompleteMe'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fishbullet/deoplete-ruby'
Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/syntastic'
Plug 'mbbill/undotree'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-rbenv'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'vim-scripts/peaksea'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'bling/vim-airline'
Plug 'chase/vim-ansible-yaml'
Plug 'thoughtbot/vim-rspec'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'flowtype/vim-flow'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'danro/rename.vim'
Plug 'leafo/moonscript-vim'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" }}}

" Set Color Scheme {{{
" Silent prevents vim from complaining during initial setup when scheme is not
" available.
" silent! colorscheme solarized
" colorscheme summerfruit256
silent! colorscheme one
set background=light
call togglebg#map("<F5>")

" gui colors if iTerm
if $TERM_PROGRAM =~ "iTerm"
  set termguicolors
endif
" }}}

" Vim Settings {{{
set colorcolumn=80
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set ttyfast
set wildmenu
set mouse=a

" # http://superuser.com/questions/549930/cant-resize-vim-splits-inside-tmux
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" From http://robots.thoughtbot.com/post/27041742805/vim-you-complete-me
"set complete=.,b,u,]
"set wildmode=longest,list:longest

" Map ESC
let mapleader = ","               " The default leader key isn't very intuitive.

set number
set showmatch                   " matching brace/parenthesis/etc.
set hidden                      " http://nvie.com/posts/how-i-boosted-my-vim/

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

" Use the OS clipboard by default
set clipboard=unnamed

" Indicators
set list                          " Show hidden characters (tab and eol)
"set listchars=trail:⋅,nbsp:⋅,tab:▸\ ,eol:¬       " Use the same chars as textmate.
set listchars=trail:⋅,nbsp:⋅,tab:▸\
"set listchars=tab:▸\ ,trail:•,extends:❯,precedes:❮
set showbreak=↪\

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" easier navigation between split windows
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
" nnoremap <c-h> <c-w>h
" nnoremap <c-l> <c-w>l
nnoremap <C-c> <esc>
nnoremap <SPACE> <C-w>
nnoremap <SPACE>v <C-w>v
nnoremap <SPACE>s <C-w>s
nnoremap <SPACE>h <C-w>h
nnoremap <SPACE>j <C-w>j
nnoremap <SPACE>k <C-w>k
nnoremap <SPACE>l <C-w>l
nnoremap <SPACE>c <C-w>c

" save with space space
nnoremap <space><space> :wa<cr>:w<cr>

" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <M-h> <C-w><
map <silent> <M-j> <C-W>-
map <silent> <M-k> <C-W>+
map <silent> <M-l> <C-w>>

"set ai           " always set autoindenting on

set backup       " keep a backup file
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
if version >= 703
  set undofile
  set undodir=~/.vim/undo//
endif

set history=50    " keep 50 lines of command line history
set ruler         " show the cursor position all the time
set laststatus=2

set title " terminal title
set autoread " load change files

" Clears the search register
nmap <silent> <leader>/ :nohlsearch<CR>

" select last pasted
nnoremap gp `[v`]

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>q gqip

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" vertical window split
noremap <leader>v <C-w>v

" horizontal window split
noremap <leader>s <C-w>s

" Edit the vimrc file
"nmap <silent> <leader>ev :e $MYVIMRC<CR>
"nmap <silent> <leader>sv :so $MYVIMRC<CR>

nmap <silent> <leader>h :set invlist<CR>
"nmap <silent> <leader>l :set invnumber<CR>
nmap <silent> <leader>p :set invpaste<CR>

" Open last buffer: http://www.vimbits.com/bits/22
noremap <Leader><Leader> <C-^>

" Under/Over line current line
" http://www.vimbits.com/bits/12
nnoremap <leader>== yyPv$r=jyypv$r=
nnoremap <leader>** yyPv$r*jyypv$r*
nnoremap <leader>=  yypv$r=
nnoremap <leader>-  yypv$r-

:nnoremap <Space> za
set splitright
set splitbelow

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>; :call NumberToggle()<cr>
"}}}

" GUI Settings {{{
set guioptions-=R
set guioptions-=r
set guioptions-=L
set guioptions-=l
set guifont=Source\ Code\ Pro:h13
"}}}

" Syntax Highlighting, linting, and File Types {{{
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino
autocmd! BufNewFile,BufRead *.pp setlocal ft=puppet
autocmd! BufNewFile,BufRead *.md setlocal ft=markdown
"}}}

" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5

let g:syntastic_javascript_flow_exe = 'flow check-contents'

let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_javascript_checkers = ['eslint', 'flow']
let g:syntastic_ruby_checkers = ['rsense', 'rubocop']
let g:syntastic_python_checkers = ['pyflakes']
"}}}

" Use deoplete. {{{
" use tab for complete and scrolling
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1 "Use the current file for relative path
let g:python3_host_prog = '/Users/jsral/.pyenv/shims/python'
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
"}}}

" For Love2d {{{
" launch with leader + l
nnoremap <Leader>l :!/Applications/love.app/Contents/MacOS/love .<CR>
"}}}

" Typescript Config {{{
autocmd FileType typescript nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>
autocmd FileType typescript nmap <buffer> <Leader>R <Plug>(TsuquyomiRenameSymbol)
"}}}

" Emmet-vim {{{
let g:user_emmet_leader_key='<C-Z>'
"}}}

" Line splitting for brackets in insert mode [] () {}"{{{
imap <C-l> <CR><Esc>O
"}}}

" Hybrid Line Numbers {{{
set relativenumber
set number
" }}}

" Spell Checking {{{
autocmd Filetype gitcommit setlocal spell
autocmd Filetype markdown setlocal spell
"}}}

" Folding {{{
set foldmethod=marker

" http://vim.wikia.com/wiki/Use_folds_in_your_program
" augroup vimrc
"   au BufReadPre * setlocal foldmethod=indent
"   au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
" augroup END

"Fold Tag
"http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap <leader>ft Vatzf
"}}}

" Ctrl-P plugin {{{
map <leader>t :CtrlP<CR>
let g:ctrlp_custom_ignore = 'vendor/bundle'
let g:ctrlp_working_path_mode = 'ra'
" }}}

" NERD Tree {{{
" Put focus to the NERD Tree with F3 (tricked by quickly closing it and
" immediately showing it again, since there is no :NERDTreeFocus command)
nmap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
nmap <leader>n :NERDTreeToggle<CR>

" Store the bookmarks file
"let NERDTreeBookmarksFile=expand("$HOME/.vim/tmp/NERDTreeBookmarks")

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" Quit on opening files from the tree
" let NERDTreeQuitOnOpen=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

" Use a single click to fold/unfold directories and a double click to open
" files
let NERDTreeMouseMode=2

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.swp$','\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$', '\.DS_Store$', '^\.bundle$', '\.keep$']

" Quit vim if nerdtree is last buffer
" https://github.com/scrooloose/nerdtree/issues/21
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"let g:NERDTreeWinPos = "right"
"}}}

" Undotree {{{
nnoremap <leader>u :UndotreeToggle<cr>
" }}}

" Tabular {{{
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a{ :Tabularize /{<CR>
vmap <Leader>a{ :Tabularize /{<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,\zs<CR>
vmap <Leader>a, :Tabularize /,\zs<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>
nmap <Leader>a\| :Tabularize /\|<CR>
vmap <Leader>a\| :Tabularize /\|<CR>
" }}}

" Fugitive {{{
noremap <leader>gs :Gstatus<cr>
noremap <leader>gc :Gcommit<cr>
noremap <leader>ga :Gwrite<cr>
noremap <leader>gl :Glog<cr>
noremap <leader>gd :Gdiff<cr>
"}}}

" Git Gutter {{{
" Make git gutter background clear
highlight clear SignColumn
autocmd ColorScheme * highlight clear SignColumn
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
"}}}

" {{{ markdown
let g:markdown_fenced_languages=['ruby','erb=eruby','javascript','html','sh']
"}}}

" {{{ yankring
let g:yankring_history_dir = '$HOME/yankring_history'
"}}}

" RSpec Stuff {{{
autocmd FileType ruby
  \ if expand("%") =~# '_spec\.rb$' |
  \   compiler rspec | setl makeprg=spring\ rspec\ $*|
  \ else |
  \   compiler ruby | setl makeprg=ruby\ -wc\ \"%:p\" |
  \ endif

" http://blog.santosvelasco.com/2012/07/04/vim-and-rspec-run-the-test-under-the-cursor/
" function! RSpecFile()
"   "execute("!clear && rspec " . expand("%p"))
"   execute("!rspec " . expand("%p"))
" endfunction
" map <leader>R :call RSpecFile() <CR>
" command! RSpecFile call RSpecFile()

" function! RSpecCurrent()
" "  execute("!clear && rspec " . expand("%p") . ":" . line("."))
"   execute("!rspec " . expand("%p") . ":" . line("."))
" endfunction
" map <leader>r :call RSpecCurrent() <CR>
" command! RSpecCurrent call RSpecCurrent()

" function! RSpecParse()
"   execute("Make " . expand("%") . ":" . line("."))
" endfunction
" map <leader>e :call RSpecParse() <CR>
" command! RSpecParse call RSpecParse()

" vim-ruby is required for this to work. Probably because
" of older version of vim on work machine.
"Plugin 'vim-ruby/vim-ruby'

"let g:rspec_command = "!spring rspec {spec}"

" map <Leader>r :call RunCurrentSpecFile()<CR>
" map <Leader>e :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>
