{
  description = "infra-shell";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

  outputs = { self, nixpkgs }:
    let
      stableSystems = ["x86_64-linux"  "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
      forAllSystems = nixpkgs.lib.genAttrs stableSystems;
      pkgsFor = nixpkgs.lib.genAttrs stableSystems (
        system: import nixpkgs { inherit system; config.allowUnfree = true; }
      );
    in rec {
      devShells = forAllSystems (system: let
        pkgs = pkgsFor.${system};
      in {
        default = let
          pythonPkgs = pkgs.python312.withPackages (
            _: with (pkgs.python312Packages); [
              ipython pyyaml jinja2 pyopenssl cryptography hvac
            ]
          );
        in pkgs.mkShellNoCC {
          packages = with pkgs.buildPackages; [
            # misc
            git openssh jq fzf silver-searcher direnv
            # networking
            curl nmap nettools dnsutils
            # infra
            terraform ansible_2_17
            # security
            pass vault pwgen
            # cloud
            aliyun-cli awscli doctl
            hcloud scaleway-cli
            google-cloud-sdk
          ];

          shellHook = ''
            make checks
          '';
        };
      });
    };
}
