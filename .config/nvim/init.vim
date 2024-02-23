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
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'mhinz/vim-startify'
  Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-telescope/telescope-file-browser.nvim'
  Plug 'Rigellute/rigel'
  Plug 'mbbill/undotree'
  Plug 'beauwilliams/focus.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'airblade/vim-rooter'
  Plug 'airblade/vim-localorie'
  Plug 'alvan/vim-closetag'
  Plug 'vim-scripts/tComment'
  Plug 'sangdol/mintabline.vim'
  Plug 'Nopik/vim-nerdtree-direnter'
  Plug 'andymass/vim-matchup'
  Plug 'junegunn/vim-easy-align'
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'pmizio/typescript-tools.nvim'
  Plug 'TaDaa/vimade'
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'jparise/vim-graphql'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
set clipboard+=unnamedplus

:hi! MatchParen cterm=NONE,bold gui=NONE,bold  guibg=#eee8d5 guifg=NONE

lua << EOF
 require("focus").setup()
 require("mason").setup()
 require("mason-lspconfig").setup()
 require("typescript-tools").setup {
  settings = {
    -- spawn additional tsserver instance to calculate diagnostics on it
    separate_diagnostic_server = true,
    -- "change"|"insert_leave" determine when the client asks the server about diagnostic
    publish_diagnostic_on = "insert_leave",
    -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
    -- "remove_unused_imports"|"organize_imports") -- or string "all"
    -- to include all supported code actions
    -- specify commands exposed as code_actions
    expose_as_code_action = {},
    -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
    -- not exists then standard path resolution strategy is applied
    tsserver_path = nil,
    -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
    -- (see 💅 `styled-components` support section)
    tsserver_plugins = {},
    -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
    -- memory limit in megabytes or "auto"(basically no limit)
    tsserver_max_memory = "auto",
    -- described below
    tsserver_format_options = {},
    tsserver_file_preferences = {},
    -- locale of all tsserver messages, supported locales you can find here:
    -- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
    tsserver_locale = "en",
    -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
    complete_function_calls = false,
    include_completions_with_insert_text = true,
    -- CodeLens
    -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
    -- possible values: ("off"|"all"|"implementations_only"|"references_only")
    code_lens = "off",
    -- by default code lenses are displayed on all referencable values and for some of you it can
    -- be too much this option reduce count of them by removing member references from lenses
    disable_member_code_lens = true,
    -- JSXCloseTag
    -- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-auto-tag,
    -- that maybe have a conflict if enable this feature. )
    jsx_close_tag = {
        enable = false,
        filetypes = { "javascriptreact", "typescriptreact" },
    }
  },
}
EOF

let mapleader=','

let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize=60
let NERDTreeMapOpenInTab='<ENTER>'
let NERDTreeMapActivateNode='v'

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

nnoremap <leader>br <cmd>Telescope file_browser<CR>
nnoremap <leader>br <cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga) "
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip) "
nmap ga <Plug>(EasyAlign)

let g:rooter_patterns = ['.git', '.svn', 'package.json', '!node_modules']
nnoremap <expr> sp ':Telescope find_files cwd='.FindRootDirectory().'/<cr>'

let g:rspec_command = "Dispatch bundle exec rspec %" 

let g:vim_markdown_folding_disabled = 1

nnoremap <cr> :noh<return>

lua << EOF
  -- You dont need to set any of these options. These are the default ones. Only
  -- the loading is important
  require('telescope').setup {
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "ignore_case",        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
      }
    }
  }
  -- To get fzf loaded and working with telescope, you need to call
  -- load_extension, somewhere after setup function:
  require('telescope').load_extension('fzf')
  require("telescope").load_extension("file_browser")
EOF

" Exit Vim if NERDTree is the only window remaining in the only tab. "
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" copies relative path to clipboard by pressing yd "
:noremap <silent> yd :let @+=expand("%:p:~")<CR>
" copies filepath to clipboard by pressing yf "
:nnoremap <silent> yf :let @+=expand('%:p')<CR>

" Vim jump to the last position when reopening a file "
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Typescript config "
let g:coc_global_extensions = ['coc-tsserver', 'coc-solargraph', 'coc-json']

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()


" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count "
" utf-8 byte sequence "
set encoding=utf-8
" Some servers have issues with backup files, see #649 "
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable "
" delays and poor user experience "
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time "
" diagnostics appear/become resolved "
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate "
" NOTE: There's always complete item selected by default, you may want to enable "
" no select by `"suggest.noselect": true` in your configuration file "
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by "
" other plugin before putting this into your config "
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format "
" <C-g>u breaks current undo, please make your own choice "
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion "
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics "
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list "
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation "
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window "
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor "
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming "
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code "
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s) "
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder "
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block "
" Example: `<leader>aap` for current paragraph "
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position "
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer "
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line "
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions "
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line "
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects "
" NOTE: Requires 'textDocument.documentSymbol' support from the language server "
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups "
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges "
" Requires 'textDocument/selectionRange' support of language server "
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer "
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer "
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer "
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList "
" Show all diagnostics "
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions "
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands "
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document "
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols "
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item "
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item "
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list "
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

let g:startify_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]
