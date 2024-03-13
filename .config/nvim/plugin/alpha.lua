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

vim.cmd [[ au BufDelete * if empty(filter(tabpagebuflist(), 'stridx(bufname(v:val), "NvimTree") == -1 && !buflisted(v:val)')) | exec "Alpha" | endif ]]

