{ pkgs ? import <nixpkgs> {} }:
{
  blackhole-screensaver = pkgs.callPackage ./pkgs/blackhole-screensaver { };
}
