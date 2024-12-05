# Begin texlive setup
TEXLIVE_PREFIX=/usr
export TEXLIVE_PREFIX

export PATH=$PATH:\$TEXLIVE_PREFIX/texmf-dist/doc/info
export PARH=$PATH:\$TEXLIVE_PREFIX/bin/x86_64-linux

TEXMFCNF=\$TEXLIVE_PREFIX/texmf-dist/web2c
export TEXMFCNF

# End texlive setup
