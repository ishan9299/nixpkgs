# rev is the commit hash
self: super:
{
  neovim-unwrapped = super.neovim-unwrapped.overrideAttrs(old: {
    version = "master";
    src = super.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "529251d5e49ed869aa9b4b3a168e97c8e30211d6";
      sha256 = "0482n1vi335sglwicgpg4p9p7p5pk6iy6n5k43sxjjiby7q021m5";
    };
  });
}
