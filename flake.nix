{
  description = "Catalyst CLI development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      # Change this to your system architecture
      # For Intel Mac: "x86_64-darwin"
      # For M1/M2 Mac: "aarch64-darwin" 
      # For Linux: "x86_64-linux"
      system = "aarch64-darwin";  # Change if needed
      
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          python3
          python3Packages.click
          python3Packages.docker
          python3Packages.requests
          python3Packages.pyyaml
          python3Packages.rich
          python3Packages.pip
        ];
        
        shellHook = ''
          echo "Catalyst CLI development environment loaded!"
          echo "Python packages available: click, docker, requests, pyyaml, rich"
        '';
      };
    };
}