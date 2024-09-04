{
  config,
  pkgs,
  ...
}: let
  unstable = import <nixpkgs-unstable> {config = config.nixpkgs.config;};
  set-light-mode = pkgs.writeShellScriptBin "set-light-mode" ''
    gsetings set org.gnome.desktop.interface color-scheme prefer-light
    wal -i $1 -n -l -b "FDFGE3"
    nitrogen --set-zoom-fill $1 --head=0 && nitrogen --set-zoom-fill $1 --head=q
  '';
  set-dark-mode = pkgs.writeShellScriptBin "set-dark-mode" ''
    gsetings set org.gnome.desktop.interface color-scheme prefer-dark
    wal --theme ~/.config/wal/colorschemes/dark/dkeg-stv-custom.json
    nitrogen --set-zoom-fill $1 --head=0 && nitrogen --set-zoom-fill $1 --head=q
  '';
in {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    firefox
    kitty
    fastfetch
    neofetch
    gnumake
    unzip
    gcc
    ripgrep
    xclip
    nerdfonts
    unstable.neovim
    vesktop
    discord
    pure-prompt
    pywal
    alejandra
    nitrogen
    set-light-mode
    set-dark-mode
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
      ];
    };
  };

  users.defaultUserShell = pkgs.zsh;
}
