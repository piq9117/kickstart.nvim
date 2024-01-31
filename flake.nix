{
  description = "nvim config";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
  };
  outputs = {self, nixpkgs}:
    let
      supportedSystems = ["x86_64-linux"];

      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);
      nixpkgsFor = forAllSystems(system: import nixpkgs {
        inherit system;
        overlays = [ self.overlay ];
      });
    in {
      overlay = final: prev: {};

      packages = forAllSystems (system: {});

      devShells = forAllSystems(system:
        let pkgs = nixpkgsFor.${system};
        in {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              lua-language-server
              gcc
            ];
            shellHook = "export PS1='[$PWD]\n❄ '";
          };
        });
    };
}
