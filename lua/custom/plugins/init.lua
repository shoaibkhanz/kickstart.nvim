-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- disable netrw in favor of neo-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Sets how neovim will display certain whitespace characters in the editor.
-- diff files
vim.keymap.set('n', '<leader>df', '<cmd>windo diffthis<CR>', { desc = '[D]iff This' })
vim.keymap.set('n', '<leader>ds', '<cmd>windo diffoff<CR>', { desc = '[D]iff Stop' })
-- create a keybinding for <Esc>
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true })

-- set default shiftwidth
vim.opt.shiftwidth = 2

-- Create a Keymap for NeoTree
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>')

-- Create a Keymap for Noice
vim.keymap.set('n', '<leader>nd', '<cmd>NoiceDismiss<CR>', { desc = 'Dismiss Noice Message' })
vim.keymap.set('v', '<leader>tt', function()
  require('nvim-python-repl').send_visual_to_repl()
end, { desc = 'Send visual selection to REPL' })
-- See `:help telescope.builtin`
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>so', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>s.', '<cmd>Telescope find_files hidden=true<CR>', { desc = '[S]earch [H]idden Files' })

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Move the cursor using io and jk rather than arrows
vim.keymap.set('i', '<C-i>', '<Left>')
vim.keymap.set('i', '<C-o>', '<Right>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-j>', '<Down>')

-- git blame
vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns blame_line<CR>', { desc = 'git blame line' })

-- avante
vim.keymap.set('n', '<leader>ao', '<cmd>AvanteSwitchProvider openai<CR>', { desc = 'switch to openai as provider in avante' })
vim.keymap.set('n', '<leader>ag', '<cmd>AvanteSwitchProvider copilot<CR>', { desc = 'switch to github copilot as provider in avante' })

return {}
