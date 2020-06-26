{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = [
  pkgs.neofetch
  pkgs.fzf
  pkgs.ripgrep
  pkgs.fd
  pkgs.exa
  pkgs.trash-cli
  pkgs.niv
  pkgs.lf
  ];

  fonts.fontconfig.enable = true;

  programs.bat.enable = true;
  programs.direnv.enable = true;
  programs.direnv.enableFishIntegration = true;

  services.mpd.enable = true;
  services.mpd.musicDirectory = "/home/me/Music";
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.03";
}
