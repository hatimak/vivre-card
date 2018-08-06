#!/usr/bin/env sh

# Originally from https://github.com/latex3/latex3

export PATH=/tmp/texlive/bin/x86_64-linux:$PATH

# See if there is a cached version of TL available
if ! command -v texlua > /dev/null; then
	# Obtain TeX Live
	wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
	tar -xzf install-tl-unx.tar.gz
	cd install-tl-*

	cat > texlive.profile <<-EOF
		selected_scheme scheme-custom
		TEXDIR /tmp/texlive
		TEXMFLOCAL /tmp/texlive/texmf-local
		TEXMFSYSCONFIG /tmp/texlive/texmf-config
		TEXMFSYSVAR /tmp/texlive/texmf-var
		TEXMFCONFIG ~/.texlive/texmf-config
		TEXMFHOME ~/texmf
		TEXMFVAR ~/.texlive/texmf-var
		binary_x86_64-linux 1
		collection-basic 1
		collection-bibtexextra 1
		collection-binextra 1
		collection-context 1
		collection-fontsextra 1
		collection-fontsrecommended 1
		collection-fontutils 1
		collection-formatsextra 1
		collection-games 1
		collection-humanities 1
		collection-langarabic 1
		collection-langchinese 1
		collection-langcjk 1
		collection-langcyrillic 1
		collection-langczechslovak 1
		collection-langenglish 1
		collection-langeuropean 1
		collection-langfrench 1
		collection-langgerman 1
		collection-langgreek 1
		collection-langitalian 1
		collection-langjapanese 1
		collection-langkorean 1
		collection-langother 1
		collection-langpolish 1
		collection-langportuguese 1
		collection-langspanish 1
		collection-latex 1
		collection-latexextra 1
		collection-latexrecommended 1
		collection-luatex 1
		collection-mathscience 1
		collection-metapost 1
		collection-music 1
		collection-pictures 1
		collection-plaingeneric 1
		collection-pstricks 1
		collection-publishers 1
		collection-xetex 1
		instopt_adjustpath 1
		instopt_adjustrepo 1
		instopt_letter 0
		instopt_portable 1
		instopt_write18_restricted 1
		tlpdbopt_autobackup 0
		tlpdbopt_backupdir tlpkg/backups
		tlpdbopt_create_formats 1
		tlpdbopt_desktop_integration 1
		tlpdbopt_file_assocs 1
		tlpdbopt_generate_updmap 0
		tlpdbopt_install_docfiles 0
		tlpdbopt_install_srcfiles 0
		tlpdbopt_post_code 1
		tlpdbopt_w32_multi_user 1
	EOF

	./install-tl --profile=texlive.profile

	cd ..
fi

# Update the TL install but add nothing new
tlmgr update --self --all --no-auto-install
