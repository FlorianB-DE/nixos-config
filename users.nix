
# user configuration.

{ config, pkgs, home-manager, ... }:

{

  nix.settings.trusted-users = [ "@wheel" ];
  users.groups.dev = {};
  users.users = {

    florian = {
      isNormalUser = true;
      home = "/home/florian";
      extraGroups = [ "wheel" "networkmanager" "docker" "libvirtd" "dev" ];

      packages = with pkgs; [
        rustdesk-flutter
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
        teamspeak3
        unetbootin
        jetbrains.jdk
        firefox-devedition
	    chromium
        inkscape
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
