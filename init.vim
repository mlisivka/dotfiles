set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>ai <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
" nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
" nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

      " ['<C-a>'] = cmp.mapping.abort(),
" set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'
  local luasnip = require 'luasnip'

  cmp.setup({
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        -- vim.fn["vsnip#anonymous"](args.body)

        -- For `luasnip` user.
        require('luasnip').lsp_expand(args.body)

        -- For `ultisnips` user.
        -- vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = {
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = "treesitter" },
      -- For vsnip user.
      -- { name = 'vsnip' },

      -- For luasnip user.
      { name = 'luasnip' },

      -- For ultisnips user.
      -- { name = 'ultisnips' },

      { name = 'buffer' },
    },
    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = ({
          Text = "Text",
          Method = "Method",
          Function = "Function",
          Constructor = "Constructor",
          Field = "Field",
          Variable = "Variable",
          Class = "Class",
          Module = "Module",
          Property = "Property",
          Value = "Value",
          Enum = "Enum",
          Snippet = "Snippet",
        })[vim_item.kind]
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          treesitter = "[TreeSitter]",
          luasnip = "[LuaSnip]",
          buffer = "[Buffer]",
        })[entry.source.name]

        return vim_item
      end,
    },
  })

  -- require("luasnip/loaders/from_vscode").load({ paths = { "~/.vim/plugged/friendly-snippets/" } })
  -- require("luasnip/loaders/from_vscode").load()
  require("luasnip/loaders/from_vscode").lazy_load()


  -- Setup lspconfig.
  local nvim_lsp = require('lspconfig')
  nvim_lsp.tsserver.setup{}
  nvim_lsp.solargraph.setup{
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
EOF
