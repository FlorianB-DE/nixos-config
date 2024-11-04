
# user configuration.

{ config, pkgs, home-manager, ... }:

{
  users.users = {
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
      ];
    };
  };

  environment.interactiveShellInit = ''
    alias n='nvim'
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
