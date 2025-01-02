let
  nixpkgs = import <nixpkgs> {};
in
  with nixpkgs;
  stdenv.mkDerivation {
    name = "nisse-env";
    buildInputs = [
      elixir_1_18
      erlang_27
    ];
  }
