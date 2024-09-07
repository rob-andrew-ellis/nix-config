{pkgs, ...}: {
  set-light-mode = pkgs.writeShellScriptBin "set-light-mode" ''
    gsetings set org.gnome.desktop.interface color-scheme prefer-light
    wal -i $1 -n -l -b "FDF6E3"
    nitrogen --set-zoom-fill $1 --head=0 && nitrogen --set-zoom-fill $1 --head=q
  '';
}
