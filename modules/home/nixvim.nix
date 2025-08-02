{ config, pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    
    # Configuration globale
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    
    # Options Vim
    opts = {
      # Numéros de ligne
      number = true;
      relativenumber = true;
      
      # Indentation
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;
      
      # Recherche
      ignorecase = true;
      smartcase = true;
      hlsearch = true;
      incsearch = true;
      
      # Interface
      wrap = false;
      scrolloff = 8;
      sidescrolloff = 8;
      cursorline = true;
      signcolumn = "yes";
      colorcolumn = "80";
      
      # Système
      swapfile = false;
      backup = false;
      undofile = true;
      updatetime = 50;
      
      # Apparence
      termguicolors = true;
      showmode = false;
    };
    
    # Plugins essentiels
    plugins = {
      # Barre de statut
      lualine = {
        enable = true;
        settings = {
          options = {
            globalstatus = true;
            # Le thème sera automatiquement défini par Stylix
          };
        };
      };
      
      # Explorateur de fichiers
      neo-tree = {
        enable = true;
        closeIfLastWindow = true;
        window = {
          width = 30;
          mappings = {
            "<space>" = "none";
          };
        };
      };
      
      # Git
      gitsigns = {
        enable = true;
        settings = {
          current_line_blame = false;
          signs = {
            add = { text = "│"; };
            change = { text = "│"; };
            delete = { text = "_"; };
            topdelete = { text = "‾"; };
            changedelete = { text = "~"; };
          };
        };
      };
      
      # Fuzzy finder
      telescope = {
        enable = true;
        extensions = {
          fzf-native = {
            enable = true;
          };
        };
        settings = {
          defaults = {
            layout_config = {
              horizontal = {
                prompt_position = "top";
              };
            };
            sorting_strategy = "ascending";
          };
        };
      };
      
      # Completion
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<C-e>" = "cmp.mapping.close()";
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
            "<C-j>" = "cmp.mapping.select_next_item()";
            "<C-k>" = "cmp.mapping.select_prev_item()";
          };
        };
      };
      
      # LSP
      lsp = {
        enable = true;
        servers = {
          # Nix
          nil_ls = {
            enable = true;
            settings = {
              formatting = {
                command = [ "nixfmt" ];
              };
            };
          };
          
          # Python
          pyright = {
            enable = true;
          };
          
          # JavaScript/TypeScript
          ts_ls = {
            enable = true;
          };
          
          # Lua
          lua_ls = {
            enable = true;
          };
          
          # Rust
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
        };
      };
      
      # Treesitter
      treesitter = {
        enable = true;
        nixGrammars = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };
      
      # Autopairs
      nvim-autopairs = {
        enable = true;
      };
      
      # Commentaires
      comment = {
        enable = true;
      };
      
      # Surround
      vim-surround = {
        enable = true;
      };
      
      # Which-key
      which-key = {
        enable = true;
      };
      
      # Indentation guides
      indent-blankline = {
        enable = true;
        settings = {
          indent = {
            char = "│";
          };
        };
      };
      
      # Web devicons (explicitement activé)
      web-devicons = {
        enable = true;
      };
    };
    
    # Keymaps
    keymaps = [
      # Navigation entre les fenêtres
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options = { desc = "Go to left window"; };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options = { desc = "Go to lower window"; };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options = { desc = "Go to upper window"; };
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options = { desc = "Go to right window"; };
      }
      
      # Explorateur de fichiers
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree toggle<CR>";
        options = { desc = "Explorer"; };
      }
      
      # Telescope
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<CR>";
        options = { desc = "Find files"; };
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<CR>";
        options = { desc = "Find grep"; };
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<CR>";
        options = { desc = "Find buffers"; };
      }
      {
        mode = "n";
        key = "<leader>fh";
        action = "<cmd>Telescope help_tags<CR>";
        options = { desc = "Find help"; };
      }
      
      # Buffers
      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>bprevious<CR>";
        options = { desc = "Previous buffer"; };
      }
      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>bnext<CR>";
        options = { desc = "Next buffer"; };
      }
      {
        mode = "n";
        key = "<leader>bd";
        action = "<cmd>bdelete<CR>";
        options = { desc = "Delete buffer"; };
      }
      
      # Déplacement de lignes
      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        options = { desc = "Move line down"; };
      }
      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
        options = { desc = "Move line up"; };
      }
      
      # Garde la sélection lors de l'indentation
      {
        mode = "v";
        key = "<";
        action = "<gv";
      }
      {
        mode = "v";
        key = ">";
        action = ">gv";
      }
      
      # Clear search highlight
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>noh<CR>";
        options = { desc = "Clear search highlight"; };
      }
    ];
    
    # Configuration supplémentaire en Lua
    extraConfigLua = ''
      -- Désactiver les providers inutiles
      vim.g.loaded_node_provider = 0
      vim.g.loaded_perl_provider = 0
      vim.g.loaded_python3_provider = 0
      vim.g.loaded_ruby_provider = 0
      
      -- Highlight on yank
      vim.api.nvim_create_autocmd("TextYankPost", {
        group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
        callback = function()
          vim.highlight.on_yank({ timeout = 200 })
        end,
      })
    '';
  };
}
