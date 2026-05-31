{pkgs ? import <nixpkgs> {}}:
pkgs.mkShellNoCC {
  packages = with pkgs; [
    nil
    alejandra
    statix
    vulnix
  ];
}
