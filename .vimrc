set nocompatible
set noswapfile
set nomodeline
set ttimeout
set ttimeoutlen=0
set matchtime=0
set encoding=UTF-8
set ttyfast
if (has('termguicolors'))
  set termguicolors
else
  set t_Co=256
endif

set path+=**

" For Vim-Plug
filetype off
call plug#begin()

Plug 'flazz/vim-colorschemes'
Plug 'jamessral/naysayer-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'lepture/vim-jinja'
Plug 'cocopon/vaffle.vim'
Plug 'jpalardy/vim-slime'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rbgrouleff/bclose.vim'
Plug 'ap/vim-css-color'
Plug 'kburdett/vim-nuuid'
Plug 'Tetralux/odin.vim'
Plug 'calviken/vim-gdscript3'
Plug 'machakann/vim-highlightedyank'
Plug 'bounceme/dim-jump'
Plug 'vim-scripts/utl.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rails'
Plug 'junegunn/goyo.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'artyommironov/vim-android-sensible'
Plug 'vimwiki/vimwiki'
Plug 'lervag/vimtex'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'roxma/nvim-yarp'
Plug 'leshill/vim-json'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'Raimondi/delimitMate'
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'html'] }
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tbastos/vim-lua'
Plug 'janko-m/vim-test'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'tpope/vim-dispatch'
Plug 'danro/rename.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()            " required
filetype plugin indent on    " required
filetype plugin on

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'

" Themes
function! LoadDark()
  let t:current_theme = 'dark'
  colorscheme badwolf
  let g:airline_theme="transparent"
  set background=dark
  " highlight Pmenu ctermbg=DarkCyan guibg=DarkCyan
  " highlight Comment cterm=italic gui=italic
endfunction

function! LoadLight()
  let t:current_theme = 'light'
  let g:airline_theme="transparent"
  colorscheme summerfruit256
  set background=light
  " highlight Pmenu ctermbg=DarkCyan guibg=DarkCyan
  " highlight Comment cterm=italic gui=italic
endfunction

" Set Color Scheme
let t:current_theme = 'light'
function! SwitchTheme()
  if t:current_theme == 'light'
    :call LoadDark()
  elseif t:current_theme == 'dark'
    :call LoadLight()
  endif
endfunction

nnoremap <silent> <F5> :call SwitchTheme()<cr>

" Silent prevents vim from complaining during initial setup when scheme is not
" available.
let $NVIM_TUI_ENABLE_TRUE_COLOR=2

:call LoadLight()

" Vim Settings
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set cmdheight=1
set ttyfast
set wildmenu
" set wildmode=list:longest,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.tmp/*,*/.sass-cache/*,*/node_modules/*,*.keep,*.DS_Store,*/.git/*,*/__pychache__/*

set mouse=a

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
" # http://superuser.com/questions/549930/cant-resize-vim-splits-inside-tmux
if &term =~ '^screen'
  " tmux knows the extended mouse mode
  set ttymouse=xterm2
endif

" Map ESC
let mapleader = " "              " The default leader key isn't very intuitive.

" set number
set showmatch                   " matching brace/parenthesis/etc.
set hidden                      " http://nvie.com/posts/how-i-boosted-my-vim/

" GUI Settings
set guifont=Source\ Code\ Pro\ 11
set guioptions-=l
set guioptions-=r
set guioptions-=T
set guioptions-=R
set guioptions-=m
set guioptions-=L
set linespace=9
" fullscreen
map <silent> <F11>
\    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is four spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

" Vertical split to right
set splitright

" Horizontal split below
set splitbelow

" Use the OS clipboard by default
set clipboard^=unnamed

set cursorline
set showbreak=↪\

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

inoremap jk <Esc>
xnoremap jk <Esc>
" easier navigation between split windows
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <BS> <c-w>h
nnoremap <C-l> <c-w>l
nnoremap <leader>T :tabe<cr>

" For navigating even in Nvim terminal
tnoremap <M-h> <C-\><C-N><C-w>h
tnoremap <M-j> <C-\><C-N><C-w>j
tnoremap <M-k> <C-\><C-N><C-w>k
tnoremap <M-l> <C-\><C-N><C-w>l

" Notes a la Casey Muratori
function! PrintNote()
  :normal! iNOTE(jsral):
  :Commentary
  :normal! F:
  :startinsert!
endfunction

function! PrintTodo()
  :normal! iTODO(jsral):
  :Commentary
  :normal! F:
  :startinsert!
endfunction

function! CleanBuffers()
  :BufOnly
  :bd
endfunction

inoremap <C-i><C-n> <ESC>:call PrintNote()<cr>
nnoremap <leader>in <ESC>:call PrintNote()<cr>
inoremap <C-i><C-t> <ESC>:call PrintTodo()<cr>
nnoremap <leader>it <ESC>:call PrintTodo()<cr>

" Goyo centered layout (Like Zen-mode)
nnoremap <leader>z :Goyo<cr>

" set backup       " keep a backup file
" set backupdir=~/.vim/backup//
set backupcopy=yes
set undofile
set undodir=~/.vim/undo//

set history=50    " keep 50 lines of command line history
set ruler         " show the cursor position all the time

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ''.fugitive#head()
  else
    return ''
endfunction

set title " terminal title
set autoread " load change files

" Clears the search register
nmap <silent> <leader>/ :nohlsearch<CR>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Edit the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>rv :so $MYVIMRC<CR>
" Save by pressing Enter in normal mode
nnoremap <cr> :w<cr>

set shortmess+=c
set completeopt=noinsert,menuone,noselect
let g:python_host_prog=expand('$HOME/.asdf/installs/python/2.7.14/bin/python')
let g:python3_host_prog=expand('$HOME/.asdf/installs/python/3.10.10/bin/python3')

" " Nerd commenter
let g:NERDCompactSexyComs = 0

" UltiSnips
" c-j c-k for moving in snippet
let g:UltiSnipsExpandTrigger		= "<c-j>"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" Dim Jump
nnoremap <leader>dj :DimJumpPos<cr>

" Slime
let g:slime_target = "tmux"

" Snippets
let g:UltiSnipsSnippetDirectories = ['~/.vim/plugged/vim-snippets/UltiSnips', 'UltiSnips']

" Fzf
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>

" Ack/Ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Delete all but the current buffer
command! BufOnly silent! execute "%bd|e#|bd#"

" nnoremap <leader>r :Tags<CR>
let $FZF_DEFAULT_COMMAND = 'ag -l'

" Syntax Highlighting and File Types
autocmd! FileType lua setlocal tabstop=4 shiftwidth=4
autocmd! FileType c setlocal tabstop=4 shiftwidth=4 noexpandtab commentstring=//\ %s
autocmd! FileType cpp setlocal tabstop=4 shiftwidth=4 noexpandtab commentstring=//\ %s
autocmd! BufRead,BufNewFile,BufEnter vue syntax sync fromstart
let g:vue_disable_pre_processors=1
autocmd! BufNewFile,BufRead *.cpp setlocal tabstop=4 shiftwidth=4
autocmd! BufNewFile,BufRead *.c setlocal tabstop=4 shiftwidth=4
autocmd! BufNewFile,BufRead *.js setlocal tabstop=2 shiftwidth=2
autocmd! BufNewFile,BufRead *.jsx setlocal tabstop=2 shiftwidth=2
autocmd! BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd! BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" Use JSX for .js
let g:jsx_ext_required = 0

" Ale Linting
" Always keep gutter open to avoid flickering
set signcolumn=yes
" Add more of a delay so as to not slow down so much
let g:ale_lint_delay = 500
let g:ale_sign_column_always = 1
let g:ale_set_quickfix = 1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0
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
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_typescript_tslint_executable = 'tslint --project tsconfig.json'
let g:ale_typescript_tslint_config_path = 'tslint.json'

let g:ale_linters = {
      \  'ruby': ['rubocop'],
      \  'rspec': ['rubocop'],
      \  'eruby': ['erblint'],
      \  'javascript': ['eslint'],
      \  'javascript.jsx': ['eslint'],
      \  'typescript': ['tsserver', 'tslint', 'eslint'],
      \  'typescriptreact': ['tsserver', 'tslint', 'eslint'],
      \  'cpp': ['null'],
      \  'c': ['null'],
      \  'markdown': ['null'],
      \}

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['eslint', 'prettier'],
      \   'typescript': ['tslint', 'eslint', 'prettier'],
      \   'typescriptreact': ['tslint', 'eslint', 'prettier'],
      \   'ruby': ['rubocop'],
      \   'rspec': ['rubocop']
      \}

" Prettier
let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.vue PrettierAsync
nnoremap <leader>F :PrettierAsync<cr>

" Courtesy of Jeremy!
set wildcharm=<C-z>
" open current test file's source in split
nnoremap <leader>os :vs %<C-z><c-f>bbdb.<cr>

" open current file's test in split
nnoremap <leader>ot :vs %<C-z><c-f>bitest.<cr>

" Test Runner
nnoremap <silent><leader><leader>t :TestNearest<CR>
nnoremap <silent><leader><leader>T :TestFile<CR>
nnoremap <silent><leader><leader>A :TestSuite<CR>
nnoremap <silent><leader><leader>L :TestLast<CR>
nnoremap <silent><leader><leader>G :TestVisit<CR>

let test#strategy = "vimterminal"
let g:test#preserve_screen = 1
let test#javascript#jest#executable = 'yarn test'
let test#javascript#jest#file_pattern = '[**.jest.js | **.test.js]'
let test#typescript#jest#file_pattern = '[**.jest.ts | **.test.ts]'

" Typescript Config
let g:polyglot_disable=['typescript', 'typescript.tsx', 'javscript', 'javascript.jsx']

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Hybrid Line Numbers
" set relativenumber
" set number
function! ToggleLines()
  set norelativenumber!
  set nonumber!
endfunction
nnoremap <F2> :call ToggleLines()<cr>

" Spell Checking
autocmd Filetype gitcommit setlocal spell
autocmd Filetype markdown setlocal spell

" Folding
set foldmethod=expr

" File Browsing
let g:netrw_banner=0        " no more annoying banner!
let g:netrw_browse_split=0
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_fastbrowse=0
let g:netrw_winsize=15
nnoremap - :Vaffle %<cr>

noremap <leader>gs :Git<cr>
noremap <leader>gc :Gcommit<cr>
noremap <leader>ga :Gwrite<cr>
noremap <leader>gd :Gdiff<cr>

" Git Gutter
" Make git gutter background clear
highlight clear SignColumn
autocmd ColorScheme * highlight clear SignColumn
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" CoC
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nmap <silent> K :call <SID>show_documentation()<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction-line)
nmap <leader>av <Plug>(coc-codeaction-selected)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

" Android
let g:android_sdk_path = expand('$ANDROID_SDK_ROOT')

" Goyo
let g:goyo_width = 120
nnoremap <leader>z :Goyo<cr>

"  markdown
let g:markdown_fenced_languages=['ruby','erb=eruby','javascript','sh']

" Vimwiki
let g:vimwiki_folding='expr'

" highlight Pmenu ctermbg=DarkCyan guibg=DarkCyan
" highlight Comment cterm=italic gui=italic
