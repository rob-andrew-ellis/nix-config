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
  ];

  xdg.portal = {
    enable = true;
  };
}
