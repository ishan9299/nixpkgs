# rev is the commit hash
self: super:
{
  neovim-unwrapped = super.neovim-unwrapped.overrideAttrs(old: {
    version = "master";
    src = super.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "f26df8bb66158baacb79c79822babaf137607cd6";
      sha256 = "0ci5bgkw1j4gr2pls84q3vgn859zwwxfnr3wnyqaj5hyimr9yz6h";
    };
  });
}
