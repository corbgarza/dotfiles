-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.rtp:prepend(lazypath)
vim.o.scrolloff = 20
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.wrap = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>')
vim.keymap.set('n', '<leader>t', '<cmd>Neotree filesystem reveal left<cr>')
vim.keymap.set('n', '<leader>T', '<cmd>terminal<cr>')
vim.keymap.set('n', '<leader>n', '<cmd>set number! relativenumber!<cr>')

require("lazy").setup({
spec = { 
{"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
{"nvim-neo-tree/neo-tree.nvim", lazy = false, dependencies = { 'MunifTanjim/nui.nvim' }, opts = { filesystem = { filtered_items = { visible = "true" }, }, }, },
{"norcalli/nvim-colorizer.lua", lazy = false},
{'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' }},
{'windwp/nvim-autopairs', event = "InsertEnter", config = true},
{"folke/which-key.nvim", event = "VeryLazy", keys = {{"<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps (which-key)"},},},
{"neovim/nvim-lspconfig", lazy = false, dependencies = {{ "ms-jpq/coq_nvim", branch = "coq" }, { "ms-jpq/coq.artifacts", branch = "artifacts" },},
  init = function()
    vim.g.coq_settings = { auto_start = 'shut-up' }end,
},
{"folke/tokyonight.nvim", lazy = false}
},
checker = { enabled = true },
})

vim.cmd[[colorscheme tokyonight-night]]
