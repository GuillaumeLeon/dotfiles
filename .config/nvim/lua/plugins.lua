local vim = vim

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

require("lazy").setup({
    {"catppuccin/nvim", name = "catppuccin"},
    "kyazdani42/nvim-web-devicons",
    {"nvim-lualine/lualine.nvim", config = require("lualine_setup")},
    "b0o/mapx.nvim",
    {"simrat39/rust-tools.nvim"},
    {"williamboman/mason.nvim", config = function() 
        require('mason').setup()
    end},
    {"neovim/nvim-lspconfig", config = function()
         require('lsp_setup')
        end
    },
    {
        'esmuellert/nvim-eslint',
        config = function()
            require('nvim-eslint').setup({})
        end,
    },
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            enable = true,
            ensure_installed = {
                "php",
                "bash",
                "html",
                "rust",
                "dockerfile",
                "go",
                "javascript",
                "markdown",
                "rust",
                "sql",
                "svelte",
                "typescript",
                "json",
                "astro",
                "gomod",
                "gowork",
                "graphql",
                "hack",
                "prisma",
                "tsx",
                "css",
                "scss",
            },
            ignore_install = {},
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
        },
    },
    "windwp/nvim-ts-autotag",
    {
        "kyazdani42/nvim-tree.lua",
        config = require("tree_setup")
    },
    "nvim-telescope/telescope-file-browser.nvim",
    {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
    "nvim-telescope/telescope-project.nvim",
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function()
            require("telescope_setup")
        end,
    },
    {"numToStr/Comment.nvim", config = require("comment_setup")},
    {"tpope/vim-surround"},
    "kdheepak/lazygit.nvim",
    "907th/vim-auto-save",
    "farmergreg/vim-lastplace",
    "jessarcher/vim-heritage",
    "AndrewRadev/splitjoin.vim",
    {"windwp/nvim-autopairs", config = require("autopairs_setup")},
    {"prettier/vim-prettier", build = "yarn install --frozen-lockfile --production"},
    {"airblade/vim-rooter", 
        init = function()
            vim.g.rooter_manual_only = 1
        end,
        config = function()
            vim.cmd('Rooter')
        end
    },
    "AndrewRadev/splitjoin.vim",
    {
        "Bleksak/laravel-ide-helper.nvim",
        opts = {
            write_to_models = true,
            save_before_write = true,
            format_after_gen = true,
        },
        enabled = function()
            return vim.fn.filereadable("artisan") ~= 0
        end,
        keys = {
            -- { "<leader>lgm", function() require("laravel-ide-helper").generate_models(vim.fn.expand("%")) end, desc = "Generate Model Info for current model" },
            -- { "<leader>lgM", function() require("laravel-ide-helper").generate_models() end, desc = "Generate Model Info for all models" },
        }
    },
    "sbdchd/neoformat",
})
require("cmp_setup")
