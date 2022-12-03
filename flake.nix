{
  description = "A very basic flake";
  inputs = { };
  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
      with pkgs;
    {
      devShells.${system}.default = mkShell {

        depsBuildBuild = [ pkg-config ];

        nativeBuildInputs = [ meson ninja pkg-config wayland-scanner glslang ];

        buildInputs = [
          libGL
          wayland
          wayland-protocols
          libinput
          libxkbcommon
          pixman
          xorg.xcbutilwm
          xorg.libX11
          libcap
          xorg.xcbutilimage
          xorg.xcbutilerrors
          mesa
          libpng
          ffmpeg_4
          xorg.xcbutilrenderutil
          seatd
          vulkan-loader
          xwayland
        ];

      };
    };
}
