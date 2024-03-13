local dashboard = require('alpha.themes.dashboard')
local header = {
  '                                      ▄▀                                       ',
  '                         ░     ░░  ▄█▓▌ ░░ ░   ░                               ',
  '▄▄    ▀▀▓▓█▄▄▄   ▄▄███▄          ▄▓████▄                   ▄▄    ▀▀▓▓▄▄▄       ',
  ' ▀▓▓▓▄▄  ▀▓███▓▓▄ ▀██▓▓█▄▄▄    ▄▓▓▓▓█████▄▄    ▄ ■▄▓▄▄      ▀▓▓▓▄▄   ▀███▓▓▄   ',
  '  ▐▓████▓▄  ▀███▓▓▄ ██▓▌  ▀▓██▄ ▀▀▀████▓▀▀███▄▄▄   ▀████▄▄   ▐▓████▓▓▄ ▀███▓▓▄ ',
  '   ████▓▓▌   ▐███▓▓▌ ▀▀▀■  ▐█████▓▄ ▀ ▄▄▄████▓▀ ▄▀   █▓███▓▄  ████▓▓▌   ▐███▓▓▌',
  '   ▐████▓   ▄████▓▀ ▄▓▓▄    ███▓█▌ ▄██████▓▀▀ ▄▓▌    ▐▓████▓▓▄ ▀███▓   ▄████▓▀ ',
  '    ████▓ ▀▀▀▀▀▀ ▄▄███▀██▄▄ ▐█▓▓▓ ████▓▀▀  ▄██▓▓▌     █▀▓▀██▓▓▌ ███▓■▀██▀▀▀    ',
  '    ███▓▓▌■▀▓██▄▄ ▀██▄▓▄██▀▀■██▓▌  ▀██▄█▓▄▄ ▀▀█▓▓     ▐█▄███▓▓▌ ██▓▓  ▐███▄▄   ',
  '   ▐██▓▓▓▓  ▐███▓▓▄ ▀███▀    ██▓▓    ▀█████▓▓▄▄▄      ▐█████▓▓ ▐█▓▓▓   ▓███▓▓▄ ',
  '  ▄█████▓▓▓▄ ████▓▓▌ ██▓▌   ▐███▓▓     ▀██████▓▓▓▓▀  ▄█████▓▀ ▄████▓▌  ▐████▓▓▌',
  '■▀▀▀   ▀▀▓▀ ▐█████▓▓ ▐▓▓▓▓▄▄▓████▓▓      ▀███▓▓▀  ■▄▓██▓▓▀▀ ▄█▀   ▀▀▀  ▀▀▀███▓▓',
  '          ▄▓▓▓███▓▓▓▌ ▀▓▓▀▀     ▀█▓▓       ▓▓▀      ▀▀▀    ▄▀               ▀▀▓',
  '                ▀▀▀▓▓▄            ▀▓▓▄      ▀▄           ▄                     ',
  ' <cH!RiGOR>          ▀▓             ▀▓▌        ▀ ■ ▄ ■ ▀     1 9 1 1           ',
  '                      ▀▄             ▐▌                                        ',
}
local footer = {
  ':                                                                             :',
  '│                                                  ─  N  E  O  V  i  M  ─     │',
  '│                                                                             │',
  '└────── ───── ── ── ─ ── ──    ─             ─     ─ ─ ── ─── ──── ─── ───TGS─┘',
}
dashboard.section.header.val = header
dashboard.section.footer.val = footer
dashboard.section.buttons.val = {
  dashboard.button('f', ' ' .. ' Find file', ':Telescope find_files <CR>'),
  dashboard.button('n', ' ' .. ' New file', ':ene <BAR> startinsert <CR>'),
  dashboard.button('r', ' ' .. ' Recent files', ':Telescope oldfiles <CR>'),
  dashboard.button('g', ' ' .. ' Find text', ':Telescope live_grep <CR>'),
  dashboard.button('c', ' ' .. ' Config', ':e $MYVIMRC <CR>'),
  dashboard.button('q', ' ' .. ' Quit', ':qa<CR>'),
}
for _, button in ipairs(dashboard.section.buttons.val) do
  button.opts.hl = 'AlphaButtons'
  button.opts.hl_shortcut = 'AlphaHeader'
end
dashboard.section.header.opts.hl = 'AlphaHeader'
dashboard.section.buttons.opts.hl = 'AlphaButtons'
dashboard.section.footer.opts.hl = 'AlphaHeader'

require('alpha').setup(dashboard.opts)

local function alpha_autocmd()
  local bnum = #(require('barbar.state').get_buffer_list())

  if bnum <= 2 and bnum >= 1 then
    if bnum ~= 2 or vim.api.nvim_buf_get_name(require('barbar.state').get_buffer_list()[2]) == '' then
      vim.cmd('exec "Alpha"')
    end
  end
end

vim.api.nvim_create_autocmd({'BufDelete'}, {callback = alpha_autocmd})
