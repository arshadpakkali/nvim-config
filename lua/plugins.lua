local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")

if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("sheerun/vim-polyglot")
	use("rktjmp/lush.nvim")
	use("npxbr/gruvbox.nvim")
	use("vim-airline/vim-airline")
	use("vim-airline/vim-airline-themes")
	use({ "junegunn/fzf", run = "./install --bin" })
	use("junegunn/fzf.vim")
	use("tpope/vim-fugitive")
	use({ "neoclide/coc.nvim", branch = "release" })
	use("antoinemadec/FixCursorHold.nvim")
	use("unblevable/quick-scope")
	use("tpope/vim-commentary")
	use("tpope/vim-surround")
	use("jiangmiao/auto-pairs")
	use("chrisbra/Colorizer")
	use("honza/vim-snippets")
	use("Yggdroot/indentLine")
	use("mattn/emmet-vim")
	use("romainl/vim-cool")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("voldikss/vim-floaterm")
	use("SirVer/ultisnips")
	use("mlaursen/vim-react-snippets")
	use("puremourning/vimspector")
	use("nvim-lua/plenary.nvim")
	use("folke/which-key.nvim")
	use("nvim-orgmode/orgmode")
	use("mboughaba/i3config.vim")

	use("neovim/nvim-lspconfig")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		wants = "nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
			require("nvim-tree").setup({
				view = {
					width = 35,
					mappings = {
						list = {
							{ key = "l", action = "edit" },
							{ key = "h", action = "close_node" },
						},
					},
				},
				update_focused_file = {
					enable = true,
					update_root = false,
					ignore_list = {},
				},
			})
		end,
	})

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
