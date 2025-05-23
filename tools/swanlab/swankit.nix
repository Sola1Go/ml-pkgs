{ lib, buildPythonPackage, pythonOlder, fetchFromGitHub, pytestCheckHook
, hatchling, hatch-fancy-pypi-readme, hatch-requirements-txt, nanoid, pyyaml }:

buildPythonPackage rec {
  pname = "swankit";
  version = "0.1.2-beta.6";
  format = "pyproject";

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "SwanHubX";
    repo = "SwanLab-Toolkit";
    rev = "v${version}";
    hash = "sha256-uqmi1Zq4GCKVsUE8v7esxSDbfiRzwS5aBFTjnsROUlM=";
  };

  build-system = [ hatchling hatch-fancy-pypi-readme hatch-requirements-txt ];

  pythonImportsCheck = [ "swankit" ];

  nativeCheckInputs = [ pytestCheckHook nanoid pyyaml ];
  disabledTests = [
    "test_default" # requires home directory
  ];

  meta = with lib; {
    description = "Swanlab包工具箱 (toolkit)";
    homepage = "https://github.com/SwanHubX/SwanLab-Toolkit";
    license = licenses.asl20;
    maintainers = with maintainers; [ breakds ];
  };
}
