" Set options
set nu
set termguicolors
set completeopt=menu,menuone,noselect 

" Colors
hi clear SignColumn

" Git
hi GitSignsChange guibg=clear guifg=#ffb86c
hi GitSignsDelete guibg=clear guifg=#ff5555
hi GitSignsAdd guibg=clear guifg=#50fa7b

" LineNr
hi LineNr guibg=clear guifg=#38393f

" TabLine
hi TabLine guibg=#38393f guifg=white
hi TabLineSel guibg=#282a36 guifg=white
hi clear TabLineFill
hi TabLineFill guibg=#38393f

" Menu
hi Pmenu guibg=#282a36 guifg=white
hi PmenuSel guibg=#38393f guifg=white

" Code
hi @lsp.type.class      guifg=#ff5555
hi @lsp.type.function   guifg=#ff5555
hi @lsp.type.method     guifg=#ff7155
hi @lsp.type.parameter  guifg=lightblue
hi @lsp.type.variable   guifg=white
hi @lsp.type.property   gui=italic guifg=lightblue

hi Operator guifg=yellow
hi Statement guifg=orange
hi Comment gui=italic guifg=darkgrey
hi Function guifg=orange

" NvimTree
hi NvimTreeNormal guifg=white guibg=#240512
hi NvimTreeRootFolder guifg=yellow

hi NvimTreeGitDirty guifg=#ffb86c
hi NvimTreeGitNew guifg=#50fa7b 
hi NvimTreeGitStaged guifg=#50fa7b
hi NvimTreeGitIgnored gui=italic guifg=darkgrey
hi NvimTreeGitDeleted guifg=#ff5555

hi NvimTreeFolderName guifg=lightblue

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
