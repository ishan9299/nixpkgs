{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = [

    # Applications
    pkgs.blender
    pkgs.hexchat

    #CLI
    pkgs.neofetch
    pkgs.trash-cli

    # Rust Programs
    pkgs.ripgrep
    pkgs.fd
    pkgs.ytop
    pkgs.exa
    pkgs.gitAndTools.gitui

    #Music
    pkgs.puddletag
    pkgs.cmus
    pkgs.cava
    pkgs.youtube-dl

    #Packages for Non-Nixos
    #    pkgs.glibcLocales

  ];

  home.username = "me";
  home.homeDirectory = "/home/me";

  home.sessionVariables = {
    EDITOR="nvim";
  };

  home.sessionVariables = {
    LANG = "en_US.UTF-8";
  };

  #Overlays
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    }))
  ];

  # Programs and their configurations
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
    enableBashIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type file --hidden --follow --no-ignore-vcs --exclude '{.cache,.local,.var,Pictures,Music,Videos,.elfeed}'";
    defaultOptions = [ "--layout=reverse" "--info=inline"];
    # ALT-C
    changeDirWidgetCommand = "fd --type d -H ";
    # CTRL-T
    fileWidgetCommand = "fd . --type f";
    # CTRL-R
    historyWidgetOptions = [ "--sort" "--exact" ];
  };

  programs.nushell = {
    enable = true;
  };

  programs.lf = {
    enable = true;
    settings = {
      color256 = true;
      dirfirst = true;
      drawbox = true;
      shell = "sh";
    };
    keybindings = {
      dD = "trash-put";
    };
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
          family = "Overpass Mono";
          style = "Regular";
        };
        bold = {
          family = "Overpass Mono";
          style = "Regular";
        };
        italic = {
          family = "Overpass Mono";
          style = "Regular";
        };
        size = 14;
      };
    };
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacsGcc;
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      "ll" = "exa -abghHliS";
      "htop" = "ytop";
    };
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

  services.lorri.enable = true;

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
