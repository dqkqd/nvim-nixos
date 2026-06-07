{pkgs ? import <nixpkgs> {}}:
pkgs.mkShellNoCC {
  packages = with pkgs; [
    # lua
    lua-language-server
    luajitPackages.luacheck
    stylua
  ];
}
