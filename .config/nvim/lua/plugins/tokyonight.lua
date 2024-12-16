return
{
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    on_highlights = function(hl, c)
      hl.BufferDefaultCurrentADDED = {
        bg = c.bg_dark,
        fg = c.fg_dark,
      }
      hl.BufferDefaultCurrentCHANGED = {
        bg = c.bg_dark,
        fg = c.fg_dark,
      }
      hl.BufferDefaultCurrentDELETED = {
        bg = c.bg_dark,
        fg = c.fg_dark,
      }
    end,
  },
}
