{pkgs, ...}: {
  environment.systemPackages = with pkgs.gnomeExtensions; [
    blur-my-shell
    blur-my-light-shell
    pop-shell
  ];
}
