# nvim-config/plugins

<a href="https://dotfyle.com/GrimalDev/nvim-config-plugins"><img src="https://dotfyle.com/GrimalDev/nvim-config-plugins/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/GrimalDev/nvim-config-plugins"><img src="https://dotfyle.com/GrimalDev/nvim-config-plugins/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/GrimalDev/nvim-config-plugins"><img src="https://dotfyle.com/GrimalDev/nvim-config-plugins/badges/plugin-manager?style=flat" /></a>

> [!NOTE]
>
> This configuration utilises the [NvChad](https://github.com/NvChad/NvChad) framework upgraded to the 2.5 version

## How it looks

- [Everforest](https://github.com/sainnhe/everforest) theme
- Partially Transparent Background

![image](https://raw.githubusercontent.com/GrimalDev/nvim-config/refs/heads/main/images/SCR-20250520-jrtw.png)
![image](https://raw.githubusercontent.com/GrimalDev/nvim-config/refs/heads/main/images/SCR-20250520-jnxd.png)

## Install Instructions

> Install requires Neovim 0.11+. Always review the code before installing a configuration.

Clone the nvchad starter repo into your nvim folder (~/.config/nvim)

```sh

git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

```

Clone the repository in the lua folder (after removing the placeholder files from the nvchad starter) and install the plugins:

```sh
cd ~/.config/nvim/lua && rm -rf ./* && git clone git@github.com:GrimalDev/nvim-config .
```

Move the main-init.lua to the parent directory

```sh
mv main-init.lua ../init.lua
```

## Plugins

### ai

- [yetone/avante.nvim](https://dotfyle.com/plugins/yetone/avante.nvim)

### color

- [max397574/colortils.nvim](https://dotfyle.com/plugins/max397574/colortils.nvim)

### comment

- [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)
- [danymat/neogen](https://dotfyle.com/plugins/danymat/neogen)

### completion

- [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
- [zbirenbaum/copilot.lua](https://dotfyle.com/plugins/zbirenbaum/copilot.lua)

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

### file-explorer

- [nvim-tree/nvim-tree.lua](https://dotfyle.com/plugins/nvim-tree/nvim-tree.lua)

### formatting

- [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)

### fuzzy-finder

- [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
- [ibhagwan/fzf-lua](https://dotfyle.com/plugins/ibhagwan/fzf-lua)

### git

- [kdheepak/lazygit.nvim](https://dotfyle.com/plugins/kdheepak/lazygit.nvim)
- [aaronhallaert/advanced-git-search.nvim](https://dotfyle.com/plugins/aaronhallaert/advanced-git-search.nvim)

### github

- [pwntester/octo.nvim](https://dotfyle.com/plugins/pwntester/octo.nvim)

### icon

- [echasnovski/mini.icons](https://dotfyle.com/plugins/echasnovski/mini.icons)
- [nvim-tree/nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)

### lsp

- [onsails/lspkind.nvim](https://dotfyle.com/plugins/onsails/lspkind.nvim)
- [smjonas/inc-rename.nvim](https://dotfyle.com/plugins/smjonas/inc-rename.nvim)
- [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)

### lsp-installer

- [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)

### markdown-and-latex

- [MeanderingProgrammer/render-markdown.nvim](https://dotfyle.com/plugins/MeanderingProgrammer/render-markdown.nvim)

### media

- [HakonHarnes/img-clip.nvim](https://dotfyle.com/plugins/HakonHarnes/img-clip.nvim)

### motion

- [chrisgrieser/nvim-spider](https://dotfyle.com/plugins/chrisgrieser/nvim-spider)
- [folke/flash.nvim](https://dotfyle.com/plugins/folke/flash.nvim)

### nvim-dev

- [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
- [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)

### session

- [gennaro-tedesco/nvim-possession](https://dotfyle.com/plugins/gennaro-tedesco/nvim-possession)

### syntax

- [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
- [kylechui/nvim-surround](https://dotfyle.com/plugins/kylechui/nvim-surround)

### utility

- [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
- [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
- [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
- [kevinhwang91/nvim-ufo](https://dotfyle.com/plugins/kevinhwang91/nvim-ufo)

## Language Servers

- clangd
- gopls
- html
- intelephense
- lemminx
- marksman
- pyright
- sqls
- volar

This readme was generated by [Dotfyle](https://dotfyle.com)
This uses [NvChad](https://github.com/NvChad/NvChad)
Big up to [Ratataque](https://github.com/ratataque)
