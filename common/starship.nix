{ ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      rust = {
        symbol = "𝓡 ";
      };
      nix_shell = {
        symbol = "❆ ";
        disabled = true;
      };
      lua = {
        symbol = "☽";
      };
      nodejs = {
        symbol = "⬢ ";
        disabled = true;
      };
      python = {
        symbol = "Py ";
      };
      directory = {
        read_only = " [RO]";
        read_only_style = "yellow";
      };
      terraform = {
        disabled = true;
      };
      package.disabled = true;
    };
  };
}
