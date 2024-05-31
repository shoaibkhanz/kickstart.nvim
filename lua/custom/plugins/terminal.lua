return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    direction = 'float',
    -- open_mapping = [[<c-,>]],
    auto_scroll = true, -- automatically scroll to the bottom on terminal output
    shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
    shading_factor = '80', -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
    float_opts = {
      -- The border key is *almost* the same as 'nvim_open_win'
      -- see :h nvim_open_win for details on borders however
      -- the 'curved' border is a custom border type
      -- not natively supported but implemented in this plugin.
      border = 'curved', --'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
      -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
      width = 80,
      height = 50,
      row = 10,
      col = 150,
      -- winblend = 5,
      -- zindex = <value>,
      title_pos = 'left',
    },
    keymapping = { vim.keymap.set('n', '<leader>,', '<CMD>ToggleTerm<CR>') },
  },
  config = true,
}
