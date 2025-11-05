-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    config = function()
      local opts = {
        -- Make sure to use the names found in `:Mason`
        ensure_installed = {
          "lua-language-server",
          "zls",
          "taplo",
          "codelldb",
          "bacon",
          "bacon-ls",
          -- install any other package
          "tree-sitter-cli",
        },
      }
      require("mason-tool-installer").setup(opts)
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "codelldb" })
    end,
  },
}
