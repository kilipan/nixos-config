{ config, pkgs, ... }:

{
  # User
  home.username = "js";
  home.homeDirectory = "/home/js";

  # User packages
  home.packages = with pkgs; [
    # helix
    # jujutsu
    keepassxc
    kicad
    libreoffice
    neofetch
    neovim
    nnn
    thunderbird
  ];

  # bash settings
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      ".." = "cd ..";
    };
  };

  # direnv settings
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  # git settings
  programs.git = {
    enable = true;
    userName = "kilipan";
    userEmail = "kilipan@tutanota.com";
  };
  # helix settings
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "catppuccin_frappe";

      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
    };
  };
  # jujutsu settings
  programs.jujutsu = {
    enable = true;
    settings = {
      user.name = "kilipan";
      user.email = "kilipan@tutanota.com";
    };
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home manager install and manage itself
  programs.home-manager.enable = true;
}
