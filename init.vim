set nocompatible
set noswapfile
set ttimeout
set ttimeoutlen=0
set matchtime=0
set encoding=UTF-8
if (has('termguicolors'))
    set termguicolors
endif
set t_Co=256

set path+=**

" For Vim-Plug {{{
filetype off
call plug#begin()

Plug 'altercation/vim-colors-solarized'
Plug 'icymind/NeoSolarized'
Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-one'
Plug 'rakr/vim-two-firewatch'
Plug 'jacoborus/tender.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-vinegar'
" Plug 'HiPhish/repl.nvim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'sheerun/vim-polyglot'
Plug 'lvht/phpcd.vim'
Plug 'flazz/vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'leshill/vim-json'
Plug 'gabesoft/vim-ags'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'tpope/vim-fireplace'
Plug 'racer-rust/vim-racer'
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'Raimondi/delimitMate'
Plug 'prettier/vim-prettier', {
   \ 'do': 'yarn install',
   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'wokalski/autocomplete-flow'
Plug 'davidhalter/jedi-vim'
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go'
"Plug 'clojure-vim/acid.nvim'
" Plug 'jpalardy/vim-slime'
" Plug 'l04m33/vlime', {'rtp': 'vim/'}
" Plug 'tpope/vim-salve'
Plug 'kovisoft/slimv'
Plug 'jgdavey/tslime.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'carlitux/deoplete-ternjs'
Plug 'tweekmonster/deoplete-clang2'
Plug 'fishbullet/deoplete-ruby'
Plug 'rhysd/vim-crystal'
Plug 'w0rp/ale'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline-themes'
Plug 'chase/vim-ansible-yaml'
Plug 'thoughtbot/vim-rspec'
" Plug 'pangloss/vim-javascript'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'othree/html5.vim'
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
" Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/tsuquyomi'
Plug 'tbastos/vim-lua'
Plug 'janko-m/vim-test'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'flowtype/vim-flow', {
            \ 'autoload': {
            \     'filetypes': 'javascript'
            \ }}
Plug 'tpope/vim-dispatch'
Plug 'danro/rename.vim'
call plug#end()            " required
filetype plugin indent on    " required
" }}}

" Set Color Scheme {{{
" Silent prevents vim from complaining during initial setup when scheme is not
" available.
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
silent! colorscheme NeoSolarized
" silent! colorscheme gruvbox

let g:ayucolor = "mirage"

let g:hybrid_reduced_contrast=1
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="hard"

call togglebg#map("<F5>")
" }}}

" Vim Settings {{{
set colorcolumn=80
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set ttyfast
set wildmenu
" set wildmode=list:longest,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.tmp/*,*/.sass-cache/*,*/node_modules/*,*.keep,*.DS_Store,*/.git/*,*/__pychache__/*

set mouse=a

" Don't use a line cursor in insert mode
set guicursor=

" # http://superuser.com/questions/549930/cant-resize-vim-splits-inside-tmux
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" Map ESC
let mapleader = " "              " The default leader key isn't very intuitive.

set number
set showmatch                   " matching brace/parenthesis/etc.
set hidden                      " http://nvie.com/posts/how-i-boosted-my-vim/

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is four spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

" Vertical split to right
set splitright

" Horizontal split below
set splitbelow

" Use the OS clipboard by default
set clipboard=unnamed

set cursorline
" Indicators
"set list                          " Show hidden characters (tab and eol)
"set listchars=trail:⋅,nbsp:⋅,tab:▸\ ,eol:¬       " Use the same chars as textmate.
"set listchars=trail:⋅,nbsp:⋅,tab:❯
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

" Maps Alt-[H,J,K,L] to resizing a window split
map <silent> <M-H> <C-w><
map <silent> <M-J> <C-W>-
map <silent> <M-K> <C-W>+
map <silent> <M-L> <C-w>>
" For navigating even in Nvim terminal
tnoremap <M-h> <C-\><C-N><C-w>h
tnoremap <M-j> <C-\><C-N><C-w>j
tnoremap <M-k> <C-\><C-N><C-w>k
tnoremap <M-l> <C-\><C-N><C-w>l

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
nnoremap <leader>q gqip

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" vertical window split
noremap <leader>v <C-w>v

" horizontal window split
noremap <leader>s <C-w>s

" Edit the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Save by pressing Enter in normal mode
nnoremap <cr> :w<cr>
"}}}

"{{{ Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1 "Use the current file for relative path
let g:python_host_prog = '/Users/jsral/.pyenv/shims/python'
" let g:python3_host_prog = '/Users/jsral/.pyenv/shims/python3.6'

" let g:deoplete#disable_auto_complete = 1
" inoremap <expr> <C-n>  deoplete#mappings#manual_complete()

" deoplete tab-complete
" inoremap <silent><expr><tab> pumvisible() ? \"\<c-n>" : \"\<tab>"

let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" wait for at least 3 input characters
let g:deoplete#source#attribute#min_pattern_length = 3
" wait longer to start getting completions
let g:deoplete#auto_complete_delay = 100
" tern
let g:deoplete#sources#ternjs#tern_bin = '/Users/jamessral/.nvm/versions/v8.5.0/bin'
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'js',
                \ 'vue']
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
"}}}

"{{{ Vim Polyglot
" Disable javscript in favor of other plugins for js/jsx
" let g:polyglot_disabled = ['javascript', 'jsx']
"}}}

"{{{ Snippets
" Note: It must be \"imap" and \"smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#snippets_directory='~/.config/nvim/plugged/neosnippet-snippets/neosnippets'
"}}}

"{{{ Fzf
nnoremap <C-p> :Files<CR>
nnoremap <C-M-b> :Buffers<CR>
nnoremap <leader>r :Tags<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
"}}}

"{{{ Airline
" let g:airline_theme='minimalist'
let g:airline_theme='solarized'
let g:airline_left_sep=''
let g:airline_left_alt_sep = ''
let g:airline_right_sep=''
let g:airline_right_alt_sep = ''
" keep branch name lenghts under control
let g:airline#extensions#branch#displayed_head_limit = 10
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
"}}}

"{{{ Easymotion

"}}}

"{{{ Multiple Cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_key='gb'
let g:multi_cursor_next_key='<C-f>'
let g:multi_cursor_prev_key='<C-b>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
"}}}

" Syntax Highlighting and File Types {{{
autocmd! FileType lua setlocal tabstop=4 shiftwidth=4
autocmd! FileType ruby setlocal tabstop=2 shiftwidth=2
autocmd! FileType crystal setlocal tabstop=2 shiftwidth=2
autocmd! FileType javascript setlocal tabstop=2 shiftwidth=2
autocmd! FileType typescript setlocal tabstop=2 shiftwidth=2
autocmd! FileType c setlocal tabstop=8 shiftwidth=8 noexpandtab
autocmd! FileType c++ setlocal tabstop=8 shiftwidth=8 noexpandtab
autocmd! BufNewFile,BufRead *.html.erb setlocal tabstop=2 shiftwidth=2
autocmd! BufNewFile,BufRead *.html setlocal tabstop=2 shiftwidth=2
autocmd! BufNewFile,BufRead *.jsx setlocal tabstop=2 shiftwidth=2
autocmd! BufNewFile,BufRead *.tsx setlocal tabstop=2 shiftwidth=2
autocmd! BufNewFile,BufRead *.hx setlocal tabstop=4 shiftwidth=4 syntax=haxe
autocmd! BufNewFile,BufRead *.css setlocal tabstop=2 shiftwidth=2
autocmd! BufNewFile,BufRead *.scss setlocal tabstop=2 shiftwidth=2
autocmd! BufNewFile,BufRead *.purs setlocal syntax=purescript
autocmd! BufNewFile,BufRead *.ex setlocal tabstop=2 shiftwidth=2
" Use JSX for .js
let g:jsx_ext_required = 0
"}}}

"{{{ Ale Linting
" Always keep gutter open to avoid flickering
" Add more of a delay so as to not slow down so much
let g:ale_lint_delay = 300
let g:ale_sign_column_always = 1
let g:ale_set_quickfix = 1
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
\  'javascript': ['eslint', 'flow'],
\}
"}}}

"{{{ Prettier
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.vue PrettierAsync
nnoremap <leader>F :PrettierAsync<cr>
"}}}

"{{{ Flow
"nnoremap <silent> <leader>d :FlowJumpToDef
let g:flow#showquickfix = 0
let g:flow#enable = 0
let g:autocomplete_flow#insert_paren_after_function = 0
" nnoremap <leader><leader>t :FlowType<CR>
"}}}

"{{{ Python
let g:jedi#usages_command = '<leader>i'
"}}}

"{{{ Testing Functions
" Make a new jest test base on the current filename
function! MakeJestTest()
    execute " vs | e " . expand('%:r') . '.test.js'
endfunction
nnoremap <leader>ct :call MakeJestTest()<cr>
"}}}

"{{{ Test Runner
nnoremap <silent><leader><leader>t :TestNearest<CR>
nnoremap <silent><leader><leader>T :TestFile<CR>
nnoremap <silent><leader><leader>A :TestSuite<CR>
nnoremap <silent><leader><leader>L :TestLast<CR>
nnoremap <silent><leader><leader>G :TestVisit<CR>

let test#strategy = "neovim"
let g:test#preserve_screen = 1
let test#javascript#jest#executable = 'yarn test'
let test#javascript#jest#file_pattern = '[**.jest.js | **.test.js]'
"}}}

"{{{  Tslime (For REPLs)
vmap \t <Plug>SendSelectionToTmux
nmap \t <Plug>NormalModeSendToTmux
nmap \T <Plug>SetTmuxVars
"}}}

"{{{ Clojure & Racket
autocmd FileType clojure let b:delimitMate_quotes = "\""
autocmd FileType racket let b:delimitMate_quotes = "\""
"}}}

"{{{ C/C++
let g:deoplete#sources#clang#std = {
    \'c': 'c11',
    \'cpp': 'c++14',
    \'objc': 'c11',
    \'objcpp': 'c++14',
\}
"}}}

"{{{ Common Lisp
" let g:slime_target = \"neovim"
" open split vertically to right
autocmd FileType lisp let b:delimitMate_quotes = "\""
let g:slimv_repl_split = 4
let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \"sbcl --load ~/.config/nvim/plugged/slimv/slime/start-swank.lisp\""'
"}}}

"{{{ Rust
let g:ale_linters = {'rust': ['rls']}
let g:ale_rust_rls_toolchain = 'stable'
"}}}

"{{{ LanaguageClient
let g:LanguageClient_serverCommands = {
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ }
"}}}

" Typescript Config {{{
" autocmd FileType typescript nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>
" autocmd FileType typescript nmap <buffer> <Leader>R <Plug>(TsuquyomiRenameSymbol)
"}}}

" Line splitting for brackets in insert mode [] () {}"{{{
imap <C-l> <CR><Esc>O
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

"Fold Tag
"http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap <leader>ft Vatzf
"}}}

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
let g:markdown_fenced_languages=['ruby','erb=eruby','javascript','sh']
"}}}
