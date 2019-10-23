set nocompatible
set noswapfile
set ttimeout
set ttimeoutlen=0
set matchtime=0
set encoding=UTF-8
set ttyfast
if (has('termguicolors'))
  set termguicolors
endif
set t_Co=256

set path+=**

" For Vim-Plug
filetype off
call plug#begin()

Plug 'altercation/vim-colors-solarized'
Plug 'rakr/vim-one'
" Plug 'rainglow/vim'
Plug 'chriskempson/base16-vim'
Plug 'icymind/NeoSolarized'
Plug 'trevordmiller/nova-vim'
Plug 'liuchengxu/space-vim-theme'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-salve'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'tpope/vim-rails'
Plug 'jpalardy/vim-slime'
Plug 'Tetralux/odin.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug 'chrisbra/Colorizer'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'takkii/Bignyanco'
Plug 'takkii/ruby-dictionary3'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'calviken/vim-gdscript3'
Plug 'peitalin/vim-jsx-typescript'
Plug 'roxma/nvim-yarp'
Plug 'leshill/vim-json'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'rbgrouleff/bclose.vim'
Plug 'easymotion/vim-easymotion'
Plug 'Raimondi/delimitMate'
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
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
call plug#end()            " required
" filetype plugin indent on    " required

" Set Color Scheme
let t:current_theme = 'light'
let t:is_transparent = 0
function! Transparent()
  hi Normal guibg=NONE ctermbg=NONE
endfunction
function! ToggleTransparent()
  if t:is_transparent == 0
    call Transparent()
    let t:is_transparent = 1
  else
    if t:current_theme == 'light'
      set background=light
    else
      set background=dark
    end

    let t:is_transparent = 0
  endif
endfunction

nnoremap <F6> :call ToggleTransparent()<cr>

function! SwitchTheme()
  if t:current_theme == 'dark'
    set background=light
    let t:current_theme = 'light'
    :colorscheme NeoSolarized
    :AirlineTheme solarized
  else
    set background=dark
    let t:current_theme = 'dark'
    :colorscheme NeoSolarized
    :AirlineTheme solarized
    " :call Transparent()
    " let t:is_transparent=1
  end
endfunction

nnoremap <F5> :call SwitchTheme()<cr>

" Silent prevents vim from complaining during initial setup when scheme is not
" available.
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=light
:colorscheme NeoSolarized

let g:hybrid_reduced_contrast = 0
let g:material_terminal_italics = 1

let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="hard"

" Vim Settings
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
" set guicursor=

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
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

" GUI Settings
set guifont=Literation\ Nerd\ Font\ 11
set guioptions-=l
set guioptions-=r
set guioptions-=T
set guioptions-=R
set guioptions-=m
set guioptions-=L
set linespace=5
" fullscreen
map <silent> <F11>
\    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
"

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is four spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
" let g:indentguides_spacechar = '┆'
" let g:indentguides_tabchar = '|'

" Vertical split to right
set splitright

" Horizontal split below
set splitbelow

" Use the OS clipboard by default
set clipboard=unnamedplus

set nocursorline
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
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <BS> <c-w>h
nnoremap <C-l> <c-w>l
nnoremap <leader>T :tabe<cr>

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

let g:current_mode = {
    \ 'n'      : 'NORMAL ',
    \ 'no'     : 'N·Operator Pending ',
    \ 'v'      : 'VISAUL ',
    \ 'V'      : 'V-Line ',
    \ '\<C-V>' : 'V-Block ',
    \ 's'      : 'SELECT ',
    \ 'S'      : 'S-Line ',
    \ '\<C-S>' : 'S-BLOCK ',
    \ 'i'      : 'INSERT ',
    \ 'R'      : 'REPLACE ',
    \ 'Rv'     : 'V-REPLACE ',
    \ 'c'      : 'COMMAND ',
    \ 'cv'     : 'VIM EX ',
    \ 'ce'     : 'EX ',
    \ 'r'      : 'PROMPT ',
    \ 'rm'     : 'MORE ',
    \ 'r?'     : 'CONFIRM ',
    \ '!'      : 'SHELL ',
    \ 't'      : 'TERMINAL '
\}

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
nnoremap <silent> <leader>rv :so $MYVIMRC<CR>

" Save by pressing Enter in normal mode
nnoremap <cr> :w<cr>

" See live preview of subsitute command
" set incsubstitue=nosplit

" Random Number
function! Rand()
  let @n = substitute(system('random'),'\n', '', 'g')
  call append(line('.'), @n)
  normal! Jx
endfunction

" Repl
let g:slime_target="tmux"

" Deoplete
" let g:deoplete#enable_at_startup = 1
"
" CoC
" Starting config lifted from [here](https://github.com/neoclide/coc.nvim)
set updatetime=300
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

set shortmess+=c
set completeopt=noinsert,menuone,noselect
let g:python_host_prog=expand('$HOME/.pyenv/versions/2.7.14/bin/python')
let g:python3_host_prog=expand('$HOME/.pyenv/versions/3.7.4/bin/python')
" CSS
" " Nerd commenter
let g:NERDCompactSexyComs = 0

" UltiSnips
" c-j c-k for moving in snippet
let g:UltiSnipsExpandTrigger		= "<c-j>"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" Snippets
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/plugged/vim-snippets/UltiSnips', 'UltiSnips']

" Fzf
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
" nnoremap <leader>r :Tags<CR>
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" Syntax Highlighting and File Types
autocmd! FileType lua setlocal tabstop=4 shiftwidth=4
autocmd! FileType ruby setlocal tabstop=2 shiftwidth=2
autocmd! FileType javascript setlocal tabstop=2 shiftwidth=2
autocmd! FileType javascript.jsx setlocal tabstop=2 shiftwidth=2
autocmd! FileType json setlocal tabstop=2 shiftwidth=2
autocmd! FileType yaml setlocal tabstop=2 shiftwidth=2
autocmd! FileType typescript setlocal tabstop=2 shiftwidth=2 shiftwidth=2 syntax=typescript.jsx
autocmd! FileType typescript.tsx setlocal tabstop=2 shiftwidth=2 shiftwidth=2 syntax=typescript.jsx
autocmd! FileType c setlocal tabstop=8 shiftwidth=8 noexpandtab
autocmd! FileType cpp setlocal tabstop=8 shiftwidth=8 noexpandtab
autocmd! FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab
autocmd! FileType rust setlocal tabstop=4 shiftwidth=4
autocmd! FileType elm setlocal tabstop=4 shiftwidth=4
autocmd! BufRead,BufNewFile,BufEnter vue syntax sync fromstart
let g:vue_disable_pre_processors=1
autocmd! BufNewFile,BufRead,CursorHold *.html.erb setlocal tabstop=2 shiftwidth=2
autocmd! BufNewFile,BufRead *.html setlocal tabstop=2 shiftwidth=2
autocmd! BufNewFile,BufRead *.jsx setlocal tabstop=2 shiftwidth=2
autocmd! BufNewFile,BufRead *.cpp setlocal tabstop=8 shiftwidth=8
autocmd! BufNewFile,BufRead *.c setlocal tabstop=8 shiftwidth=8
autocmd! BufNewFile,BufRead *.rs setlocal tabstop=4 shiftwidth=4
autocmd! BufNewFile,BufRead *.elm setlocal tabstop=4 shiftwidth=4
autocmd! BufNewFile,BufRead *.tsx setlocal tabstop=2 shiftwidth=2 syntax=typescript.jsx filetype=typescript.tsx
autocmd! BufNewFile,BufRead *.vue setf vue
autocmd! BufNewFile,BufRead *.vue setlocal tabstop=2 shiftwidth=2 syntax=vue.html.javascript.css
autocmd! BufNewFile,BufRead *.css setlocal tabstop=2 shiftwidth=2
autocmd! BufNewFile,BufRead *.scss setlocal tabstop=2 shiftwidth=2
autocmd! BufNewFile,BufRead *.ex setlocal tabstop=2 shiftwidth=2
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
let g:ale_typescript_tslint_executable = 'tslint --project tsconfig.json'
let g:ale_typescript_tslint_config_path = 'tslint.json'

let g:ale_linters = {
      \  'javascript': ['eslint'],
      \  'typescript': ['tsc', 'tslint', 'eslint']
      \}

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['eslint'],
      \   'typescript': ['tslint', 'eslint'],
      \   'ruby': ['rubocop']
      \}

" set laststatus=2
" set statusline=
" set statusline+=\ " Some space
" set statusline+=%{g:current_mode[mode()]}        " Path to the file
" set statusline+=\ " Some space
" set statusline+=%f         " Path to the file
" set statusline+=\ " Some space
" set statusline+=%{GitInfo()}
" set statusline+=\ " Separator
" set statusline+=%=%y        " Filetype of the file
" set statusline+=\ " Separator
" set statusline+=%{LinterStatus()}
" set statusline+=\ " Some space
" set statusline+=\ " Some space
" Airline
let g:airline_theme='solarized'
let g:airline_left_sep=''
let g:airline_left_alt_sep = ''
let g:airline_right_sep=''
let g:airline_right_alt_sep = ''
" keep branch name lenghts under control
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1

" Prettier
let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.vue PrettierAsync
nnoremap <leader>F :PrettierAsync<cr>

" Python
" autocmd BufWritePre *.py execute ':Black'

" Courtesy of Jeremy!
:set wildcharm=<C-z>
" open current test file's source in split
:nnoremap <leader>os :vs %<C-z><c-f>bbdb.<cr>

" open current file's test in split
:nnoremap <leader>ot :vs %<C-z><c-f>bitest.<cr>

" Test Runner
nnoremap <silent><leader><leader>t :TestNearest<CR>
nnoremap <silent><leader><leader>T :TestFile<CR>
nnoremap <silent><leader><leader>A :TestSuite<CR>
nnoremap <silent><leader><leader>L :TestLast<CR>
nnoremap <silent><leader><leader>G :TestVisit<CR>

let test#strategy = "vimproc"
let g:test#preserve_screen = 1
let test#javascript#jest#executable = 'yarn test'
let test#javascript#jest#file_pattern = '[**.jest.js | **.test.js]'
let test#typescript#jest#file_pattern = '[**.jest.ts | **.test.ts]'

" Typescript Config
let g:polyglot_disable=['typescript', 'typescript.tsx', 'javscript', 'javascript.jsx']

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Hybrid Line Numbers
set relativenumber
set number
function! ToggleLines()
  set norelativenumber!
  set nonumber!
endfunction
nnoremap <F2> :call ToggleLines()<cr>

" Spell Checking
autocmd Filetype gitcommit setlocal spell
autocmd Filetype markdown setlocal spell

" Folding
set foldmethod=marker

" File Browsing
let g:netrw_banner=0        " no more annoying banner!
let g:netrw_browse_split=4  " open in previous window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_fastbrowse=0
autocmd FileType netrw setl bufhidden=delete
autocmd FileType netrw setl bufhidden=wipe

" NERD Tree
" Put focus to the NERD Tree with F3 (tricked by quickly closing it and
" immediately showing it again, since there is no :NERDTreeFocus command)
nmap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
nmap <leader>n :NERDTreeToggle<CR>

let g:NERDTreeWinSize=40

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

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

" Fugitive
noremap <leader>gs :Gstatus<cr>
noremap <leader>gc :Gcommit<cr>
noremap <leader>ga :Gwrite<cr>
noremap <leader>gd :Gdiff<cr>

" Git Gutter
" Make git gutter background clear
highlight clear SignColumn
autocmd ColorScheme * highlight clear SignColumn
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

"  markdown
let g:markdown_fenced_languages=['ruby','erb=eruby','javascript','sh']

" :call ToggleTransparent()
