-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.scrolloff = 20
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.undofile = true
vim.opt.scs = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 2
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.backspace ="indent,eol,start"
vim.opt.clipboard:append("unnamedplus")
vim.api.nvim_create_autocmd("TextYankPost", {
		group = autocmd,
		callback = function()
				vim.highlight.on_yank()
		end,
})
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>')
vim.keymap.set('n', '<leader>t', '<cmd>Neotree filesystem reveal left<cr>')
vim.keymap.set('n', '<leader>T', '<cmd>terminal<cr>')
vim.keymap.set('n', '<leader>n', '<cmd>set number! relativenumber!<cr>')
vim.keymap.set('n', '<leader>ww', '<cmd>w<cr>')
vim.keymap.set('n', '<leader>wq', '<cmd>wq<cr>')
vim.keymap.set('n', '<leader>wr', '<cmd>set wrap!<cr>')
vim.keymap.set('n', '<leader>c', '<cmd>cq<cr>')
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>')


require("lazy").setup({
spec = { 
{"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
{"nvim-neo-tree/neo-tree.nvim", lazy = false, dependencies = { 'MunifTanjim/nui.nvim' }, opts = { 
		filesystem = { filtered_items = { visible = "true" }, }, }, },
{"norcalli/nvim-colorizer.lua", lazy = false},
{'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' }},
{'windwp/nvim-autopairs', event = "InsertEnter", config = true},
{"folke/which-key.nvim", event = "VeryLazy", keys = {
		{"<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps (which-key)"},},},
{"folke/tokyonight.nvim", lazy = false},
{"neovim/nvim-lspconfig", lazy = false, dependencies = {
				{ "ms-jpq/coq_nvim", branch = "coq" }, 
				{ "ms-jpq/coq.artifacts", branch = "artifacts" },
				},
				  init = function()
				    vim.g.coq_settings = { auto_start = 'shut-up' }end,
				},
},
})

vim.cmd[[colorscheme tokyonight-night]]
