{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # C/C++
    gnumake
    gcc

    # Nix
    alejandra
    nixpkgs-fmt
    nil

    # Rust
    cargo

    # Lua
    lua-language-server
    stylua

    # Python
    pyright

    # JS/TS
    nodejs
  ];
}
