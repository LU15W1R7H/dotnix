{ pkgs, ... }:
{
  home.username = "luis";
  home.homeDirectory = "/home/luis";

  programs.nushell = {
    enable = true;
    configFile.source = ./config/nushell/config.nu;
    envFile.source = ./config/nushell/env.nu;
  };

  programs.starship = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
  };

  programs.ssh.enable = true;

  programs.nix-index.enable = true;
  
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    openssl
    cacert
    pinentry-gtk2

    gcc
    mold
    gnumake
    cmake

    neovim
    zellij
    helix
    git
    github-cli
    nnn
    btop
    
    exa
    fd
    sd
    wget
    curl
    delta
    procs
    ripgrep
    ripgrep-all
    tealdeer
    diskonaut
    kondo
    comma
    gnuplot

    kitty
    chromium
    brave
    imv
    zathura
    spotify
    xournalpp
    obs-studio
    signal-desktop
    discord

    tectonic
    ffmpeg_5-full

    xdg-user-dirs
    xdg-utils
       

    # fonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    font-awesome
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];


  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;

      desktop = "$HOME/desktop";
      documents = "$HOME/docs";
      download = "$HOME/dl";
      music = "$HOME/media/music";
      pictures = "$HOME/media/img";
      publicShare = "$HOME/tmp/publicshare";
      templates = "$HOME/tmp/templates";
      videos = "$HOME/media/vid";
    };

    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "image/png" = "imv-folder.desktop";
        "image/jpeg" = "imv-folder.desktop";
        "text/plain" = "nvim.desktop";
        "application/pdf" = "org.pwmt.zathura.desktop";
        "video/*" = "ffplay.desktop";
      };
    };

    configFile = {
      "git/config".source = ./config/git;
      "nvim".source = ./config/nvim;
      "helix".source = ./config/helix;
      "kitty/kitty.conf".source = ./config/kitty.conf;
      "zellij/config.yaml".source = ./config/zellij.yaml;
      "sway/config".source = ./config/sway;
      "kanshi/config".source = ./config/kanshi;
      "waybar".source = ./config/waybar;
      "zathura/zathurarc".source = ./config/zathura;
      "starship.toml".source = ./config/starship.toml;
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
