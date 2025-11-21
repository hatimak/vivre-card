%% Start of file `vivre-card.cls'.
% Vivre Card CV Class file
%
% Author:
% Hatim Kanchwala <hatim@hatimak.me>
%
% TODO @hatimak:
% 	license
%	birth date and place must be defined, no infrastructure in place to check if any of it is undefined
%


%-------------------------------------------------------------------------------
% Identification
%-------------------------------------------------------------------------------
\ProvidesClass{vivre-card}[06.2022 v0.1 Vivre Card CV Class by Hatim Kanchwala]
\NeedsTeXFormat{LaTeX2e}


%-------------------------------------------------------------------------------
% Class options
%-------------------------------------------------------------------------------
% (needs to be done before the external package loading because \paperwidth,
% \paperheight and \@ptsize need to be defined before loading geometry and
% fancyhdr)
%-------------------------------------------------------------------------------
% Options for draft or final
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
% Inherit options of article
\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
% Load modular components
%-------------------------------------------------------------------------------
% Package loading, geometry setup, colors, and utility commands
\input{class/vivre-card-setup.tex}

% Style definitions for all text formatting
\input{class/vivre-card-styles.tex}

% Personal information commands and header/footer construction
\input{class/vivre-card-commands.tex}

% CV section environments (Skills, Education, Experience, etc.)
\input{class/vivre-card-sections.tex}

% Cover letter elements
\input{class/vivre-card-letter.tex}