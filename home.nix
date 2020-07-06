{ config, pkgs, ... }:

{
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
  ];
  home.sessionVariables = {
    LANG = "en_US.UTF-8";
  };

  fonts.fontconfig.enable = true;

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
    terminal = "tmux-256color";
    extraConfig = ''
      set-option -g mouse on
      set-option -sa terminal-overrides ',alacritty:RGB'

# Split Windows
      bind | split-window -h
      bind - split-window -v

# Automatically set window title
      set-window-option -g automatic-rename on
      set-option -g set-titles on

# Setting a quick way to reload config
      bind r source-file ~/.tmux.conf

# Vim keys for navigating panes
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

#+----------------+
#+ Plugin Support +
#+----------------+
#+--- tmux-prefix-highlight ---+
      set -g @prefix_highlight_fg black
      set -g @prefix_highlight_bg brightcyan

#+---------+
#+ Options +
#+---------+
      set -g status-interval 1
      set -g status on

#+--------+
#+ Status +
#+--------+
#+--- Layout ---+
      set -g status-justify left

#+--- Colors ---+
      set -g status-style bg=black
      set -g status-style fg=white

#+-------+
#+ Panes +
#+-------+
      set -g pane-border-style bg=black
      set -g pane-border-style fg=black
      set -g pane-active-border-style bg=black
      set -g pane-active-border-style fg=brightblack
      set -g display-panes-colour black
      set -g display-panes-active-colour brightblack

#+------------+
#+ Clock Mode +
#+------------+
      setw -g clock-mode-colour cyan

#+----------+
#+ Messages +
#+---------+
      set -g message-style fg=cyan
      set -g message-style bg=brightblack
      set -g message-command-style fg=cyan
      set -g message-command-style bg=brightblack
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

      audio_output {
      type "fifo"
      name "fifo ouput"
      path "/tmp/mpd.fifo"
      format "44100:16:2"
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
  home.stateVersion = "20.03";
}
