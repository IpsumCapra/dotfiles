vim.cmd("colorscheme tokyonight")

local colors = require("tokyonight.colors").styles.moon

vim.api.nvim_set_hl(0, "BufferDefaultCurrentADDED", { fg = colors.git.add, bg = colors.bg })
vim.api.nvim_set_hl(0, "BufferDefaultCurrentCHANGED", { fg = colors.git.change, bg = colors.bg })
vim.api.nvim_set_hl(0, "BufferDefaultCurrentDELETED", { fg = colors.git.delete, bg = colors.bg })

vim.api.nvim_set_hl(0, "BufferDefaultInactiveADDED", { fg = colors.fg_dark, bg = "#272a3f" })
vim.api.nvim_set_hl(0, "BufferDefaultInactiveCHANGED", { fg = colors.fg_dark, bg = "#272a3f" })
vim.api.nvim_set_hl(0, "BufferDefaultInactiveDELETED", { fg = colors.fg_dark, bg = "#272a3f" })
