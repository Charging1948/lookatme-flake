{
  config,
  lib,
  dream2nix,
  ...
}: {
  imports = [
    dream2nix.modules.dream2nix.pip
  ];

  deps = {nixpkgs, ...}: {
    python = nixpkgs.python39;
  };

  name = "lookatme";
  version = "3.0.0rc5";

  buildPythonPackage = {
    format = "wheel";
    pythonImportsCheck = [
      config.name
    ];
  };

  paths.lockFile = "lock.${config.deps.stdenv.system}.json";
  pip = {
    requirementsList = ["${config.name}==${config.version}"];
  };
}
