#!/usr/bin/env sh

# Originally from https://github.com/latex3/latex3

# See if there is a cached version of TL available
export PATH=/tmp/texlive/bin/x86_64-linux:$PATH
if ! command -v texlua > /dev/null; then
  # Obtain TeX Live
  wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
  tar -xzf install-tl-unx.tar.gz
  cd install-tl-*

  ./install-tl --profile=texlive.profile

  cd ..
fi

# Update the TL install but add nothing new
tlmgr update --self --all --no-auto-install
