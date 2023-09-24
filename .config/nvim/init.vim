" Set options
set nu
set termguicolors
set completeopt=menu,menuone,noselect 

" Colors
highlight clear SignColumn

highlight GitSignsChange guibg=clear guifg=#ffb86c
highlight GitSignsDelete guibg=clear guifg=#ff5555
highlight GitSignsAdd guibg=clear guifg=#50fa7b

highlight LineNr guibg=clear guifg=#38393f

highlight TabLine guibg=#38393f guifg=white
highlight TabLineSel guibg=#282a36 guifg=white
highlight clear TabLineFill
highlight TabLineFill guibg=#38393f

highlight Pmenu guibg=#282a36 guifg=white
highlight PmenuSel guibg=#38393f guifg=white

" Plugs
call plug#begin()

Plug 'glepnir/galaxyline.nvim' , { 'branch': 'main' }
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

call plug#end()
