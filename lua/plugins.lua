
local status_ok,packer = pcall(require,'packer')

if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function ()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)

  use 'wbthomason/packer.nvim'
  use 'sheerun/vim-polyglot'
  use 'rktjmp/lush.nvim'
  use 'npxbr/gruvbox.nvim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use { 'junegunn/fzf', run = './install --bin', }
  use 'junegunn/fzf.vim'
  use 'tpope/vim-fugitive'
  use {  'neoclide/coc.nvim',branch = 'release' }
  use 'antoinemadec/FixCursorHold.nvim'
  use 'unblevable/quick-scope'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'jiangmiao/auto-pairs'
  use 'chrisbra/Colorizer'
  use 'honza/vim-snippets'
  use 'Yggdroot/indentLine'
  use 'mattn/emmet-vim'
  use 'romainl/vim-cool'
  use {  'nvim-treesitter/nvim-treesitter',run=":TSUpdate" }
  use 'voldikss/vim-floaterm'
  use 'liuchengxu/vista.vim'
  use 'SirVer/ultisnips'
  use 'mlaursen/vim-react-snippets'
  use 'puremourning/vimspector'
  use 'nvim-lua/plenary.nvim'
  use 'folke/which-key.nvim'
  use 'nvim-orgmode/orgmode'
  use 'mboughaba/i3config.vim'

end)
