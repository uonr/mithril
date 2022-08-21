{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "mikan";
  home.homeDirectory = "/Users/mikan";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    autocd = true;
    envExtra = builtins.readFile ./zshenv;
    shellAliases = {
    };
    dirHashes = {
    };
  };

  programs.git = {
    enable = true;
    userName = "Tachibana Kiyomi";
    userEmail = "me@yuru.me";
    difftastic.enable = true;
    ignores = [".DS_Store"];
    signing.key = "FFF6DDE2181C1F55E8885470C02D23F17563AA95";
    signing.signByDefault = false;
  };

  programs.helix = { enable = true; };

  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
  };

  home.packages = with pkgs; [
    ripgrep
    jq
    shellcheck
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
