{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # C/C++
    gnumake
    gcc

    # Nix
    alejandra
    nil

    # Rust
    cargo

    # Lua
    lua-language-server

    # Python
    pyright
  ];
}
