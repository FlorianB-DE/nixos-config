
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
        libsForQt5.yakuake
      ];
    };
  };

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
