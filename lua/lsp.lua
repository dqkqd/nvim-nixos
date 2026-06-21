-- configs
vim.lsp.config("nixd", {
  cmd = { "nixd" },
  filetypes = { "nix" },
  root_markers = { "flake.nix", ".git" },
})

vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  -- Sets the "workspace" to the directory where any of these files is found.
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    ".git",
  },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
    },
  },
})

vim.lsp.config("cssls", {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
})

vim.lsp.config("jsonls", {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  root_markers = { ".git" },
  settings = {
    json = {
      schemas = {
        {
          fileMatch = { "tsconfig*.json" },
          url = "https://json.schemastore.org/tsconfig.json",
        },
        {
          fileMatch = { "manifest.json" },
          url = "https://raw.githubusercontent.com/dqkqd/schemastore/refs/heads/push-kztzllsqstyp/src/schemas/json/webextension.json",
        },
      },
      validate = { enable = true },
    },
  },
})

vim.lsp.config("tombi", {
  cmd = { "tombi", "lsp" },
  filetypes = { "toml" },
  root_markers = { "tombi.toml", "pyproject.toml", ".git" },
})

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  root_markers = {
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "compile_commands.json",
    "compile_flags.txt",
    "configure.ac",
    ".git",
  },
})

vim.filetype.add({
  extension = {
    mdx = "markdown.mdx",
  },
})

vim.lsp.config("marksman", {
  cmd = {
    "marksman",
    "server",
  },
  filetypes = { "markdown", "markdown.mdx" },
  root_markers = { ".marksman.toml", ".git" },
})

vim.lsp.config("tsgo", {
  cmd = {
    "tsgo",
    "--lsp",
    "--stdio",
  },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = {
    ".git",
    "bun.lock",
    "bun.lockb",
    "deno.json",
    "deno.jsonc",
    "deno.lock",
    "package-lock.json",
    "pnpm-lock.yaml",
    "tsconfig.json",
    "yarn.lock",
  },
  settings = {
    typescript = {
      inlayHints = {
        enumMemberValues = {
          enabled = true,
        },
        functionLikeReturnTypes = {
          enabled = true,
        },
        parameterNames = {
          enabled = "literals",
          suppressWhenArgumentMatchesName = true,
        },
        parameterTypes = {
          enabled = true,
        },
        propertyDeclarationTypes = {
          enabled = true,
        },
        variableTypes = {
          enabled = true,
        },
      },
    },
  },
})

vim.lsp.config("svelteserver", {
  cmd = { "svelteserver", "--stdio" },
  filetypes = { "svelte" },
  root_markers = {
    ".git",
    "bun.lock",
    "bun.lockb",
    "deno.json",
    "deno.jsonc",
    "deno.lock",
    "package-lock.json",
    "pnpm-lock.yaml",
    "tsconfig.json",
    "yarn.lock",
  },
})

-- enable
vim.lsp.enable({
  "nixd",
  "lua_ls",
  "cssls",
  "tombi",
  "clangd",
  "marksman",
  "jsonls",
  "tsgo",
  "svelteserver",
})

vim.lsp.inlay_hint.enable(true)
