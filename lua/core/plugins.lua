local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- Color theme: Gruvbox Dark
	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...}, -- setup_status = done

	{
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	}, -- setup_status = done

        { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, -- setup_status = done

	"theprimeagen/harpoon", -- setup_status = done
	"theprimeagen/refactoring.nvim", -- setup_status = done
	"mbbill/undotree", -- setup_status = done
	"nvim-treesitter/nvim-treesitter-context",
	"nvim-lualine/lualine.nvim", -- setup_status = done

        -- setup_status = done
        --- Uncomment these if you want to manage LSP servers from neovim
        -- {'williamboman/mason.nvim'},
        -- {'williamboman/mason-lspconfig.nvim'},

        {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
        {'neovim/nvim-lspconfig'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/nvim-cmp'},
        {'L3MON4D3/LuaSnip'},
}

local opts = {}

require("lazy").setup(plugins, opts)

