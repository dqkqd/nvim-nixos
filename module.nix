inputs: {
  config,
  wlib,
  lib,
  pkgs,
  ...
}: {
  imports = [wlib.wrapperModules.neovim];

  config = {
    settings.config_directory = ./.;
    specs.lzn = {
      data = with pkgs.vimPlugins; [
        lz-n
      ];
    };
    specs.general = {
      after = ["lzn"];
      lazy = true;
      data = with pkgs.vimPlugins; [
        nvim-treesitter.withAllGrammars
        oil-nvim
        conform-nvim
        lazydev-nvim
        nvim-lint
      ];
    };
    runtimePkgs = config.specCollect (acc: v: acc ++ (v.runtimePkgs or [])) [];
  };

  options = {
    nvim-lib.neovimPlugins = lib.mkOption {
      readOnly = true;
      type = lib.types.attrsOf wlib.types.stringable;
      # Makes plugins autobuilt from our inputs available with
      # `config.nvim-lib.neovimPlugins.<name_without_prefix>`
      default = config.nvim-lib.pluginsFromPrefix "plugins-" inputs;
    };
    settings.cats = lib.mkOption {
      readOnly = true;
      type = lib.types.attrsOf lib.types.bool;
      default = builtins.mapAttrs (_: v: v.enable) config.specs;
    };
    nvim-lib.pluginsFromPrefix = lib.mkOption {
      type = lib.types.raw;
      readOnly = true;
      default = prefix: inputs:
        lib.pipe inputs [
          builtins.attrNames
          (builtins.filter (s: lib.hasPrefix prefix s))
          (map (
            input: let
              name = lib.removePrefix prefix input;
            in {
              inherit name;
              value = config.nvim-lib.mkPlugin name inputs.${input};
            }
          ))
          builtins.listToAttrs
        ];
    };
  };
}
