
# user configuration.

{ config, pkgs, home-manager, ... }:

{
  users.users = {
    florian = {
      isNormalUser = true;
      home = "/home/florian";
      extraGroups = [ "wheel" "networkmanager" "docker" ];      

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
      ];
    };
  };

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
