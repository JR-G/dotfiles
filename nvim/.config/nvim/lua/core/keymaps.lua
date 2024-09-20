-- lua/core/keymaps.lua
local keymap = vim.keymap

-- Set leader key to comma
vim.g.mapleader = ","

-- General keymaps
keymap.set("i", "jk", "<ESC>")                    -- Exit insert mode with jk
keymap.set("n", "<leader>nh", ":nohl<CR>")        -- Clear search highlights
keymap.set("n", "x", '"_x')                       -- Delete single character without copying into register

-- Split window management
keymap.set("n", "<leader>sv", "<C-w>v")           -- Split window vertically
keymap.set("n", "<leader>sh", "<C-w>s")           -- Split window horizontally
keymap.set("n", "<leader>se", "<C-w>=")           -- Make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>")       -- Close current split window

-- Tab management (keep your existing shortcuts)
keymap.set("n", "<leader>to", ":tabnew<CR>")      -- Open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>")    -- Close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>")        -- Go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")        -- Go to previous tab

-- Add this to ensure 'tabo' works (close all other tabs)
keymap.set("n", "<leader>tabo", ":tabonly<CR>", { noremap = true, silent = true })   -- Close all tabs except current one

-- Ensure Vim's built-in tab commands work
keymap.set("n", "gt", "gt", { noremap = true })                    -- Go to next tab
keymap.set("n", "gT", "gT", { noremap = true })                    -- Go to previous tab
for i = 1, 9 do
  keymap.set("n", i.."gt", i.."gt", { noremap = true })            -- Go to tab by number
end

-- If you want to add the 'tabo' command (close all other tabs)
keymap.set("n", "<leader>tabo", ":tabonly<CR>", { noremap = true, silent = true })  -- Close all tabs except current one

-- Telescope
keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { noremap = true, silent = true })
keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, { noremap = true, silent = true })
keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end, { noremap = true, silent = true })
keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, { noremap = true, silent = true })

-- nvim-tree
keymap.set("n", "<leader>/", ":NvimTreeToggle<CR>")        -- Toggle file explorer
keymap.set("n", "<Leader>v", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })  -- Find and reveal current file in nvim-tree

-- Undotree
keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")        -- Toggle undo tree

-- Additional mappings from original init.vim
keymap.set("n", "<leader>z", ":u<CR>")                     -- Undo
keymap.set("n", "<leader>Q", ":qa!<CR>")                   -- Quit all without saving
keymap.set("n", "<leader>q", ":bw<CR>")                    -- Close current buffer

-- LazyGit
keymap.set("n", "<leader>gg", ":LazyGit<CR>")              -- Open LazyGit

-- Lspsaga hover info
keymap.set('n', '<leader>dd', '<cmd>Lspsaga hover_doc<CR>') -- Show definition

-- Rspec runners
keymap.set("n", "<Leader>t", ":call RunCurrentSpecFile()<CR>")  -- Run current spec file
keymap.set("n", "<Leader>s", ":call RunNearestSpec()<CR>")      -- Run nearest spec
keymap.set("n", "<Leader>l", ":call RunLastSpec()<CR>")         -- Run last spec
keymap.set("n", "<Leader>a", ":call RunAllSpecs()<CR>")         -- Run all specs

-- Split screen (if not covered by previous split mappings)
keymap.set("n", "<leader>h", ":FocusSplitLeft<CR>")        -- Focus split left
keymap.set("n", "<leader>j", ":FocusSplitDown<CR>")        -- Focus split down
keymap.set("n", "<leader>k", ":FocusSplitUp<CR>")          -- Focus split up
keymap.set("n", "<leader>l", ":FocusSplitRight<CR>")       -- Focus split right

-- Localorie (assuming you're still using this plugin)
keymap.set("n", "<leader>lt", ":call localorie#translate()<CR>")  -- Localorie translate
keymap.set("n", "<leader>le", ":echo localorie#expand_key()<CR>") -- Localorie expand key

-- File path copy
keymap.set("n", "yd", ":let @+=expand('%:p:~')<CR>")       -- Copy relative path to clipboard
keymap.set("n", "yp", ":let @+=expand('%:p')<CR>")         -- Copy full path to clipboard

-- Clear search highlighting
keymap.set("n", "<CR>", ":noh<CR><CR>")                    -- Clear search highlight on Enter

-- Rooter (assuming you're still using this plugin)
keymap.set("n", "sp", ":Telescope find_files cwd=".."<CR>") -- Find files in project root

-- Formatting
keymap.set("n", "<leader>f", "gggqG", { noremap = true, silent = true })  -- Format entire file

-- Copilot
vim.g.copilot_no_tab_map = true
keymap.set('i', '<C-J>', 'copilot#Accept("<CR>")', { expr = true,  replace_keycodes = false }) -- Accept copilot suggestion
