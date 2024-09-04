{
  config,
  pkgs,
  ...
}: let
  unstable = import <nixpkgs-unstable> {config = config.nixpkgs.config;};
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
