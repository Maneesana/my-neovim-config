return {
  "L3MON4D3/LuaSnip",
  config = function(plugin, opts)
    -- Run default AstroNvim LuaSnip configuration
    require "astronvim.plugins.configs.luasnip"(plugin, opts)

    -- Automatically load custom Lua snippets on startup
    require("luasnip.loaders.from_lua").load {
      paths = { vim.fn.stdpath "config" .. "/snippets" },
    }
  end,
}
