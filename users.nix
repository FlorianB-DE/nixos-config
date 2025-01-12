
# user configuration.

{ config, pkgs, home-manager, ... }:

{
  users.users = {
    jessica = {
        isNormalUser = true;
        home = "/home/jessica";
        packages = with pkgs; [
            librewolf
            steam
        ];    
    };

    florian = {
      isNormalUser = true;
      home = "/home/florian";
      extraGroups = [ "wheel" "networkmanager" "docker" "libvirtd" ];

      packages = with pkgs; [
        librewolf
        firefox
        libsForQt5.yakuake
        gimp-with-plugins
        discord
        steam
        vscode
        jetbrains-toolbox
        obs-studio
        teams-for-linux
        spotify
        element-desktop
        bitwarden
        evolution
        evolution-ews
        signal-desktop
        telegram-desktop
    	filezilla
        vlc
        prismlauncher
        kdePackages.kate
        postman
        kbibtex
        kdePackages.kcalc
        libreoffice-qt-fresh
        hunspell
        hunspellDicts.de_DE
        hunspellDicts.en_GB-ize
        zotero
        piper
        # lutris
        (lutris.override {
          extraLibraries =  pkgs: [
            # List library dependencies here
          ];
          extraPkgs = pkgs: [
            wineWowPackages.full
            wineWow64Packages.full
            winetricks
             # List package dependencies here
          ];
        })
      ];
    };
  };

  environment.interactiveShellInit = ''
    alias n='nvim'; alias yeet='git push'
  '';

  security.sudo.extraRules= [
    {  
      users = [ "florian" ];
      commands = [
        { 
          command = "ALL" ;
          options= [ "NOPASSWD" ]; # "SETENV" # Adding the following could be a good idea
        }
      ];
    }
  ];

  programs.direnv.enable = true;

  home-manager.users.florian = {
    programs.git = {
      enable = true;
      userName = "Florian Becker";
      userEmail = "info@florianbecker.eu";

      extraConfig = {
        init.defaultBranch = "main";
        push = { autoSetupRemote = true; };
      };
    };
  };
}
