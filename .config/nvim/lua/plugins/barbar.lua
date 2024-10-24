return
{"romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
  },
  opts = {
    icons = {
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = {enabled = true, icon = ' '},
      [vim.diagnostic.severity.WARN] = {enabled = true, icon = ' '},
      [vim.diagnostic.severity.INFO] = {enabled = true, icon = ' '},
      [vim.diagnostic.severity.HINT] = {enabled = true, icon = ' '},
    },
    gitsigns = {
      added = {enabled = true, icon = ' '},
      changed = {enabled = true, icon = ' '},
      deleted = {enabled = true, icon = ' '},
    },
    modified = {button = ' '},
    pinned = {button = '', filename = true},
    },
    sidebar_filetypes = {
      NvimTree={text="󰉓  File Explorer"},
      DiffviewFiles={text="  Version Control"}
    }
  },
  init = function() vim.g.barbar_auto_setup = true end,
  version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
