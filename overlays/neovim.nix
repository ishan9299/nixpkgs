# rev is the commit hash
self: super:
{
  neovim-unwrapped = super.neovim-unwrapped.overrideAttrs(old: {
    version = "master";
    src = super.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "602e7505e2cd47ce0f45236a5175709d8ce2c489";
      sha256 = "1dx9j6whcmi5p8sdxfzk19silvmqs2h5ng5pdlrs6jyl1yfqawpm";
    };
  });
}
