{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/basics/
  # env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = with pkgs; [ git flutter cargo-binstall ungoogled-chromium rustup openssl.dev openssl zlib ];

  # https://devenv.sh/languages/
  # languages.rust.enable = true;

  languages.dart.enable = true;
  # languages.rust.enable = true;

  # https://devenv.sh/processes/
  # processes.cargo-watch.exec = "cargo-watch";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/
  scripts.serve-web.exec = ''
    flutter pub run flutter_rust_bridge build-web --dart-root "$(pwd)" --verbose
    flutter run --web-header=Cross-Origin-Opener-Policy=same-origin --web-header=Cross-Origin-Embedder-Policy=require-corp -d web-server -v --wasm --release --web-port 8080
  '';

  enterShell = ''
    cargo binstall flutter_rust_bridge_codegen wasm-pack cargo-expand -y

    export PATH="$PATH:$HOME/.cargo/bin"
    export CHROME_EXECUTABLE="$(pwd)/scripts/chromium-wrapper.sh"

    export LD_LIBRARY_PATH="${pkgs.zlib.outPath}/lib:$LD_LIBRARY_PATH" 
  '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # https://devenv.sh/tests/
  # enterTest = ''
  #   echo "Running tests"
  #   git --version | grep --color=auto "${pkgs.git.version}"
  # '';

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
