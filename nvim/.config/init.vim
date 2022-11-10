call plug#begin()
  Plug 'vim-airline/vim-airline-themes'
  Plug 'vim-airline/vim-airline'
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'PhilRunninger/nerdtree-buffer-ops'
  Plug 'sheerun/vim-polyglot'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ap/vim-css-color'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'kien/ctrlp.vim'
  Plug 'thoughtbot/vim-rspec'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-markdown'
  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-bundler'
  Plug 'tpope/vim-dispatch'
  Plug 'plasticboy/vim-markdown'
  Plug 'airblade/vim-gitgutter'
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'mhinz/vim-startify'
  Plug 'nvim-telescope/telescope.nvim', { 'branch': '1.1.x' }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'Rigellute/rigel'
  Plug 'mbbill/undotree'
  Plug 'beauwilliams/focus.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'airblade/vim-rooter'
  Plug 'airblade/vim-localorie'
  Plug 'alvan/vim-closetag'
  Plug 'vim-scripts/tComment'
  Plug 'sangdol/mintabline.vim'
  Plug 'Mopik/vim-nerdtree-direnter'
call plug#end()

colorscheme rigel 
syntax enable
set termguicolors

set ruler
set number
set inccommand=split
set relativenumber
set splitbelow splitright
set title
set mouse=a
set tabstop=2
set shiftwidth=2

lua << EOF
 require("focus").setup()
EOF

let mapleader=','

let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize=60
let NERDTreeMapOpenInTab='<ENTER>'

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>/ :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>u :UndotreeToggle<CR>

nmap <leader>z :u<CR>
nmap <leader>Q :qa!<CR>
nmap <leader>q :bw<CR>

nmap <Leader>t :call RunCurrentSpecFile()<CR>
nmap <Leader>s :call RunNearestSpec()<CR>
nmap <Leader>l :call RunLastSpec()<CR>
nmap <Leader>a :call RunAllSpecs()<CR>

nnoremap <leader>h :FocusSplitLeft<CR> 
nnoremap <leader>j :FocusSplitDown<CR>
nnoremap <leader>k :FocusSplitUp<CR>
nnoremap <leader>l :FocusSplitRight<CR>

nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <silent> <leader>lt :call localorie#translate()<CR>
nnoremap <silent> <leader>le :echo localorie#expand_key()<CR>

let g:rooter_patterns = ['.git', '.svn', 'package.json', '!node_modules']
nnoremap <expr> sp ':Telescope find_files cwd='.FindRootDirectory().'/<cr>'

let g:rspec_command = "Dispatch bundle exec rspec %" 

lua << EOF
  -- You dont need to set any of these options. These are the default ones. Only
  -- the loading is important
  require('telescope').setup {
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
      }
    }
  }
  -- To get fzf loaded and working with telescope, you need to call
  -- load_extension, somewhere after setup function:
  require('telescope').load_extension('fzf')
EOF

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" copies relative path to clipboard by pressing yd
:noremap <silent> yd :let @+=expand("%:p:~")<CR>
" copies filepath to clipboard by pressing yf
:nnoremap <silent> yf :let @+=expand('%:p')<CR>

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect


let g:startify_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]

lua << EOF
  local nvim_lsp = require('lspconfig')

  local servers = {'solargraph'}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
    }
  end

  vim.g.coq_settings = {
    auto_start = 'shut-up',
  }
EOF

