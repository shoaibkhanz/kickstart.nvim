return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    -- Only one of these is needed, not both.
    'nvim-telescope/telescope.nvim', -- optional
    -- 'ibhagwan/fzf-lua', -- optional
  },
  config = true,

  keymaps = {
    vim.keymap.set('n', '©', '<cmd>Neogit<CR>'), -- this is alt + g
  },
  opts = {
    commit_view = {
      kind = 'vsplit',
      verify_commit = os.execute 'which gpg' == 0, -- Can be set to true or false, otherwise we try to find the binary
    },
  },
}
