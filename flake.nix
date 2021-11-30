{
  description = "A library supporting the loading of proprietary formats used by the engine used by the games "Gothic" and "Gothic II" ";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/21.05";
    utils.url = "github:numtide/flake-utils";
    utils.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... }@inputs: inputs.utils.lib.eachSystem [ "x86_64-linux" "i686-linux" ] (system:
    {
        devShell = pkgs.mkShell rec {
            name = "zenlib";

            buildInputs = with pkgs; [
                cmake
                gcc
            ];
        };
    }
  );
}