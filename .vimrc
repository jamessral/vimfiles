set nocompatible                " choose no compatibility with legacy vi
set noswapfile
set ttimeout
set ttimeoutlen=0
set matchtime=0

set path+=**

" For Vim-Plug {{{
filetype off
call plug#begin()
" All of your Plugins must be added before the following line
Plug 'altercation/vim-colors-solarized'
Plug 'w0ng/vim-hybrid'
Plug 'flazz/vim-colorschemes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'gabesoft/vim-ags'
"Plug 'vim-scripts/YankRing.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
"Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'vim-scripts/peaksea'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chase/vim-ansible-yaml'
Plug 'othree/yajs.vim'
Plug 'shawncplus/phpcomplete.vim'
Plug 'tbastos/vim-lua'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'janko-m/vim-test'
Plug 'jdonaldson/vaxe'
Plug 'flowtype/vim-flow', {
            \ 'autoload': {
            \     'filetypes': 'javascript'
            \ }}
Plug 'artur-shaik/vim-javacomplete2'
Plug 'OmniSharp/omnisharp-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-dispatch'
Plug 'danro/rename.vim'
Plug 'fatih/vim-go'
Plug 'ElmCast/elm-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'rust-lang/rust.vim'

call plug#end()            " required
filetype plugin indent on    " required
" }}}

" Set Color Scheme {{{
" Silent prevents vim from complaining during initial setup when scheme is not
" available.
" silent! colorscheme solarized
colorscheme Monokai
let g:gruvbox_contrast_dark="medium"
let g:gruvbox_contrast_light="hard"
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
"color ir_black
"colorscheme Tomorrow-Night-Bright
set background=dark
call togglebg#map("<F5>")
" }}}

"{{{ Airline & Devicons
let g:airline_theme='hybrid'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
"let g:webdevicons_enable_nerdtree = 1
"let g:webdevicons_enable_airline_tabline = 1
"let g:webdevicons_enable_airline_statusline = 1
"let g:webdevicons_enable_ctrlp = 1
"let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
"}}}

" Vim Settings {{{
set colorcolumn=80
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set ttyfast
set wildmenu
set mouse=a
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.tmp/*,*/.sass-cache/*,*/node_modules/*,*.keep,*.DS_Store,*/.git/*

" # http://superuser.com/questions/549930/cant-resize-vim-splits-inside-tmux
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

set term=screen-256color

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

set cursorline
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

inoremap jk <Esc>
xnoremap jk <Esc>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <M-h> <C-w><
map <silent> <M-j> <C-W>-
map <silent> <M-k> <C-W>+
map <silent> <M-l> <C-w>>
map <silent> <Space>< <C-w><
map <silent> <Space>- <C-W>-
map <silent> <Space>+ <C-W>+
map <silent> <Space>> <C-w>>


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
"}}}

"{{{ Goyo (Distraction Free)
let g:goyo_width=120

nnoremap <leader>z :Goyo<CR>
"}}}

"{{{ Easymotion

"}}}

"{{{ Ale Linting
" Always keep gutter open to avoid flickering
" Add more of a delay so as to not slow down so much
let g:ale_lint_delay = 500
let g:ale_sign_column_always = 1
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}
let g:ale_linters = {
\  'javscript': ['eslint'],
\}
"}}}

" Emmet-vim {{{
let g:user_emmet_leader_key='<C-Z>'
"}}}

" GUI Settings {{{
set guifont=FuraCode\ Nerd\ Font:h13
set guioptions-=l guioptions-=L guioptions-=r guioptions-=T guioptions-=R guioptions-=m
" }}}

" Syntax Highlighting and File Types {{{
autocmd! BufNewFile,BufRead *.java setlocal tabstop=4 shiftwidth=4
autocmd! BufNewFile,BufRead *.hx setlocal tabstop=4 shiftwidth=4
autocmd! BufNewFile,BufRead *.hxml setlocal tabstop=4 shiftwidth=4
autocmd! BufNewFile,BufRead *.h setlocal tabstop=4 shiftwidth=4
autocmd! BufNewFile,BufRead *.c setlocal tabstop=4 shiftwidth=4
autocmd! BufNewFile,BufRead *.cpp setlocal tabstop=4 shiftwidth=4
autocmd! BufNewFile,BufRead *.hpp setlocal tabstop=4 shiftwidth=4
autocmd! BufNewFile,BufRead *.scss setlocal tabstop=2 shiftwidth=2
autocmd FileType ocaml source /Users/jamessral/.opam/system/share/typerex/ocp-indent/ocp-indent.vim
" Use JSX for .js
let g:jsx_ext_required = 0
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
" find the local version of eslint
" http://blog.pixelastic.com/2015/10/05/use-local-eslint-in-syntastic/
function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction
let g:syntastic_javascript_eslint_exec = StrTrim(system('npm-which eslint'))
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_javascript_checkers = ['eslint', 'flow']
let g:syntastic_ruby_checkers = ['rsense']
let g:syntastic_python_checkers = ['pyflakes']
"}}}

"{{{ Ale Linting
" Always keep gutter open to avoid flickering
" Add more of a delay so as to not slow down so much
let g:ale_lint_delay = 300
let g:ale_sign_column_always = 1
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}
let g:ale_linters = {
\  'javscript': ['eslint'],
\}
"}}}

"{{{ Test Runner
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>A :TestSuite<CR>
nmap <silent> <leader>L :TestLast<CR>
nmap <silent> <leader>G :TestVisit<CR>

let test#strategy = "vimproc"
"}}}

"{{{ Launch Love2d
nnoremap <leader>l :!love .<CR>
"}}}

" Typescript Config {{{
"autocmd FileType typescript nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>
"autocmd FileType typescript nmap <buffer> <Leader>R <Plug>(TsuquyomiRenameSymbol)
"}}}

"{{{ Dlang config
let g:dutyl_stdImportPaths=['/usr/local/include/dlang/dmd']
"}}}

"{{{ Java config
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
nmap <leader>jii <Plug>(JavaComplete-Imports-Add)

imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
imap <C-j>ii <Plug>(JavaComplete-Imports-Add)

nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)

imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)

nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)

imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)
"}}}

" Emmet-vim {{{
let g:user_emmet_leader_key='<C-Z>'
"}}}

" Line splitting for brackets in insert mode [] () {}"{{{
imap <C-l> <CR><Esc>O<Tab>
"}}}

"{{{ Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
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
map <C-p> :CtrlP<CR>
let g:ctrlp_custom_ignore = 'vendor/bundle'
let g:ctrlp_working_path_mode = 'ra'
" }}}

"{{{ File Browsing
let g:netrw_banner=0        " no more annoying banner!
let g:netrw_browse_split=4  " open in previous window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
"}}}

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
            \ '\.o$', '\.so$', '\.egg$', '^\.git$', '\.DS_Store$', '^\.bundle$',
            \ 'node_modules', '\.keep$']

" Quit vim if nerdtree is last buffer
" https://github.com/scrooloose/nerdtree/issues/21
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"let g:NERDTreeWinPos = "right"
"}}}

" Undotree {{{
nnoremap <leader>u :UndotreeToggle<cr>
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
let g:yankring_history_dir = '~/yankring_history'
"}}}
