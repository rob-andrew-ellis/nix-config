{pkgs, ...}: {
  environment.systemPackages = with pkgs.gnomeExtensions; [
    pop-shell
    unite
    blur-my-shell
    logo-menu
    custom-accent-colors
  ];
}
