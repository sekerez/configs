---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "go",
      "terraform",
      "typescript",
      "python",
      "rust",
    },
  },
}
