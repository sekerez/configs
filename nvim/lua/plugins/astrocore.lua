local qwerty_default = {
  m = { "m" },
  n = { "n" },
  i = { "i" },
  e = { "e" },
  M = { "M" },
  N = { "N" },
  I = { "I" },
  E = { "E" },
  h = { "h" },
  j = { "j" },
  k = { "k" },
  l = { "l" },
  H = { "H" },
  J = { "J" },
  K = { "K" },
  L = { "L" },
}

local colemak_default = {
  m = { "h" },
  n = { "j" },
  i = { "l" },
  e = { "k" },
  M = { "H" },
  N = { "J" },
  I = { "L" },
  E = { "K" },
  h = { "m" },
  j = { "n" },
  k = { "e" },
  l = { "i" },
  H = { "M" },
  J = { "N" },
  K = { "E" },
  L = { "I" },
}

local qwerty_mappings = {
  n = vim.tbl_extend("force", qwerty_default, { ["L"] = { "<Cmd>bnext<cr>" }, ["H"] = { "<Cmd>bprev<cr>" } }),
  v = qwerty_default,
  x = qwerty_default,
}

local colemak_mappings = {
  n = vim.tbl_extend("force", colemak_default, { ["I"] = { "<Cmd>bnext<cr>" }, ["M"] = { "<Cmd>bprev<cr>" } }),
  v = colemak_default,
  x = colemak_default,
}

local mappings = {
  n = {
    -- Open the dashboard when closing the last buffer
    ["<Leader>c"] = {
      function()
        local bufs = vim.fn.getbufinfo { buflisted = 1 }
        require("astrocore.buffer").close(0)
        if not bufs[2] then require("snacks").dashboard() end
      end,
      desc = "Close buffer",
    },
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<Leader>v"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" },
    ["gf"] = { "gF", desc = "Go to file under cursor" },
    ["<F7>"] = { '<Cmd>execute v:count . "ToggleTerm direction=float"<CR>', desc = "Toggle terminal" },
    ["<C-\\>"] = { '<Cmd>execute v:count . "ToggleTerm direction=float"<CR>', desc = "Toggle terminal" },
    ["<Leader>y"] = { desc = "Yank" },
    ["<Leader>yf"] = {
      function()
        local filepath = vim.fn.expand "%:."
        vim.fn.setreg("+", filepath)
        vim.notify("Yanked file path: " .. filepath)
      end,
      desc = "Yank file path",
    },

    ["<Leader>uq"] = {
      function() require("astrocore").set_mappings(qwerty_mappings) end,
      desc = "Use qwerty mappings",
    },
    ["<Leader>uk"] = {
      function() require("astrocore").set_mappings(colemak_mappings) end,
      desc = "Use colemak mappings",
    },
    -- LSP keys
    ["<Leader>fS"] = {
      function() require("snacks.nvim").picker.lsp_workspace_symbols() end,
      desc = "LSP Workspace Symbols",
    },
  },
  t = {
    ["<C-\\>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
  },
}

local startup_mappings
if os.getenv "COLEMAK" == "true" then
  startup_mappings = colemak_mappings
else
  startup_mappings = qwerty_mappings
end

mappings = vim.tbl_deep_extend("force", mappings, startup_mappings)

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = mappings,
  },
}
