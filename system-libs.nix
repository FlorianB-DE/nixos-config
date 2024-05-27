{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    vulkan-tools
    glxinfo
    sl
    unzip
    zip
    appimage-run
    libcap
    zlib
    qemu_kvm
  ];
}
