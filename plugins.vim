call plug#begin(stdpath('data') . '/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"-----------------------------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'unblevable/quick-scope'       

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/Colorizer'
Plug 'honza/vim-snippets'

Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'romainl/vim-cool'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vista.vim'

Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'

Plug 'puremourning/vimspector'

Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'fannheyward/telescope-coc.nvim'
Plug 'folke/which-key.nvim'
Plug 'nvim-orgmode/orgmode'
Plug 'mboughaba/i3config.vim'
call plug#end() 
