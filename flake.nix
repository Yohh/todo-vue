{
  description = "A Nix flake for nodejs and typescript";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs
    , flake-utils
    , ...
    }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
      };
      fixedNode = pkgs.nodejs_22;
      fixedNodePackages = pkgs.nodePackages.override {
        nodejs = fixedNode;
      };
      vuejs = pkgs.vue-language-server;
    in
    {
      devShell = pkgs.mkShell {
        buildInputs = [
          fixedNode
          fixedNodePackages.npm
          fixedNodePackages.yarn
          fixedNodePackages.typescript
          fixedNodePackages.typescript-language-server
          vuejs
        ];
      };
    });
}
