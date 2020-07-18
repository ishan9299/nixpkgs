# rev is the commit hash
self: super:
{
  neovim-unwrapped = super.neovim-unwrapped.overrideAttrs(old: {
    version = "master";
    src = super.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "a02a267f8ad4b6d8b9038d2c7d9b85f03e734814";
      sha256 = "0dnv8j4li6wlyz7fw24vch3dd9jmnqj6321g0wr6m317x5445i2b";
    };
  });
}
