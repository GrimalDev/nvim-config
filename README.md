#[NvChad](https://github.com/NvChad/NvChad) based NVim config

<a href="https://dotfyle.com/GrimalDev/nvim-config-custom"><img src="https://dotfyle.com/GrimalDev/nvim-config-custom/badges/plugins?style=for-the-badge" /></a>

# Install

- Copy the project
- Place it in your ~/.config/nvim/lua (create the folder if it doesn't exist)
- Execute `nvim`
- In neovim make the update sequence `<space>uu`
- Follow the errors to install the commands needed, the lsp with `:Mason` and the all the fuzzy tools

# Lighter version

A lighter version (for servers in my case) is available in the branch [`server-version`](https://github.com/GrimalDev/nvim-config/tree/server-version)

- There are no lsp in this config
- There is still text formatting

# Plugins

### ai

- [yetone/avante.nvim](https://dotfyle.com/plugins/yetone/avante.nvim)

### colorscheme

- [sainnhe/everforest](https://dotfyle.com/plugins/sainnhe/everforest)

### comment

- [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)
- [danymat/neogen](https://dotfyle.com/plugins/danymat/neogen)

### completion

- [zbirenbaum/copilot.lua](https://dotfyle.com/plugins/zbirenbaum/copilot.lua)
- [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)

### debugging

- [rcarriga/nvim-dap-ui](https://dotfyle.com/plugins/rcarriga/nvim-dap-ui)
- [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap)

### deployment

- [coffebar/transfer.nvim](https://dotfyle.com/plugins/coffebar/transfer.nvim)

### diagnostics

- [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)

### editing-support

- [windwp/nvim-ts-autotag](https://dotfyle.com/plugins/windwp/nvim-ts-autotag)
- [debugloop/telescope-undo.nvim](https://dotfyle.com/plugins/debugloop/telescope-undo.nvim)
- [chrisgrieser/nvim-various-textobjs](https://dotfyle.com/plugins/chrisgrieser/nvim-various-textobjs)
- [Wansmer/treesj](https://dotfyle.com/plugins/Wansmer/treesj)

### file-explorer

- [nvim-tree/nvim-tree.lua](https://dotfyle.com/plugins/nvim-tree/nvim-tree.lua)

### formatting

- [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)

### fuzzy-finder

- [ibhagwan/fzf-lua](https://dotfyle.com/plugins/ibhagwan/fzf-lua)
- [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)

### git

- [kdheepak/lazygit.nvim](https://dotfyle.com/plugins/kdheepak/lazygit.nvim)
- [sindrets/diffview.nvim](https://dotfyle.com/plugins/sindrets/diffview.nvim)
- [aaronhallaert/advanced-git-search.nvim](https://dotfyle.com/plugins/aaronhallaert/advanced-git-search.nvim)

### github

- [pwntester/octo.nvim](https://dotfyle.com/plugins/pwntester/octo.nvim)

### icon

- [nvim-tree/nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)

### lsp

- [onsails/lspkind.nvim](https://dotfyle.com/plugins/onsails/lspkind.nvim)
- [smjonas/inc-rename.nvim](https://dotfyle.com/plugins/smjonas/inc-rename.nvim)
- [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
- [jose-elias-alvarez/null-ls.nvim](https://dotfyle.com/plugins/jose-elias-alvarez/null-ls.nvim)

### lsp-installer

- [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)

### markdown-and-latex

- [MeanderingProgrammer/render-markdown.nvim](https://dotfyle.com/plugins/MeanderingProgrammer/render-markdown.nvim)
- [iamcco/markdown-preview.nvim](https://dotfyle.com/plugins/iamcco/markdown-preview.nvim)

### marks

- [ThePrimeagen/harpoon](https://dotfyle.com/plugins/ThePrimeagen/harpoon)

### media

- [HakonHarnes/img-clip.nvim](https://dotfyle.com/plugins/HakonHarnes/img-clip.nvim)

### motion

- [chrisgrieser/nvim-spider](https://dotfyle.com/plugins/chrisgrieser/nvim-spider)
- [folke/flash.nvim](https://dotfyle.com/plugins/folke/flash.nvim)

### nvim-dev

- [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
- [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)

### programming-languages-support

- [akinsho/flutter-tools.nvim](https://dotfyle.com/plugins/akinsho/flutter-tools.nvim)

### search

- [nvim-pack/nvim-spectre](https://dotfyle.com/plugins/nvim-pack/nvim-spectre)

### session

- [gennaro-tedesco/nvim-possession](https://dotfyle.com/plugins/gennaro-tedesco/nvim-possession)

### syntax

- [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
- [kylechui/nvim-surround](https://dotfyle.com/plugins/kylechui/nvim-surround)

### utility

- [kevinhwang91/nvim-ufo](https://dotfyle.com/plugins/kevinhwang91/nvim-ufo)
- [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
- [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
- [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)

### workflow

- [m4xshen/hardtime.nvim](https://dotfyle.com/plugins/m4xshen/hardtime.nvim)

## Language Servers

- clangd
- html
- intelephense
- phpactor
- pyright

> [!NOTE]
>
> - A special thanks to [@ratataque](https://github.com/ratataque)
> - This readme was generated by [Dotfyle](https://dotfyle.com)
