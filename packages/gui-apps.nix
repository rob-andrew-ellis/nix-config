{
  config,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    firefox
    kitty
    vesktop
    discord
    gnome3.gnome-tweaks
    gnome.dconf-editor
    gimp
    gnome-extension-manager
    gradience
    ungoogled-chromium
    vial
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
