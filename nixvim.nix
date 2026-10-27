{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  # Bring in Nixvim's Home Manager module so programs.nixvim options exist
  imports = [inputs.nixvim.homeModules.nixvim];

  programs.nixvim = {
    enable = true;
    # Use the host (Home Manager) pkgs instance instead of letting nixvim
    # construct its own from `nixpkgs.source`. Combined with
    # home-manager.useGlobalPkgs = true, this makes nixvim build against the
    # system pkgs, so overlays from modules/core/overlays.nix (and nixpkgs.config
    # from modules/core/packages.nix) actually apply.
    # Do NOT set `nixpkgs.source`, `nixpkgs.config`, `nixpkgs.overlays`, or
    # `nixpkgs.pkgs` here; nixvim asserts those are unset when using global
    # packages.
    nixpkgs.useGlobalPackages = true;
    viAlias = false;
    vimAlias = false;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    # Core editor options
    opts = {
      number = true;
      relativenumber = false;
      shiftwidth = 2;
      tabstop = 2;
      softtabstop = 0;
      expandtab = true;
      smartindent = false;
      wrap = true;
      swapfile = true;
      termguicolors = true;
      signcolumn = "no";
      updatetime = 200;
      cursorline = true;
      spell = false;
      spelllang = ["en"];
      # Send all yanks/deletes to the system clipboard (Wayland/X11)
      clipboard = "unnamedplus";
      conceallevel = 2;
      confirm = true;
      ignorecase = true;
      list = true;
      scrolloff = 4;
      sidescrolloff = 8;
      showmode = false;
      #statuscolumn = "nil";
      undofile = true;
      undolevels = 10000;
      linebreak = true;

    };

    colorscheme = "retrobox";

#    # Theme: Catppuccin (mocha)
#    colorschemes.catppuccin = {
#      enable = true;
#      settings = {
#        flavour = "mocha";
#        transparent_background = false;
#        integrations = {
#          lualine = true;
#        };
#      };
#    };
#
#    plugins = {
#      # UI and visuals
#      web-devicons.enable = true;
#      lualine = {
#        enable = true;
#        settings = {
#          options = {theme = "auto";};
#        };
#      };
#      bufferline.enable = true;
#      indent-blankline.enable = true;
#      colorizer.enable = true;
#      illuminate.enable = true;
#
#      # File tree (Neo-tree to match NVF)
#      neo-tree = {
#        enable = true;
#      };
#
#      # Fuzzy finder
#      telescope.enable = true;
#
#      # Treesitter for syntax/TS features
#      treesitter.enable = true;
#      treesitter-context.enable = false;
#
#      # Project management
#      project-nvim = {
#        enable = true;
#        settings = {
#          history.save_dir = "${config.home.homeDirectory}/.local/share/nvim/project_nvim";
#        };
#      };
#
#      # Notifications and UI polish
#      notify.enable = true;
#      noice.enable = false;
#
#      # Startup dashboard
#      alpha = {
#        enable = true;
#        theme = "dashboard"; # required by nixvim: either set a theme or a custom layout
#      };
#
#      # Git integrations
#      gitsigns.enable = true;
#      diffview.enable = true;
#
#      # Motions and editing helpers
#      hop.enable = true;
#      leap.enable = true;
#      vim-surround.enable = true;
#      comment.enable = true;
#      which-key.enable = true;
#
#      # Autopairs for (), {}, [], '', "", etc.
#      nvim-autopairs = {
#        enable = true;
#        settings = {
#          check_ts = true; # leverage Treesitter for smarter pairing
#          enable_check_bracket_line = false;
#          fast_wrap = {
#            enable = true;
#            map = "<M-e>"; # Alt+e to fast-wrap
#            chars = ["{" "[" "(" "\"" "'" "`"];
#          };
#        };
#      };
#
#      # Terminal
#      toggleterm = {
#        enable = true;
#        settings = {direction = "float";};
#      };
#
#      # Diagnostics UI
#      trouble.enable = true;
#
#      # Markdown preview
#      markdown-preview.enable = true;
#
#      # Completion and snippets
#      blink-cmp = {
#        enable = true;
#        settings = {
#          keymap = {
#            preset = "default";
#            "<CR>" = ["accept" "fallback"];
#            "<Tab>" = ["select_next" "fallback"];
#            "<S-Tab>" = ["select_prev" "fallback"];
#          };
#          appearance = {
#            nerd_font_variant = "mono";
#          };
#          completion = {
#            documentation = {
#              auto_show = true;
#              auto_show_delay_ms = 500;
#            };
#          };
#          sources = {
#            default = ["lsp" "path" "snippets" "buffer"];
#          };
#          snippets = {
#            preset = "luasnip";
#          };
#          fuzzy = {
#            implementation = "prefer_rust_with_warning";
#          };
#          signature = {
#            enabled = true;
#          };
#        };
#      };
#
#      luasnip.enable = true;
#      friendly-snippets.enable = true;
#
#      # Signature help while typing function params
#      lsp-signature.enable = true;
#
#      # LSP configuration
#      lsp = {
#        enable = true;
#        servers = {
#          nil_ls.enable = true;
#          lua_ls.enable = true;
#          pyright.enable = true;
#          # ts_ls (TypeScript) intentionally disabled
#          html.enable = true;
#          cssls.enable = true;
#          clangd.enable = true;
#          zls.enable = false;
#          marksman.enable = false;
#          hyprls.enable = true;
#          # hyprls is optional; keep tools available via extraPackages
#        };
#        keymaps = {
#          diagnostic = {
#            "<leader>dl" = "open_float";
#            "[d" = "goto_prev";
#            "]d" = "goto_next";
#          };
#        };
#      };
#
#      # Formatter: conform.nvim (Prettierd, Stylua, etc.)
#      conform-nvim = {
#        enable = true;
#        settings = {
#          formatters_by_ft = {
#            nix = ["alejandra"];
#            lua = ["stylua"];
#            javascript = ["prettierd"];
#            # TypeScript formatters intentionally disabled
#            javascriptreact = ["prettierd"];
#            css = ["prettierd"];
#            html = ["prettierd"];
#            markdown = ["prettierd"];
#            sh = ["shfmt"];
#          };
#          format_on_save = {
#            lsp_fallback = true;
#          };
#        };
#      };
#    };
#
#    # Keymaps aligned with your NVF setup
#    keymaps = [
#      # Insert-mode escape
#      {
#        key = "jk";
#        mode = ["i"];
#        action = "<ESC>";
#        options.desc = "Exit insert mode";
#      }
#
#      # Telescope
#      {
#        key = "<leader>ff";
#        mode = ["n"];
#        action = "<cmd>Telescope find_files<cr>";
#        options.desc = "Search files by name";
#      }
#      {
#        key = "<leader>lg";
#        mode = ["n"];
#        action = "<cmd>Telescope live_grep<cr>";
#        options.desc = "Search files by contents";
#      }
#
#      # File tree (Neo-tree)
#      {
#        key = "<leader>fe";
#        mode = ["n"];
#        action = "<cmd>Neotree toggle<cr>";
#        options.desc = "File browser toggle";
#      }
#
#      # Terminal
#      {
#        key = "<leader>t";
#        mode = ["n"];
#        action = "<cmd>ToggleTerm<CR>";
#        options.desc = "Toggle terminal";
#      }
#
#      # Comment line (Doom Emacs style)
#      {
#        key = "<leader>.";
#        mode = ["n"];
#        action = "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>";
#        options.desc = "Comment line";
#      }
#      {
#        key = "<leader>.";
#        mode = ["v"];
#        action = "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>";
#        options.desc = "Comment selection";
#      }
#
#      # Diagnostics
#      {
#        key = "<leader>dj";
#        mode = ["n"];
#        action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
#        options.desc = "Go to next diagnostic";
#      }
#      {
#        key = "<leader>dk";
#        mode = ["n"];
#        action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
#        options.desc = "Go to previous diagnostic";
#      }
#      {
#        key = "<leader>dl";
#        mode = ["n"];
#        action = "<cmd>lua vim.diagnostic.open_float()<CR>";
#        options.desc = "Show diagnostic details";
#      }
#      {
#        key = "<leader>dt";
#        mode = ["n"];
#        action = "<cmd>Trouble diagnostics toggle<cr>";
#        options.desc = "Toggle diagnostics list";
#      }
#
#      # Disable accidental F1 across modes
#      {
#        key = "<F1>";
#        mode = ["n" "i" "v" "x" "s" "o" "t" "c"];
#        action = "<Nop>";
#        options.desc = "Disable accidental F1 help";
#      }
#      # Help mappings
#      {
#        key = "<leader>h";
#        mode = ["n"];
#        action = ":help<Space>";
#        options = {
#          desc = "Open :help prompt";
#          nowait = true;
#        };
#      }
#      {
#        key = "<leader>H";
#        mode = ["n"];
#        action = ":help <C-r><C-w><CR>";
#        options.desc = "Help for word under cursor";
#      }
#    ];
#
#    # Runtime tools and language servers
#    extraPackages = with pkgs; [
#      ripgrep
#      fd
#      bat
#      # Wayland clipboard provider used by Neovim for system clipboard access
#      wl-clipboard
#      lazygit
#      nil
#      hyprls
#      # TypeScript tooling intentionally disabled
#      vscode-langservers-extracted
#      pyright
#      lua-language-server
#      zls
#      marksman
#      multimarkdown
#      clang-tools
#      prettierd
#      stylua
#      shfmt
#      nixpkgs-fmt
#      figlet
#      toilet
#      bash-language-server
#      tailwindcss-language-server
#    ];

    # Diagnostic UI and notify background tweaks
    extraConfigLua = ''
      local map = vim.keymap.set
      -- better up/down
      map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
      map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
      map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
      map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
      
      -- Move to window using the <ctrl> hjkl keys
      map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
      map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
      map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
      map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
      
      -- Resize window using <ctrl> arrow keys
      map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
      map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
      map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
      map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
      
      
      local function augroup(name)
        return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
      end
      
      -- Check if we need to reload the file when it changed
      vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
        group = augroup("checktime"),
        callback = function()
          if vim.o.buftype ~= "nofile" then
            vim.cmd("checktime")
          end
        end,
      })
      
      -- go to last loc when opening a buffer
      vim.api.nvim_create_autocmd("BufReadPost", {
        group = augroup("last_loc"),
        callback = function(event)
          local exclude = { "gitcommit" }
          local buf = event.buf
          if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
            return
          end
          vim.b[buf].lazyvim_last_loc = true
          local mark = vim.api.nvim_buf_get_mark(buf, '"')
          local lcount = vim.api.nvim_buf_line_count(buf)
          if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
          end
        end,
      })
      
      -- close some filetypes with <q>
      vim.api.nvim_create_autocmd("FileType", {
        group = augroup("close_with_q"),
        pattern = {
          "PlenaryTestPopup",
          "checkhealth",
          "dbout",
          "gitsigns-blame",
          "grug-far",
          "help",
          "lspinfo",
          "neotest-output",
          "neotest-output-panel",
          "neotest-summary",
          "notify",
          "qf",
          "spectre_panel",
          "startuptime",
          "tsplayground",
        },
        callback = function(event)
          vim.bo[event.buf].buflisted = false
          vim.schedule(function()
            vim.keymap.set("n", "q", function()
              vim.cmd("close")
              pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
            end, {
              buffer = event.buf,
              silent = true,
              desc = "Quit buffer",
            })
          end)
        end,
      })
      
      -- Fix conceallevel for json files
      vim.api.nvim_create_autocmd({ "FileType" }, {
        group = augroup("json_conceal"),
        pattern = { "json", "jsonc", "json5" },
        callback = function()
          vim.opt_local.conceallevel = 0
        end,
      })
      
      -- Auto create dir when saving a file, in case some intermediate directory does not exist
      vim.api.nvim_create_autocmd({ "BufWritePre" }, {
        group = augroup("auto_create_dir"),
        callback = function(event)
          if event.match:match("^%w%w+:[\\/][\\/]") then
            return
          end
          local file = vim.uv.fs_realpath(event.match) or event.match
          vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
        end,
      })

    '';
  };

  home.activation.projectNvimHistory = ''
    mkdir -p "$HOME/.local/share/nvim/project_nvim"
    find "$HOME/.local/share/nvim/project_nvim" -type f -size 0 -delete 2>/dev/null || true
  '';
}
