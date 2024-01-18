{
  description = "A very basic flake";

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    rec {
      packages =
        {
          default = self.packages.${system}.haproxy;
          haproxy = pkgs.callPackage ./nix/haproxy.nix { useThreading = true; };
        };
      devShells.default = pkgs.mkShell {
        inputsFrom = [ packages.haproxy ];
        packages = with pkgs; [
          go
          apacheHttpd
        ];
      };
    });
}
