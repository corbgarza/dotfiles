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

vim.keymap.set('n', '<leader>L', '<cmd>Lazy<cr>')
vim.keymap.set('n', '<leader>T', '<cmd>Neotree filesystem reveal right<cr>')

require("lazy").setup({
spec = { {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
{"nvim-neo-tree/neo-tree.nvim", lazy = false, dependencies = { 'MunifTanjim/nui.nvim' }, lazy = false},
{"norcalli/nvim-colorizer.lua", lazy = false},
{'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' }},
{'windwp/nvim-autopairs', event = "InsertEnter", config = true},
{"folke/which-key.nvim", event = "VeryLazy", keys = {{"<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps (which-key)"},},},
{"neovim/nvim-lspconfig", lazy = false, dependencies = {{ "ms-jpq/coq_nvim", branch = "coq" }, { "ms-jpq/coq.artifacts", branch = "artifacts" },},
  init = function()
    vim.g.coq_settings = { auto_start = 'shut-up' }end,
}
},
install = { colorscheme = { "habamax" } },
checker = { enabled = true },
})
