-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = false, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
    },

    -- customize lsp formatting options
    formatting = {
      format_on_save = {
        -- Formatting on save is handled in lua/mappings.lua so it can be toggled.
        enabled = false,
        allow_filetypes = {}, -- list of filetypes to allow
        ignore_filetypes = {}, -- list of filetypes to ignore
      },
      disabled = {
        -- "lua_ls", -- example: disable Lua LSP formatting
      },
      timeout_ms = 1000,
    },

    -- enable servers that you already have installed without mason
    servers = {
      "ts_ls", -- TypeScript / JavaScript
      "clangd", -- C / C++
      "gopls", -- Go
      "omnisharp", -- C#
      "prismals",

      -- "pyright",  -- uncomment if you want Python
    },

    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      clangd = {
        capabilities = { offsetEncoding = { "utf-8" } },
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy=false",
          "--completion-style=bundled",
          "--header-insertion=never",
          "--query-driver=/usr/bin/g++,/usr/bin/c++,/usr/local/bin/g++*",
        }, -- points to CMake database
        root_dir = require("lspconfig.util").root_pattern("CMakeLists.txt", ".git"),
      },
      gopls = {
        settings = {
          gopls = {
            analyses = { unusedparams = true, shadow = true },
            staticcheck = true,
          },
        },
      },
      tsserver = {
        init_options = {
          preferences = {
            disableSuggestions = false,
          },
        },
      },
      omnisharp = {
        cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
        enable_editorconfig_support = true,
        enable_ms_build_load_projects_on_demand = false,
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
      },
    },

    -- keep handlers empty unless you want to override specific servers
    handlers = {
      -- rust_analyzer = false, -- disable server completely
      -- pyright = function(_, opts) require("lspconfig").pyright.setup(opts) end,
    },

    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      lsp_codelens_refresh = {
        cond = "textDocument/codeLens",
        {
          event = { "InsertLeave", "BufEnter" },
          desc = "Refresh codelens (buffer)",
          callback = function(args)
            if require("astrolsp").config.features.codelens then
              if vim.lsp.codelens.enable then
                vim.lsp.codelens.enable(true, { bufnr = args.buf })
              else
                vim.lsp.codelens.refresh { bufnr = args.buf }
              end
            end
          end,
        },
      },
    },

    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        ["<Leader>uY"] = {
          function() require("astrolsp.toggles").buffer_semantic_tokens() end,
          desc = "Toggle LSP semantic highlight (buffer)",
          cond = function(client)
            return client:supports_method "textDocument/semanticTokens/full" and vim.lsp.semantic_tokens ~= nil
          end,
        },
      },
    },

    -- Custom on_attach for extra keymaps
    on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    end,
  },
}
