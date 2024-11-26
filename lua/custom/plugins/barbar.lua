return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    insert_at_end = true,
    -- Enable/disable animations
    animation = true,

    -- Automatically hide the tabline when there are this many buffers left.
    -- Set to any value >=0 to enable.
    auto_hide = false,

    -- Enable/disable current/total tabpages indicator (top right corner)
    tabpages = true,
    gitsigns = {
      added = { enabled = true, icon = '+' },
      changed = { enabled = true, icon = '~' },
      deleted = { enabled = true, icon = '-' },
    },
    filetype = {
      -- Sets the icon's highlight group.
      -- If false, will use nvim-web-devicons colors
      custom_colors = true,

      -- Requires `nvim-web-devicons` if `true`
      enabled = true,
    },
    separator = { left = '▎', right = '' },
    -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
    preset = 'powerline',
  },
  keymaps = {
    vim.keymap.set('n', '~', '<cmd>BufferPrevious<CR>'), -- this is alt + n
    vim.keymap.set('n', 'Æ', '<cmd>BufferNext<CR>'), -- this is alt + "
    -- Re-order to previous/next
    vim.keymap.set('n', 'µ', '<cmd>BufferMovePrevious<CR>'), -- this is alt + m
    vim.keymap.set('n', 'æ', '<cmd>BufferMoveNext<CR>'), -- this is alt + '
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
