{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "mikan";
  home.homeDirectory = "/Users/mikan";
  home.my = {
    enable = true;
    gui = false;
    development = true;
    entertainment = true;
  };
  home.file.".ssh/config".source = ./ssh_config;

  home.packages = with pkgs; [ nil nixfmt ];
  programs.zsh = { envExtra = builtins.readFile ./zshenv; };

  programs.git = {
    userName = "Tachibana Kiyomi";
    userEmail = "me@yuru.me";
    signing.key = "FFF6DDE2181C1F55E8885470C02D23F17563AA95";
    signing.signByDefault = false;
  };
}
