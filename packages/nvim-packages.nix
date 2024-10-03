{
  config,
  pkgs,
  lib,
  ...
}: {
  config = {
    environment.systemPackages = with pkgs; [
      (neovim.override {
        configure = {
          packages.myVimPackage = with pkgs.vimPlugins; {
            start = [
              nvim-treesitter.withAllGrammars
              # Add other plugins you want to use
            ];
            opt = [];
          };
          customRC = ''
            lua << EOF
            vim.opt.runtimepath:append(",${pkgs.vimPlugins.nvim-treesitter}")
            require'nvim-treesitter.configs'.setup {
            ensure_installed = {'lua', 'nix', 'vim', 'vimdoc', 'query', 'c', 'python'},
              highlight = {
                enable = true,
              },
            }
            EOF
          '';
        };
      })
    ];

    environment.variables = {
      XDG_CACHE_HOME = "$HOME/.cache";
    };
  };
}
