vim.cmd("colorscheme tokyonight")

local colors = require("tokyonight.colors").styles.moon

local hl = vim.api.nvim_set_hl
hl(0, "BufferDefaultCurrentADDED", { fg = colors.git.add, bg = colors.bg })
hl(0, "BufferDefaultCurrentCHANGED", { fg = colors.git.change, bg = colors.bg })
hl(0, "BufferDefaultCurrentDELETED", { fg = colors.git.delete, bg = colors.bg })

hl(0, "BufferDefaultInactiveADDED", { fg = colors.fg_dark, bg = "#272a3f" })
hl(0, "BufferDefaultInactiveCHANGED", { fg = colors.fg_dark, bg = "#272a3f" })
hl(0, "BufferDefaultInactiveDELETED", { fg = colors.fg_dark, bg = "#272a3f" })

hl(0, "DapBreakpoint", { fg = colors.red })
hl(0, "DapLogPoint", { fg = colors.blue })
hl(0, "DapStopped", { fg = colors.green, bg = "#273849" })
hl(0, "DapBreakpointRejected", { fg = colors.fg_dark })

local sd = vim.fn.sign_define
sd("DapBreakpoint", { text = "", texthl = "DapBreakpoint" })
sd("DapBreakpointCondition", { text = "", texthl = "DapBreakpoint" })
sd("DapLogPoint", { text = "", texthl = "DapLogPoint" })
sd("DapStopped", { text = "→", texthl = "DapStopped", linehl = "DapStopped" })
sd("DapBreakpointRejected", { text = "", texthl = "DapBreakpointRejected" })
