{pkgs ? import <nixpkgs> {}}:
pkgs.mkShellNoCC {
  packages = with pkgs; [
    # nix
    nixd
    alejandra
    statix
    deadnix

    # lua
    lua-language-server
    luajitPackages.luacheck
    stylua
  ];
}
