-- INIT PLUGINS FIRST
vim.g.mapleader = " "

-- OPTIONS
vim.opt.encoding = "UTF-8"
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.mouse = "a"
vim.opt.autoread = true
vim.opt.list = true
vim.opt.signcolumn = "yes"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wildmode = 'longest:full,full' -- complete the longest common match, and allow tabbing the results to complete them
vim.opt.completeopt = 'menuone,longest,preview'

vim.opt.title = true;

vim.opt.termguicolors = true;

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.confirm = true

vim.opt.undofile = true

vim.opt.backup = true

vim.opt.backupdir:remove('.')

vim.api.nvim_create_autocmd({"BufWritePost"}, {
    pattern = {"*.js", "*.ts", "*.tsx", "*.jsx"},
    callback = function() 
        vim.lsp.buf.format() 
    end
})

-- vim.opt.winbar = "%f %m"
vim.opt.wrap = false

require("plugins")

-- THEMES
vim.cmd("colorscheme catppuccin")
vim.opt.background = 'dark'

vim.diagnostic.enable(not vim.diagnostic.is_enabled())

-- vim.lsp.buf.format({ timeout_ms = 2000 })

local ok_m, m = pcall(require, "mapx")

if ok_m then
    m.noremap("<up>", "<nop>", "silent")
    m.noremap("<down>", "<nop>", "silent")
    m.noremap("<left>", "<nop>", "silent")
    m.noremap("<right>", "<nop>", "silent")

    -- lazygit
    m.map("<C-k>", ":LazyGit<CR>", "silent")

    -- FileTree
    m.map("<leader>nn", ":NvimTreeToggle<CR>", "silent")
    
    -- Neoformat
    m.map("<leader>fm", ":Neoformat<CR>", "silent")

end
