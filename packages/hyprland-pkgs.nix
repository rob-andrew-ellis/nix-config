{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    waybar
    dunst
    libnotify
    swww
    rofi-wayland
    networkmanagerapplet
    grim
    slurp
    wl-clipboard
    wlr-randr
    ags
    gtk3
    gnome.adwaita-icon-theme
  ];

  xdg.portal = {
    enable = true;
  };

  nixpkgs.overlays = [
    (final: prev: {
      ags = prev.ags.overrideAttrs (old: {
        buildInputs = old.buildInputs ++ [pkgs.libdbusmenu-gtk3];
      });
    })
  ];

  services.upower.enable = true;
}
