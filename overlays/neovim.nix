# rev is the commit hash
self: super:
{
  neovim-unwrapped = super.neovim-unwrapped.overrideAttrs(old: {
    version = "master";
    src = super.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "7b1b271f43e9ceca3b195e7e3d56147d38919c2b";
      sha256 = "0vg2avfhkmcvp6waazqhnbb5s35j2597nvd0wmszlbhy9c1mgv3c";
    };
  });
}
