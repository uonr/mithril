{ pkgs, ... }:
with pkgs.vimPlugins;
let
  vim-chinese-document = pkgs.vimUtils.buildVimPlugin {
    name = "vimcdoc";
    pname = "vimcdoc";
    src = pkgs.fetchFromGitHub {
      owner = "yianwillis";
      repo = "vimcdoc";
      rev = "5e612300cac61ceb66dce5cacfe10d64b76b10f5";
      sha256 = "zKXbBMvj4ysdIqcH5RW09ViUprDCZBzp4ves1x995l0=";
    };
  };
  neovim-beacon = pkgs.vimUtils.buildVimPlugin {
    name = "beacon-nvim";
    pname = "beacon-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "DanilaMihailov";
      repo = "beacon.nvim";
      rev = "a786c9a89b2c739c69f9500a2f70f2586c06ec27";
      sha256 = "qD0dwccNjhJ7xyM+yG8bSFUyPn7hHZyC0RBy3MW1hz0=";
    };
  };
in
[
  nvim-autopairs
  editorconfig-vim
  vim-airline
  vim-airline-themes
  vim-surround
  vim-chinese-document
  vim-easymotion
  vim-fish
  gruvbox
  vim-repeat
  vim-sleuth
  vim-nix
  indent-blankline-nvim-lua
  vim-commentary
  neovim-beacon
]
