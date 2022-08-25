{ config, pkgs, specialPkgs, ... }:

{
  # Configuration Options
  # https://nix-community.github.io/home-manager/options.html
  imports = [
    ./common/starship.nix
  ];

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

  home.packages = with pkgs; [
    ripgrep
    fd
    btop
    jq
    shellcheck
    rustup
    yt-dlp
    you-get
    du-dust
    mosh
    python3
    tealdeer
    specialPkgs.rnix-lsp
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = false;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    autocd = true;
    # https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html
    defaultKeymap = "emacs";
    dotDir = ".config/zsh";
    history.path = "$HOME/.config/zsh/.zsh_history";
    envExtra = builtins.readFile ./zshenv;
    shellAliases = {
      doco = "docker-compose";
    };
    initExtra = builtins.readFile ./init.zsh;
    dirHashes = { };
    plugins = with pkgs; [
      {
        name = "you-should-use";
        src = "${zsh-you-should-use}/share/zsh/plugins/you-should-use";
      }
      {
        name = "zsh-autopair";
        file = "autopair.zsh";
        src = "${zsh-autopair}/share/zsh/zsh-autopair";
      }
    ];
  };

  programs.git = {
    enable = true;
    userName = "Tachibana Kiyomi";
    userEmail = "me@yuru.me";
    difftastic.enable = true;
    ignores = [ ".DS_Store" ];
    signing.key = "FFF6DDE2181C1F55E8885470C02D23F17563AA95";
    signing.signByDefault = false;
    extraConfig = {
      init = {
        defaultBranch = "master";
      };
    };

    aliases = {
      a = "add .";
      ci = "commit -S";
      cia = "commit -S --amend";
      co = "checkout";
      st = "status";
      br = "branch";
      sw = "switch";
      re = "rebase -i HEAD~10";
      lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
    };
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
    plugins = import ./common/nvim-plugins.nix { inherit pkgs; };
  };

  programs.bat.enable = true;

  programs.zoxide.enable = true;


  programs.tmux = {
    enable = true;
    clock24 = true;
    prefix = "`";
    extraConfig = ''
      set -g mouse on
    '';
    plugins = with pkgs.tmuxPlugins; [
      gruvbox
    ];
  };

  # fzf https://github.com/junegunn/fzf#fzf-tmux-script
  programs.fzf = {
    enable = true;
    defaultCommand = "fd --type f";
    tmux.enableShellIntegration = true;
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
