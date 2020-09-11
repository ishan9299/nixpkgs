# rev is the commit hash
self: super:
{
  neovim-unwrapped = super.neovim-unwrapped.overrideAttrs(old: {
    version = "master";
    src = super.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "7ba28b1aedcb88ef5643b32dc4a6bf92ac090fed";
      sha256 = "02kmy5cwakzfc10lx39vrqwp31ww69nxfhaagla8ds3hg3a73k2c";
    };
  });
}
