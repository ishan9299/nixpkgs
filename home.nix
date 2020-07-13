{ config, pkgs, ... }:

{
  home.username = "me";
  home.homeDirectory = "/home/me";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = [
    pkgs.neofetch
    pkgs.fzf
    pkgs.ripgrep
    pkgs.fd
    pkgs.glibcLocales
    pkgs.trash-cli
    pkgs.niv
    pkgs.lf
    pkgs.stow
    pkgs.ncmpcpp
    pkgs.mpd
    pkgs.youtube-dl
    pkgs.mpc_cli
    pkgs.weechat
    pkgs.cava
  ];
  home.sessionVariables = {
    LANG = "en_US.UTF-8";
  };

  fonts.fontconfig.enable = true;

  programs.bat = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.broot = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.htop = {
    enable = true;
    colorScheme = 6;
    treeView = true;
  };

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    keyMode = "vi";
    escapeTime = 0;
    customPaneNavigationAndResize = true;
    sensibleOnTop = false;
    terminal = "screen-256color";
    extraConfig = ''
#+--------- Random Config -------+
      set-option -g mouse on
      set-option -sa terminal-overrides ',xterm-256color*:Tc'
      set -g status-left-length 20

#+------- Split Windows -------+
      bind | split-window -h
      bind - split-window -v

#+------- Automatically set window title ---------+
      set-window-option -g automatic-rename on
      set-option -g set-titles on

#+------- Setting a quick way to reload config ---------+
      bind r source-file ~/.tmux.conf

#+------- Vim keys for navigating panes ----------+
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

#+------- Colorscheme -------+
      set -g status-style bg=default
      set -g status-style fg=white
      set-window-option -g window-status-current-style fg=green

#+---------- Alignment ----------+
      set-option -g status-justify centre
    '';
  };

  programs.rtorrent = {
    enable = true;
  };

  services.mpd = {
    enable = true;
    musicDirectory = "/home/me/Music";
    dataDir = "/home/me/.local/share/mpd";
    extraConfig = ''
      auto_update "yes"
      log_file "syslog"

      audio_output {
      type "pulse"
      name "pulse audio"
      }
    '';
  };

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
