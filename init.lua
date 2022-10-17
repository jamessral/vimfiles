-- Options
-- vim.opt.nocompatible = true
-- vim.opt.noswapfile = true
-- vim.opt.nomodeline = true
-- vim.opt.ttimeout = true
-- vim.opt.ttimeoutlen = 0
-- vim.opt.matchtime = 0
-- vim.opt.encoding = UTF-8
-- vim.opt.ttyfast = true
-- vim.opt.number = true
vim.opt.path:append('**')
-- display incomplete commands
-- vim.opt.showcmd = true
-- vim.opt.cmdheight = 1
-- vim.opt.ttyfast = true
vim.opt.termguicolors = true
vim.opt.wildmenu = true
vim.opt.wildignore:append('*/tmp/*,*.so,*.swp,*.zip,*/.tmp/*,*/.sass-cache/*,*/node_modules/*,*.keep,*.DS_Store,*/.git/*,*/__pychache__/*')
vim.opt.mouse = 'a'
-- vim.opt.guicursor = 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50'
vim.opt.guicursor = ''
--vim.opt.completeopt = 'noinsert,menunone,noselect'
vim.opt.signcolumn = 'yes'

-- matching brace/parenthesis/etc.
vim.opt.showmatch = true
-- http://nvie.com/posts/how-i-boosted-my-vim/
vim.opt.hidden = true

-- GUI Settings
vim.opt.guifont = 'Liberation Mono:h10'
-- vim.opt.guioptions = vim.opt.guioptions - 'l'
-- vim.opt.guioptions = vim.opt.guioptions - 'r'
-- vim.opt.guioptions = vim.opt.guioptions - 'T'
-- vim.opt.guioptions = vim.opt.guioptions - 'R'
-- vim.opt.guioptions = vim.opt.guioptions - 'm'
-- vim.opt.guioptions = vim.opt.guioptions - 'L'
vim.opt.linespace=3

-- Whitespace
--vim.opt.nowrap = true                     -- don't wrap lines
vim.opt.tabstop=2 
vim.opt.shiftwidth=2      -- a tab is four spaces (or vim.opt.this to 4)
vim.opt.expandtab = true                   -- use spaces, not tabs (optional)
vim.opt.backspace = 'indent,eol,start'  -- backspace through everything in insert mode

-- Vertical split to right
vim.opt.splitright = true

-- Horizontal split below
vim.opt.splitbelow = true

-- Use the OS clipboard by default
vim.opt.clipboard = 'unnamedplus'

-- Statusline
vim.opt.laststatus=2
vim.opt.statusline = '%f %#CursorColumn# %= %y %l/%L %p%% %l:%c'

vim.opt.showbreak='↪\\'

-- Searching
vim.opt.hlsearch = true                    -- highlight matches
vim.opt.incsearch = true                   -- incremental searching
vim.opt.ignorecase = true                  -- searches are case insensitive...
vim.opt.smartcase = true                   -- ... unless they contain at least one capital letter
vim.opt.backupcopy = 'yes'
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.history = 50  --   keep 50 lines of command line history
vim.opt.ruler = true         -- show the cursor position all the time
vim.opt.title = true
vim.opt.autoread = true
vim.opt.shortmess:append('c')
vim.opt.foldmethod = 'expr'

-- Hybrid linenums
vim.opt.relativenumber = true
vim.opt.number = true

vim.cmd [[ filetype plugin indent on ]]
vim.cmd [[ filetype on ]]

-- Themes
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_contrast_light = 'hard'

-- Variables

vim.g['test#strategy'] = "neovim"
vim.g['test#preserve_screen'] = 1
vim.g['test#javascript#jest#executable'] = 'yarn jest'
vim.g['test#javascript#jest#file_pattern'] = '[**.jest.js | **.test.js]'
vim.g['test#typescript#jest#file_pattern'] = '[**.jest.ts | **.test.ts]'

vim.g.polyglot_disable = {'typescript', 'typescript.tsx', 'javscript', 'javascript.jsx'}
vim.g.netrw_banner = 0        -- no more annoying banner!
vim.g.netrw_browse_split = 0
vim.g.netrw_altv = 1          -- open splits to the right
vim.g.netrw_liststyle = 3     -- tree view
vim.g.netrw_fastbrowse = 0
vim.g.netrw_winsize = 25

vim.g.gitgutter_realtime = 0
vim.g.gitgutter_eager = 0
--vim.g.android_sdk_path = vim.api.expand('$ANDROID_SDK_ROOT')
vim.g.goyo_width = 120
vim.g.markdown_fenced_languages = {'ruby','erb=eruby','javascript','sh'}
vim.g.vimwiki_folding = 'expr'


-- UI

-- vim.cmd [[ highlight Pmenu ctermbg=DarkCyan guibg=DarkCyan ]]
-- vim.cmd [[ highlight Comment cterm=italic gui=italic ]]

current_theme = 'dark'
function LoadDark()
    current_theme = 'dark'
    vim.cmd [[ set background=dark ]]
    vim.cmd [[ colorscheme molokai ]]
    -- vim.cmd [[ highlight Pmenu ctermbg=DarkCyan guibg=DarkCyan]]
    -- vim.cmd [[ highlight Comment cterm=italic gui=italic ]]
end
function LoadLight()
    current_theme = 'light'
    vim.cmd [[ colorscheme PaperColor ]]
    vim.cmd [[ set background=light ]]
    -- vim.cmd [[ highlight Pmenu ctermbg=DarkCyan guibg=DarkCyan]]
    -- vim.cmd [[ highlight Comment cterm=italic gui=italic ]]
end

function SwitchTheme()
    if current_theme == 'light' then
        LoadDark()
    elseif current_theme == 'dark' then
        LoadLight()
    end
end

LoadDark()

-- Utilities
function PrintNote()
    vim.cmd [[ :normal! iNOTE(jsral): ]]
    vim.cmd [[ :Commentary ]]
    vim.cmd [[ :normal! F: ]]
    vim.cmd [[ :startinsert! ]]
end
function PrintTodo()
    vim.cmd [[ :normal! iTODO(jsral): ]]
    vim.cmd [[ :Commentary ]]
    vim.cmd [[ :normal! F: ]]
    vim.cmd [[ :startinsert! ]]
end
function CleanBuffers()
    vim.cmd [[ bufdo bd ]]
end

function ToggleLines()
    vim.g.relativenumber = not vim.g.relativenumber
    vim.g.number = not vim.g.number
end

-- Mappings
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {noremap = true})
vim.api.nvim_set_keymap('x', 'jk', '<Esc>', {noremap = true})
-- easier navigation between split windows
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<BS>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>T', ':tabe<cr>', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>/', ':nohlsearch<CR>', {silent = true})
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>ev', ':e $MYVIMRC<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>rv', ':so $MYVIMRC<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>F', ':Prettier<cr>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<cr>', ':w<cr>', {noremap = true, silent = true})

-- For navigating even in Nvim terminal
vim.api.nvim_set_keymap('t', '<M-h>', '<C-\\><C-N><C-w>h', {noremap = true})
vim.api.nvim_set_keymap('t', '<M-j>', '<C-\\><C-N><C-w>j', {noremap = true})
vim.api.nvim_set_keymap('t', '<M-k>', '<C-\\><C-N><C-w>k', {noremap = true})
vim.api.nvim_set_keymap('t', '<M-l>', '<C-\\><C-N><C-w>l', {noremap = true})

-- UI
vim.api.nvim_set_keymap('n', '<F5>', ':lua SwitchTheme()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>z', ':Goyo<cr>', {noremap = true, silent = true})

-- DAP Debugging
vim.api.nvim_set_keymap('n', '<F8>', ':lua require"dap".toggle_breakpoint()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F9>', ':lua require"dap".continue()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F10>', ':lua require"dap".step_into()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'S-<F10>', ':lua require"dap".step_over()<cr>', {noremap = true, silent = true})

-- LSP Keys
local bufopts = { noremap=true, silent=true, buffer=bufnr }
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', bufopts)
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', bufopts)
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', bufopts)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', bufopts)
vim.api.nvim_set_keymap('n', '<space>K', '<cmd>lua vim.lsp.buf.signature_help()<cr>', bufopts)
vim.api.nvim_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', bufopts)
vim.api.nvim_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', bufopts)
vim.api.nvim_set_keymap('n', '<space>D', '<cmd> lua vim.lsp.buf.type_definition()<cr>', bufopts)
vim.api.nvim_set_keymap('n', '<space>rn', '<cmd> lua vim.lsp.buf.rename()<cr>', bufopts)
vim.api.nvim_set_keymap('n', '<space>ac', '<cmd> lua vim.lsp.buf.code_action()<cr>', bufopts)
vim.api.nvim_set_keymap('n', 'gr', '<cmd> lua vim.lsp.buf.references()<cr>', bufopts)
vim.api.nvim_set_keymap('n', '<space>f', '<cmd> lua vim.lsp.buf.formatting()<cr>', bufopts)

-- For Utils
vim.api.nvim_set_keymap('i', '<C-i><C-n>', '<ESC> :lua PrintNote()<cr>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>in', '<ESC> :lua PrintNote()<cr>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-i><C-t>', '<ESC> :lua PrintTodo()<cr>', {noremap = true})
-- vim.api.nvim_set_keymap('i', '<leader>it', '<ESC> :lua PrintTodo()<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-g>', ':Telescope live_grep<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-b>', ':Telescope buffers<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F2>', ':lua ToggleLines()<CR>', {noremap = true})

-- Test Runner
vim.api.nvim_set_keymap('n', '<leader><leader>t', ':TestNearest<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader><leader>T', ':TestFile<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader><leader>A', ':TestSuite<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader><leader>L', ':TestLast<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader><leader>G', ':TestVisit<CR>', {noremap = true})

-- Vaffle
vim.api.nvim_set_keymap('n', '-', ':Vaffle %<cr>', {noremap = true})

-- Git
vim.api.nvim_set_keymap('n', '<leader>gs', ':Git<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gc', ':Gcommit<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ga', ':Gwrite<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gd', ':Gdiff<cr>', {noremap = true})


-- FZF
vim.cmd [[
if executable('ag')
    let g:ackprg = 'ag -vimgrep'
end

let $FZF_DEFAULT_COMMAND = 'ag -l'
]]

-- Filetype defaults
vim.cmd [[
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
]]


-- LSP
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
function lsp_attach(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<space>K', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

-- Packages
-- Bootstrap Packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'flazz/vim-colorschemes'
  use { 'nvim-treesitter/nvim-treesitter',
      config = function()
          require'nvim-treesitter.configs'.setup {
              -- A list of parser names, or "all"
              ensure_installed = { "c", "lua", "rust", "typescript", "javascript", "tsx" },
              sync_install = false,
              auto_install = true,
              ignore_install = {},
              highlight = {
                  enable = true,
              },
          }
      end
  }
  use 'haishanh/night-owl.vim'
  use 'jamessral/naysayer-vim'
  use 'jiangmiao/auto-pairs'
  use 'dracula/vim'
  use 'mattn/emmet-vim'
  use 'sheerun/vim-polyglot'
  use 'lepture/vim-jinja'
  use 'cocopon/vaffle.vim'
  use 'jpalardy/vim-slime'
  use 'vimwiki/vimwiki'
  use 'rbgrouleff/bclose.vim'
  use 'ap/vim-css-color'
  use 'kburdett/vim-nuuid'
  use 'Tetralux/odin.vim'
  use 'machakann/vim-highlightedyank'
  use 'vim-scripts/utl.vim'
  use 'tpope/vim-repeat'
      use 'tpope/vim-rails'
      use 'junegunn/goyo.vim'
      use 'christoomey/vim-tmux-navigator'
      use 'editorconfig/editorconfig-vim'
      use 'lervag/vimtex'
      use 'pangloss/vim-javascript'
      use 'leafgarland/typescript-vim'
      use 'maxmellon/vim-jsx-pretty'
      use 'jparise/vim-graphql'
      use 'HerringtonDarkholme/yats.vim'
      use 'roxma/nvim-yarp'
      use 'leshill/vim-json'
      use {'fatih/vim-go', run = ':GoUpdateBinaries' }
      use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
      use 'junegunn/fzf.vim'
      use({
              'nvim-telescope/telescope.nvim',
              config = function()
                  require('telescope').setup{
                      defaults = {
                          mappings = {
                              i = {
                                  -- map actions.which_key to <C-h> (default: <C-/>)
                                  -- actions.which_key shows the mappings for your picker,
                                  -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                                  ["<C-h>"] = "which_key"
                              }
                          }
                      },
                      pickers = {
                          -- Default configuration for builtin pickers goes here:
                          -- picker_name = {
                              --   picker_config_key = value,
                              --   ...
                          -- }
                          -- Now the picker_config_key will be applied every time you call this
                          -- builtin picker
                      },
                      extensions = {
                          -- Your extension configuration goes here:
                          -- extension_name = {
                              --   extension_config_key = value,
                          -- }
                          -- please take a look at the readme of the extension you want to configure
                      }
                  }
              end
          })
      use 'scrooloose/nerdcommenter'
      use 'Raimondi/delimitMate'
      use 'tpope/vim-fugitive'
      use 'airblade/vim-gitgutter'
      use 'preservim/vim-pencil'
      use 'tpope/vim-markdown'
      use 'tpope/vim-endwise'
      use 'tpope/vim-surround'
      use 'tpope/vim-commentary'
      use 'Olical/conjure'
      use 'tbastos/vim-lua'
      use 'janko-m/vim-test'
      use {'Shougo/vimproc.vim', run = 'make' }
      -- Lazy loading:
      -- Load on specific commands
      use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
      use 'danro/rename.vim'
      use 'nvim-lua/plenary.nvim'
      use({
              'neovim/nvim-lspconfig',
              config = function() 
                  require'lspconfig'.eslint.setup{}
                  require'lspconfig'.tsserver.setup{}
              end
          })
      use (
          {'hrsh7th/nvim-cmp',
              requires = {'L3MON4D3/LuaSnip'},
              config = function()
                  local cmp = require 'cmp'
                  cmp.setup {
                      snippet = {
                          expand = function(args)
                              require('luasnip').lsp_expand(args.body)
                          end,
                      },
                      mapping = {
                          ["<C-p>"] = cmp.mapping.select_prev_item(),
                          ["<C-n>"] = cmp.mapping.select_next_item(),
                      },
                      sources = {
                          { name = 'nvim_lsp' },
                          { name = 'luasnip' },
                      },
                  }
              end
          })
      use({
              'hrsh7th/cmp-nvim-lsp',
              config = function() 
                  local capabilities = vim.lsp.protocol.make_client_capabilities()
                  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

                  local lspconfig = require('lspconfig')

                  -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
                  local servers = { 'clangd', 'rust_analyzer', 'tsserver' }
                  for _, lsp in ipairs(servers) do
                      lspconfig[lsp].setup {
                          on_attach = lsp_attach,
                          flags = lsp_flags,
                          capabilities = capabilities,
                      }
                  end
              end
          })
      use({'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp'})
      use 'rafamadriz/friendly-snippets'
      use({'L3MON4D3/LuaSnip',
              config = function()
                  local luasnip = require 'luasnip'
                  require("luasnip.loaders.from_vscode").lazy_load()
                  local has_words_before = function()
                      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
                  end
              end
          })
      use 'MunifTanjim/prettier.nvim'
      use {
          "mfussenegger/nvim-dap",
          opt = true,
          module = { "dap" },
          requires = {
              "Pocco81/dap-buddy.nvim",
              "nvim-telescope/telescope-dap.nvim",
          },
          config = function()
              local dap = require "dap"

              dap.adapters.node2 = {
                  type = 'executable',
                  command = 'node',
                  args = {
                      vim.fn.stdpath("data") .. "/dapinstall/jsnode_dbg/" ..
                      '/vscode-node-debug2/out/src/nodeDebug.js'
                  }
              }

              dap.configurations.javascript = {
                  {
                      type = 'node2',
                      request = 'launch',
                      program = '${workspaceFolder}/${file}',
                      cwd = vim.fn.getcwd(),
                      sourceMaps = true,
                      protocol = 'inspector',
                      console = 'integratedTerminal'
                  }
              }
          end,
      }
      if packer_bootstrap then
          require('packer').sync()
      end
  end)

