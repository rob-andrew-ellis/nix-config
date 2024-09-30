{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    firefox
    kitty
    vesktop
    gimp
    gnome-extension-manager
    gnome.gnome-tweaks
    ungoogled-chromium
    vial
    obsidian
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
