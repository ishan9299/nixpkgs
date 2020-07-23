{ config, pkgs, ... }:

{
  home.username = "me";
  home.homeDirectory = "/home/me";

  home.sessionVariables = {
    EDITOR="emacs";
    WEECHAT_HOME="~/.config/weechat";
  };

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    }))
  ];


  gtk.enable = true;
  gtk.gtk3.extraCss = ''
    window.ssd separator:first-child + headerbar:backdrop,
    window.ssd separator:first-child + headerbar,
    window.ssd headerbar:first-child:backdrop,
    window.ssd headerbar:first-child,
    window.ssd headerbar:last-child:backdrop,
    window.ssd headerbar:last-child,
    window.ssd stack headerbar:first-child:backdrop,
    window.ssd stack headerbar:first-child,
    window.ssd stack headerbar:last-child:backdrop,
    window.ssd stack headerbar:last-child,
    window.ssd decoration,
    window.ssd headerbar.titlebar {
    border-radius: 0;
    }

    window.ssd headerbar * {
    margin-top: -100px;
    color: #1c2022; /* May need to tweak, this matches Adwaita Dark */
    }

    window.ssd headerbar.titlebar,
    window.ssd headerbar.titlebar button.titlebutton {
    border: none;
    font-size: 0;
    height: 0;
    margin: 0;
    max-height: 0;
    min-height: 0;
    padding: 0;
    }
  '';

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = [
    pkgs.neofetch
    pkgs.ripgrep
    pkgs.fd
#    pkgs.glibcLocales
    pkgs.trash-cli
    pkgs.niv
    pkgs.lf
    pkgs.stow
    pkgs.youtube-dl
#    pkgs.weechat
    pkgs.cava
    pkgs.tree
    pkgs.blender
    pkgs.cmus
  ];
  home.sessionVariables = {
    LANG = "en_US.UTF-8";
  };

  fonts.fontconfig.enable = true;

  programs.mpv = {
    enable = true;
  };

  
  programs.bat = {
    enable = true;
    config = {
      theme = "Solarized (light)";
    };
  };

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    defaultCommand = "fd --type file --hidden --follow --no-ignore-vcs --exclude '{.cache,.local,.var,Pictures,Music,Videos,.elfeed}'";
    defaultOptions = [ "--layout=reverse" "--info=inline"];
    # ALT-C
    changeDirWidgetCommand = "fd --type d -H ";
    # CTRL-T
    fileWidgetCommand = "fd . --type f";
    # CTRL-R
    historyWidgetOptions = [ "--sort" "--exact" ];
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacsUnstable;
  };

  programs.htop = {
    enable = true;
    colorScheme = 6;
    treeView = true;
  };

  programs.vscode.enable = true;
  
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    keyMode = "emacs";
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

  programs.alacritty = {
    enable = true;
    settings = {

      shell.program = "/home/me/.nix-profile/bin/tmux";

      window = {
        padding = {
          x = 0;
          y = 0;
        };
      };

      font = {
        normal = {
          family = "Source Code Pro";
          style = "Regular";
        };
        bold = {
          family = "Source Code Pro";
          style = "Regular";
        };
        italic = {
          family = "Source Code Pro";
          style = "Regular";
        };
        size = 14;
      };
    };
  };


  programs.rtorrent = {
    enable = true;
  };

  programs.fish = {
    enable = true;
    shellInit = ''
      set PATH $HOME/.local/bin $HOME/.local/npm/bin $PATH
      set PATH /var/lib/flatpak/exports/bin $PATH

# For nixpkgs make sure glibcLocales is installed with the nixpkgs or home manager
      # bass source /home/me/.nix-profile/etc/profile.d/nix.sh
      # export LOCALE_ARCHIVE=$HOME/.nix-profile/lib/locale/locale-archive
    '';

    plugins = [
      {
        name = "bass";
        src = pkgs.fetchFromGitHub {
          owner = "edc";
          repo = "bass";
          rev = "50eba266b0d8a952c7230fca1114cbc9fbbdfbd4";
          sha256 = "0ppmajynpb9l58xbrcnbp41b66g7p0c9l2nlsvyjwk6d16g4p4gy";
        };
      }
    ];
  };

  services.emacs = {
    enable = true;
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
