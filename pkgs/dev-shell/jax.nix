{ mkShell
, python3
}:

mkShell rec {
  name = "dev-with-jax";

  packages = [
    (python3.withPackages (p: with p; [
      jaxlib
      jax
      equinox
      mujoco-mjx
      flax
    ]))
  ];
}
