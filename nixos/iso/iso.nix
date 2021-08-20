{ config, pkgs, system ? builtins.currentSystem, ... }:

{
  imports = [
    # https://nixos.wiki/wiki/Creating_a_NixOS_live_CD
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
  ];

  systemd.services.sshd.wantedBy = pkgs.lib.mkForce [ "multi-user.target" ];
  users = {
    mutableUsers = false;
    users.root = {
      openssh.authorizedKeys.keys = [ (import ../keys.nix).astrid ]
    }
  };

  environment.etc = {
    # "install.sh" = {
    #   source = ./install.sh;
    #   mode = "0700";
    # };

    "configuration.nix" = {
      source = ./configuration.nix;
      mode = "0600";
    };
  };
}