{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = [
  pkgs.neofetch
  pkgs.fzf
  pkgs.ripgrep
  pkgs.fd
  pkgs.trash-cli
  pkgs.niv
  pkgs.lf
  pkgs.stow
  pkgs.ncmpcpp
  pkgs.youtube-dl
  pkgs.mpc_cli
  ];

  fonts.fontconfig.enable = true;

  programs.direnv.enable = true;
  programs.direnv.enableFishIntegration = true;
  programs.starship.enable = true;
  programs.starship.enableFishIntegration = true;
  programs.broot.enable = true;
  programs.broot.enableFishIntegration = true;

  services.mpd.enable = true;
  services.mpd.musicDirectory = "/home/me/Music";
  services.mpd.dataDir = "/home/me/.local/share/mpd";
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";
}
