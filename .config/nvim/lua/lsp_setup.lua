local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local ok_installer, lsp_installer = pcall(require, "nvim-lsp-installer")
local ok_rusttools, rust_tools = pcall(require, "rust-tools")

local servers = {
    "html", "cssls", "cssmodules_ls", "emmet_ls", "eslint", "jsonls",
    "phpactor", "sqlls", "ts_ls", "yamlls"
}

if ok_installer then lsp_installer.setup({ ensure_installed = servers }) end

lsp = vim.lsp.config;

if ok_cmp then
    local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

    local on_attach = function()
        vim.keymap.set("n", "<leader>gh", vim.lsp.buf.hover)
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
        vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition)
        vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation)
        vim.keymap.set("n", "<leader>ge", vim.diagnostic.open_float)
        vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next)
        vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "<leader>dl", ":Telescope diagnostics<CR>")
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
        vim.keymap.set("n", "<leader>F",
        ":lua vim.lsp.buf.format({ async = true })<CR>")
    end
end

