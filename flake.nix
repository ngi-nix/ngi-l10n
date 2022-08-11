{
  description = "Localisation efforts for the nix ecosystem.";

  inputs.mdbook.url = "github:XAMPPRocky/mdBook/fluent";
  inputs.mdbook.flake = false;
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils, mdbook}:
    flake-utils.lib.eachDefaultSystem 
(system: let
  pkgs = nixpkgs.legacyPackages.${system};
  lib = pkgs.lib;
  deps = with pkgs; [
            cargo
            rustc
            rustfmt
        ];
  packageName = "mdbook";
  src = pkgs.nix-gitignore.gitignoreSource [] mdbook;
in 
  {
        packages.${packageName} = pkgs.rustPlatform.buildRustPackage {
          pname = packageName;
          version = (lib.importTOML (mdbook + /Cargo.toml)).package.version;

          cargoLock.lockFile = (mdbook + /Cargo.lock);
          inherit src;
        };

        defaultPackage = self.packages.${system}.${packageName};

        devShell = pkgs.mkShell {
          buildInputs = deps;
        };
  });
}
