%% Start of file `awesome-cv.cls'.
% Vivre Card CV Class file
% TODO @hatimak: rename class file
%
%
% Author:
% Hatim Kanchwala <hatim@hatimak.me>
%
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
% Packages
%-------------------------------------------------------------------------------
% Make fixed length table
\RequirePackage{array}
% Handle list environment
\RequirePackage{enumitem}
% Handle text alignment
\RequirePackage{ragged2e}
% Page layout
\RequirePackage{geometry}
% Make efficient header & footer
\RequirePackage{fancyhdr}
% Manage colors
\RequirePackage{xcolor}
% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Toolbox of programming tools
\RequirePackage{etoolbox}
% Change line spacing in specific environment
\RequirePackage{setspace}
% Manage fonts
\RequirePackage[quiet]{fontspec}
% Support LaTeX quoting style
\defaultfontfeatures{Ligatures=TeX}
% Manage math fonts
\RequirePackage{unicode-math}
% Needed to use icons from font-awesome
% (https://github.com/posquit0/latex-fontawesome)
\RequirePackage{fontawesome}
%\RequirePackage[default,opentype]{sourcesanspro}
\RequirePackage{lmodern}
\renewcommand*\familydefault{\sfdefault} %% Only if the base font of the document is to be sans serif
\RequirePackage[T1]{fontenc}

% Needed for the photo ID
\RequirePackage[skins]{tcolorbox}

\RequirePackage{parskip}

\RequirePackage[hidelinks,unicode]{hyperref}
\hypersetup{%
pdftitle={},
pdfauthor={},
pdfsubject={},
pdfkeywords={}
}
% Multirow entries in tables
\RequirePackage{multirow}
% Needed for last page in footer for ## / ##
\RequirePackage{lastpage}

% Emoji symbols
%% Works only with LuaLaTeX
\RequirePackage{emoji}


%-------------------------------------------------------------------------------
% Directory locations
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir


%-------------------------------------------------------------------------------
% Layout
%-------------------------------------------------------------------------------
%% Page Layout
\geometry{left=1.2cm, top=0.7cm, right=1.2cm, bottom=1.2cm, footskip=0.1cm}

%% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}


%-------------------------------------------------------------------------------
% Declarations, booleans, macros
%-------------------------------------------------------------------------------
% Control the behaviour of some display artefacts, colour display, conditional
% display of some information
%-------------------------------------------------------------------------------
% Language of the CV
%% Either EN or DE
\newcommand{\cvLang}{DE}

% Nature of the CV
%% Either simple or fancy
\newcommand{\cvNature}{simple}

% Switch section color highlighting
\newbool{acvSectionColorHighlight}
\setbool{acvSectionColorHighlight}{true}

% Display school grades
\newbool{eduShowGrade}
\setbool{eduShowGrade}{true}

% Display basic emojis
%% Use \ifthenelse construct in your file to personalise use
\newbool{showEmojis}
\setbool{showEmojis}{false}

% Display emojis in Section Titles
\newbool{showTitleEmojis}
\setbool{showTitleEmojis}{false}

% Display additional emojis in location and dates throughout CV
\newbool{showCalEmojis}
\setbool{showCalEmojis}{false}

% Display emojis for each skill category
%% For new custom categories, simply use the desired emoji at the corresponding
%% place in your TeX file along with \ifthenelse construct, see usage in the file
%% for an example
\newbool{showSkillSubEmojis}
\setbool{showSkillSubEmojis}{false}


%-------------------------------------------------------------------------------
% Colors TODO @hatimak
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{393939}
\definecolor{gray}{HTML}{696969}
\definecolor{lightgray}{HTML}{9e9e9e}
% Basic colors
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
% Text colors
\definecolor{darktext}{HTML}{474747}
\definecolor{text}{HTML}{424242}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}
% Awesome colors
\definecolor{awesome-emerald}{HTML}{00A388}
\definecolor{awesome-skyblue}{HTML}{0395DE}
\definecolor{awesome-red}{HTML}{DC3522}
\definecolor{awesome-pink}{HTML}{EF4089}
\definecolor{awesome-orange}{HTML}{FF6138}
\definecolor{awesome-nephritis}{HTML}{27AE60}
\definecolor{awesome-concrete}{HTML}{95A5A6}
\definecolor{awesome-darknight}{HTML}{131A28}
\colorlet{awesome}{awesome-red}

% Awesome section color
\def\@sectioncolor[#1]{%
	\ifbool{acvSectionColorHighlight}%
		{{\color{awesome}#1}}%
		{#1}%
}


%-------------------------------------------------------------------------------
% Styles TODO @hatimak
%-------------------------------------------------------------------------------
% Configure styles for each CV elements
% For fundamental structures
\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{32pt}{1em}\bfseries\color{text} #1}}
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{32pt}{1em}\normalfont\color{graytext} #1}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{7.6pt}{1em}\scshape\color{awesome} #1}}
\newcommand*{\headeraddressstyle}[1]{{\fontsize{8pt}{1em}\itshape\color{lighttext} #1}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{6.8pt}{1em}\color{text} #1}}
\newcommand*{\headerquotestyle}[1]{{\fontsize{9pt}{1em}\itshape\color{darktext} #1}}
\newcommand*{\footerstyle}[1]{{\fontsize{8pt}{1em}\scshape\color{lighttext} #1}}
\newcommand*{\sectionstyle}[1]{{\fontsize{16pt}{1em}\bfseries\scshape\color{text}\@sectioncolor[#1]}}
\newcommand*{\subsectionstyle}[1]{{\fontsize{12pt}{1em}\scshape\textcolor{text}{#1}}}
\newcommand*{\paragraphstyle}{\fontsize{9pt}{1em}\upshape\color{text}}

% For elements of entry
\newcommand*{\entrytitlestyle}[1]{{\fontsize{10pt}{1em}\bfseries\color{darktext} #1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{9pt}{1em}\slshape\color{graytext} #1}}
\newcommand*{\entrydatestyle}[1]{{\fontsize{9pt}{1em}\slshape\color{graytext} #1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{9pt}{1em}\slshape\color{awesome} #1}}
\newcommand*{\descriptionstyle}[1]{{\fontsize{9pt}{1em}\upshape\color{text} #1}}

\newcommand*{\experiencepositionstyle}[1]{{\fontsize{9pt}{1em}\scshape\color{awesome} #1}}
\newcommand*{\entrysubtitlestyle}[1]{{\fontsize{9pt}{1em}\slshape\color{graytext} #1}}

\newcommand*{\positionorgstyle}[1]{{\fontsize{9pt}{1em}\slshape\color{awesome} #1}}

% For elements of subentry
\newcommand*{\subentrytitlestyle}[1]{{\fontsize{8pt}{1em}\mdseries\color{graytext} #1}}
\newcommand*{\subentrypositionstyle}[1]{{\fontsize{7pt}{1em}\scshape\color{graytext} #1}}
\newcommand*{\subentrydatestyle}[1]{{\fontsize{7pt}{1em}\slshape\color{graytext} #1}}
\newcommand*{\subentrylocationstyle}[1]{{\fontsize{7pt}{1em}\slshape\color{awesome} #1}}
\newcommand*{\subdescriptionstyle}[1]{{\fontsize{8pt}{1em}\upshape\color{text} #1}}

% For elements of honor
\newcommand*{\honortitlestyle}[1]{{\fontsize{9pt}{1em}\color{graytext} #1}}
\newcommand*{\honorpositionstyle}[1]{{\fontsize{9pt}{1em}\bfseries\color{darktext} #1}}
\newcommand*{\honordatestyle}[1]{{\fontsize{9pt}{1em}\slshape\color{graytext} #1}}
\newcommand*{\honorlocationstyle}[1]{{\fontsize{9pt}{1em}\slshape\color{awesome} #1}}

% For elements of skill
\newcommand*{\skilltypestyle}[1]{{\fontsize{10pt}{1em}\bfseries\color{darktext} #1}}
\newcommand*{\skillsetstyle}[1]{{\fontsize{9pt}{1em}\color{text} #1}}

% For elements of school
\newcommand*{\schooldatestyle}[1]{{\fontsize{9pt}{1em}\slshape\color{graytext} #1}}
\newcommand*{\schoolinstitutionstyle}[1]{{\fontsize{10pt}{1em}\bfseries\color{darktext} #1}}
\newcommand*{\degreetitlestyle}[1]{{\fontsize{9pt}{1em}\slshape\color{awesome} #1}}
\newcommand*{\schooldegreestyle}[1]{{\fontsize{9pt}{1em}\scshape\color{graytext} #1}}
\newcommand*{\schoolscorestyle}[1]{{\fontsize{9pt}{1em}\color{text} #1}}
\newcommand*{\schoollocationstyle}[1]{{\fontsize{9pt}{1em}\slshape\color{awesome} #1}}

% For elements of the cover letter
\newcommand*{\lettersectionstyle}[1]{{\fontsize{14pt}{1em}\bfseries\color{text}\@sectioncolor[#1]}}
\newcommand*{\recipientaddressstyle}[1]{{\fontsize{9pt}{1em}\scshape\color{graytext} #1}}
\newcommand*{\recipienttitlestyle}[1]{{\fontsize{11pt}{1em}\bfseries\color{darktext} #1}}
\newcommand*{\lettertitlestyle}[1]{{\fontsize{10pt}{1em}\bfseries\color{darktext} \underline{#1}}}
\newcommand*{\letterdatestyle}[1]{{\fontsize{9pt}{1em}\slshape\color{graytext} #1}}
\newcommand*{\lettertextstyle}{\fontsize{10pt}{1.4em}\upshape\color{graytext}}
\newcommand*{\letternamestyle}[1]{{\fontsize{10pt}{1em}\bfseries\color{darktext} #1}}
\newcommand*{\letterenclosurestyle}[1]{{\fontsize{10pt}{1em}\slshape\color{lighttext} #1}}

% New styles
%-----------
%% TODO @hatimak: Create new styles and discard old ones
%% Elements of the content of the CV, the data, the crux
\newcommand*{\cvStylesSimpleDate}[1]{{\fontsize{10.25pt}{1em}\slshape\color{darktext} #1}}
\newcommand*{\cvStylesSimpleLocation}[1]{{\fontsize{9.5pt}{1em}\slshape\color{graytext} #1}}
\newcommand*{\cvStylesSimpleTitle}[1]{{\fontsize{10.25pt}{1em}\bfseries\color{darktext} #1}}
\newcommand*{\cvStylesSimpleOrganisation}[1]{{\fontsize{9.5pt}{1em}\slshape\color{graytext} #1}}
\newcommand*{\cvStylesSimpleSubtitle}[1]{{\fontsize{9.25pt}{1em}\slshape\color{lighttext} #1}}
\newcommand*{\cvStylesSimpleDescriptions}[1]{{\fontsize{9.25pt}{1em}\upshape\color{text} #1}}

\newcommand*{\cvStylesSimpleHeaderMainData}[1]{{\fontsize{8.25pt}{1em}\upshape\color{text} #1}}
\newcommand*{\cvStylesSimpleHeaderSupplementData}[1]{{\fontsize{8.25pt}{1em}\upshape\color{graytext} #1}}
\newcommand*{\cvStylesSimpleHeaderField}[1]{{\fontsize{8.25pt}{1em}\slshape\color{graytext} #1}}

\newcommand*{\cvStylesSimpleSection}[1]{{\fontsize{16pt}{1em}\bfseries\color{text}#1}}

%-------------------------------------------------------------------------------
% Commands for personal information
%-------------------------------------------------------------------------------
% Photo ID
%% Usage: \photo[circle|rectangle,edge|noedge,left|right]{<path-to-image>}
\newcommand{\photo}[2][circle,edge,left]{%
	\def\@photo{#2}
	\@for\tmp:=#1\do{%
		\ifthenelse{\equal{\tmp}{circle} \or \equal{\tmp}{rectangle}}%
			{\let\@photoshape\tmp}%
			{}%
		\ifthenelse{\equal{\tmp}{edge} \or \equal{\tmp}{noedge}}%
			{\let\@photoedge\tmp}%
			{}%
		\ifthenelse{\equal{\tmp}{left} \or \equal{\tmp}{right}}%
			{\let\@photoalign\tmp}%
			{}%
	}%
}
\def\@photoshape{circle}
\def\@photoedge{edge}
\def\@photoalign{left}

% Name
%% Usage: \name{<firstname>}{<lastname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\def\@familyname{\@lastname}

% Address
%% Usage: \address{<address>}
\newcommand*{\address}[1]{\def\@address{#1}}

% Position
\newcommand*{\position}[1]{\def\@position{#1}}

% Date of Birth
%% Usage: \birthdate{<birth date>}{<birth month>}{<birth year>}
\newcommand*{\birthdate}[1]{\def\@birthdate{#1}}

% Birth Place
%% Usage: \birthplace{cvLang}{<birth place>}
\newcommand*{\birthplace}[2]{\ifthenelse{\equal{DE}{#1}}{\def\@birthplaceDE{#2}}{\def\@birthplaceEN{#2}}}

% Mobile (optional)
%% Usage: \mobile{<mobile number>}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}

% Email (optional)
%% Usage: \email{<email adress>}
\newcommand*{\email}[1]{\def\@email{#1}}

% Homepage (optional)
%% Usage: \homepage{<url>}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}

% GitHub (optional)
%% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\def\@github{#1}}

% Gitlab (optional)
%% Usage: \gitlab{<gitlab-nick>}
\newcommand*{\gitlab}[1]{\def\@gitlab{#1}}

% LinkedIn (optional)
%% Usage: \linkedin{<linkedin nickname>}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}

% Twitter
%% Usage: \twitter{<twitter handle>}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}

% Xing (optional)
%% Usage: \xing{<xing name>}
\newcommand*{\xing}[1]{\def\@xing{#1}}

% Quote (optional)
%% Usage: \quote{<quote>}
\renewcommand*{\quote}[1]{\def\@quote{#1}}

% Recipient's information (cover letter)
%% Usage: \recipient{<company name or dept>}{<recipient address>}
\newcommand*{\recipient}[2]{\def\@recipientname{#1}\def\@recipientaddress{#2}}

% Title (cover letter, optional)
%% Usage: \lettertitle{<title>}
\newcommand*{\lettertitle}[1]{\def\@lettertitle{#1}}

% Date (cover letter)
%% Usage: \letterdate{<date>}
\newcommand*{\letterdate}[1]{\def\@letterdate{#1}}

% Enclosure for letter (cover letter, optional)
%% TODO @hatimak: Automatic Attacehd or Anhang based on EN / DE
%% Usage: \letterenclosure[<enclosure name>]{<enclosure>}
\newcommand*{\letterenclname}[1][Enclosure]{\def\@letterenclname{#1}}
\newcommand*{\letterenclosure}[2][]{%
% if an optional argument is provided, use it to redefine \enclname
\ifthenelse{\equal{#1}{}}{}{\def\@letterenclname{#1}}
\def\@letterenclosure{#2}
}


%-------------------------------------------------------------------------------
% Helpers TODO: @hatimak
%-------------------------------------------------------------------------------
%% Define helper macros a user can change easily
% Header
\newcommand{\acvHeaderNameDelim}{\space}
\newcommand{\acvHeaderAfterNameSkip}{.4mm}
\newcommand{\acvHeaderAfterPositionSkip}{.4mm}
\newcommand{\acvHeaderAfterAddressSkip}{-.5mm}
\newcommand{\acvHeaderIconSep}{\space}
\newcommand{\acvHeaderSocialSep}{\quad\textbar\quad}
\newcommand{\acvHeaderAfterSocialSkip}{6mm}
\newcommand{\acvHeaderAfterQuoteSkip}{5mm}

% Others
\newcommand{\acvSectionTopSkip}{3mm}
\newcommand{\acvSectionContentTopSkip}{0.0mm}

% Simple Nature geometrical measurements
\newcommand{\cvNatureLeftSidebar}{4.0cm}
\newcommand{\cvNatureColumnInset}{0.75em}


%-------------------------------------------------------------------------------
% Utility Commands
%-------------------------------------------------------------------------------
% Align an element of tabular table
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Draw horizontal line with specific thickness
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

% Conditional statements to check empty string
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}

% Macro to to encapsulate language switch
\newcommand*{\switchDE}[2]{ \ifthenelse{\equal{DE}{\cvLang}} {#1} {#2} }

% Macro to to encapsulate Nature check
\newcommand*{\isFancy}[2]{ \ifthenelse{\equal{fancy}{\cvNature}} {#1} {#2} }

%-------------------------------------------------------------------------------
% CV Structure
%-------------------------------------------------------------------------------
% Header
%% Section based on Header from Awesome-CV
%% template (https://github.com/posquit0/Awesome-CV) by
%% Claud D. Park <posquit0.bj@gmail.com>
%% Usage: \makecvheader
\newcommand*{\makecvheader}[1][C]{%
	\newcommand*{\drawphoto}{%
		\ifthenelse{\isundefined{\@photo}}%
			{}%
			{%
				\newlength{\photodim}%
				\ifthenelse{\equal{\@photoshape}{circle}}%
					{\setlength{\photodim}{1.2cm}}%
					{\setlength{\photodim}{1.2cm}}%
				\ifthenelse{\equal{\@photoedge}{edge}}%
					{\isFancy{\def\@photoborder{awesome}}{\def\@photoborder{darkgray}}}%
					{\def\@photoborder{none}}%
				\begin{tikzpicture}%
					\node[\@photoshape, draw=\@photoborder, line width=0.9pt, inner sep=\photodim, fill overzoom image=\@photo] () {};
				\end{tikzpicture}%
			}%
	}
	\newlength{\headertextwidth}%
	\newlength{\headerphotowidth}%
	\ifthenelse{\isundefined{\@photo}}{%
		\setlength{\headertextwidth}{\textwidth}%
		\setlength{\headerphotowidth}{0cm}%
	}{%
		\setlength{\headertextwidth}{\textwidth - \cvNatureLeftSidebar - \cvNatureColumnInset}%
		\setlength{\headerphotowidth}{\cvNatureLeftSidebar + \cvNatureColumnInset}%
	}%
	\begin{minipage}{\headerphotowidth}%
		\ifthenelse{\equal{\@photoalign}{left}}
			{\raggedleft\drawphoto}%
			{}%
	\end{minipage}%
	\begin{minipage}{\headertextwidth}%
		\ifthenelse{\equal{#1}{L}}%
			{\raggedright}%
			{\ifthenelse{\equal{#1}{R}}%
				{\raggedleft}%
				{\centering}%
			}%
		\headerfirstnamestyle{\@firstname}\headerlastnamestyle{{}\acvHeaderNameDelim\@lastname}%
		\\[\acvHeaderAfterNameSkip]%
		\ifthenelse{\isundefined{\@position}}%
			{}%
			{\headerpositionstyle{\@position\\[\acvHeaderAfterPositionSkip]}}%
			\isFancy{
				\ifthenelse{\isundefined{\@address}}%
					{}%
					{\ifbool{showEmojis} {\emoji{house-with-garden}\acvHeaderIconSep} {} \headeraddressstyle{\@address\\[\acvHeaderAfterAddressSkip]}}%
				\headersocialstyle{%%
					\newbool{isstart}%
					\setbool{isstart}{true}%
					\ifthenelse{\isundefined{\@mobile}}%
						{}{%
						\emoji{mobile-phone}\acvHeaderIconSep\@mobile%
						\setbool{isstart}{false}}%
					\ifthenelse{\isundefined{\@email}}%
						{}{%
						\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
						\href{mailto:\@email}{\emoji{envelope}\acvHeaderIconSep\@email}}%
					\ifthenelse{\isundefined{\@homepage}}%
						{}{%
						\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
						\href{https://\@homepage}{\emoji{globe-with-meridians}\acvHeaderIconSep\@homepage}}%
					\ifthenelse{\isundefined{\@github}}%
						{}{%
						\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
						\href{https://github.com/\@github}{\faGithubSquare\acvHeaderIconSep\@github}}%
					\ifthenelse{\isundefined{\@gitlab}}%
						{}{%
						\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
						\href{https://gitlab.com/\@gitlab}{\faGitlab\acvHeaderIconSep\@gitlab}}%
					\ifthenelse{\isundefined{\@linkedin}}%
						{}{%
						\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
						\href{https://www.linkedin.com/in/\@linkedin}{\faLinkedinSquare\acvHeaderIconSep\@linkedin}}%
					\ifthenelse{\isundefined{\@twitter}}%
						{}{%
						\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
						\href{https://twitter.com/\@twitter}{\faTwitter\acvHeaderIconSep\@twitter}}%
					\ifthenelse{\isundefined{\@xing}}%
						{}{%
						\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
						\href{https://www.xing.com/profile/\@xing}{\faXingSquare\acvHeaderIconSep\@xing}}%
			}}{%
				\begin{center}
					\vspace{1.5mm}{%
					\setlength{\tabcolsep}{0pt}
					\setlength\extrarowheight{-3pt}
					\begin{tabular}{ r l }%
						\cvStylesSimpleHeaderField{\switchDE{Geburtsdatum}{Birth date}:}\space\space & \cvStylesSimpleHeaderMainData{\@birthdate} \\%
						\ifthenelse{\isundefined{\@address}}%
							{}%
							{ \isFancy{\emoji{house-with-garden}}{\cvStylesSimpleHeaderField{\switchDE{Anschrift}{Address}:}} & \cvStylesSimpleHeaderMainData{\@address} \\ }%
						\ifthenelse{\isundefined{\@mobile}}%
							{}{%
							\isFancy{\emoji{mobile-phone}}{\cvStylesSimpleHeaderField{\switchDE{Telefon}{Phone}:}} & \cvStylesSimpleHeaderMainData{\@mobile} \\ }%
						\ifthenelse{\isundefined{\@email}}%
							{}{%
							\isFancy{\emoji{envelope}}{\cvStylesSimpleHeaderField{Email:}}  & \cvStylesSimpleHeaderMainData{\href{mailto:\@email}{\@email}} \\ }%
						\ifthenelse{\isundefined{\@homepage}}%
							{}{%
							\isFancy{\emoji{globe-with-meridians}}{\cvStylesSimpleHeaderField{\switchDE{Homepage}{Home page}:}} & \cvStylesSimpleHeaderMainData{\href{https://\@homepage}{\cvStylesSimpleHeaderSupplementData{https://}\@homepage}} \\ }%
						\ifthenelse{\isundefined{\@github}}%
							{}{%
							\isFancy{\faGithubSquare}{\cvStylesSimpleHeaderField{GitHub:}} & \cvStylesSimpleHeaderMainData{\href{https://github.com/\@github}{\cvStylesSimpleHeaderSupplementData{https://github.com/}\@github}} \\ }%
						\ifthenelse{\isundefined{\@gitlab}}%
							{}{%
							\isFancy{\faGitlab}{\cvStylesSimpleHeaderField{GitLab:}} & \cvStylesSimpleHeaderMainData{\href{https://gitlab.com/\@gitlab}{\cvStylesSimpleHeaderSupplementData{https://gitlab.com/}\@gitlab}} \\ }%
						\ifthenelse{\isundefined{\@linkedin}}%
							{}{%
							\isFancy{\faLinkedinSquare}{\cvStylesSimpleHeaderField{LinkedIn:}} & \cvStylesSimpleHeaderMainData{\href{https://www.linkedin.com/in/\@linkedin}{\cvStylesSimpleHeaderSupplementData{https://www.linkedin.com/in/}\@linkedin}} \\ }%
						\ifthenelse{\isundefined{\@twitter}}%
							{}{%
							\isFancy{\faTwitter}{\cvStylesSimpleHeaderField{Twitter:}} & \cvStylesSimpleHeaderMainData{\href{https://twitter.com/\@twitter}{\cvStylesSimpleHeaderSupplementData{https://twitter.com/}\@twitter}} \\ }%
						\ifthenelse{\isundefined{\@xing}}%
							{}{%
							\isFancy{\faXingSquare}{\cvStylesSimpleHeaderField{Xing:}} & \cvStylesSimpleHeaderMainData{\href{https://www.xing.com/profile/\@xing}{\cvStylesSimpleHeaderSupplementData{https://www/xing.com/profile/}\@xing}} \\ }%
					\end{tabular}}%
					\vspace{-9.0mm}
				\end{center}
			}%
		\vspace{\acvHeaderAfterSocialSkip}
		\isFancy{}{\noindent\centering\color{lightgray}\rule{0.67\headertextwidth}{0.9pt}}
		\ifthenelse{\isundefined{\@quote}}%
			{}{%
			\headerquotestyle{\@quote\\}\vspace{\acvHeaderAfterQuoteSkip}}%
	\end{minipage}%
	\begin{minipage}{\headerphotowidth}%
		\ifthenelse{\equal{\@photoalign}{right}}%
			{\raggedright\drawphoto}%
			{}%
	\end{minipage}%
	\vspace{-\acvSectionTopSkip}
	\ifthenelse{\isundefined{\@photo}}%
		{\vspace{2.0mm}}%
}

% Footer
%% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand*{\makecvfooter}[3]{%
	\fancyfoot{}
	\fancyfoot[L]{\footerstyle{#1}}
	\fancyfoot[C]{\footerstyle{#2}}
	\fancyfoot[R]{\footerstyle{#3}}
}

% Section, like Education, Experience
%% Usage: \cvsection{<section-title>}
\newcommand{\cvsection}[1]{%
	\vspace{\acvSectionTopSkip}
	\cvStylesSimpleSection{ \isFancy{\@sectioncolor[#1]}{#1} }
	\phantomsection
	\isFancy{\color{awesome}\vhrulefill{0.9pt}}{}
}

% Subsection
%% Usage: \cvsubsection{<subsection-title>}
\newcommand{\cvsubsection}[1]{%
	\vspace{\acvSectionContentTopSkip}
	\vspace{-3mm}
	\subsectionstyle{#1}
	\phantomsection
}

% Paragraph environment
\newenvironment{cvparagraph}{%
	\vspace{\acvSectionContentTopSkip}
	\vspace{-3mm}
	\paragraphstyle
}{%
	\par
	\vspace{2mm}
}

% Environment for honors / achievements / awards
\newenvironment{cvhonors}{%
	\vspace{\acvSectionContentTopSkip}
	\vspace{-2mm}
	\begin{center}
		\setlength\tabcolsep{0pt}
		\setlength{\extrarowheight}{1pt}
		\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} C{1.5cm} L{\textwidth - 4.0cm} R{2.5cm}}
}{%
		\end{tabular*}
	\end{center}
}

% Entry for honor / achievement / award
%% Usage: \cvhonor{<position>}{<title>}{<location>}{<date>}
\newcommand*{\cvhonor}[4]{%
	\honordatestyle{#4} & \honorpositionstyle{#1} \ifempty{#2}{}{, \honortitlestyle{#2}} & \honorlocationstyle{#3} \\
}

% Skills
%-------
\newenvironment{cvskills}{%
	\ifthenelse{\equal{DE}{\cvLang}}%
		{\cvsection{\ifbool{showTitleEmojis} {\emoji{gem-stone}\acvHeaderIconSep} {} Kenntnisse}}%
		{\cvsection{\ifbool{showTitleEmojis} {\emoji{gem-stone}\acvHeaderIconSep} {} Skills}}%
	\vspace{\acvSectionContentTopSkip}
	\begin{center}
		
		\begin{tabular*}{\textwidth}{ R{\cvNatureLeftSidebar} @{\hspace{\cvNatureColumnInset}} L{\textwidth - \cvNatureLeftSidebar - \cvNatureColumnInset} }
}{%
		\end{tabular*}
	\end{center}
	\vspace{2.0mm}%
	\vspace{-4.0mm}
}

% Entry for skill
%% Usage: \cvskill{<type>}{<skillset>}
%% TODO @hatimak: Apply new styles to Skills
\newcommand*{\cvskill}[3]{%
	\ifthenelse{\equal{DE}{\cvLang}} {\cvStylesSimpleTitle{#2}} {\cvStylesSimpleTitle{#1}} & \cvStylesSimpleDescriptions{#3} \\
	\\ [-1.0em]
}
%-------------------------------------------------------------------------------

% Environment for CV items, bullet list for description, particularly in the Experiences section
\newenvironment{cvitems}{%
	\vspace{-4.0mm}
		\begin{itemize}[leftmargin=3.33ex]
			\setlength{\parskip}{0pt}
			\setlength\itemsep{0.25em}
%			\renewcommand{\labelitemi}{\bullet}
}{%
		\end{itemize}
	\vspace{-4.0mm}
}

% Education
%----------
\newenvironment{cveducation}{%
	\ifthenelse{\equal{DE}{\cvLang}}%
		{\cvsection{\ifbool{showTitleEmojis} {\emoji{classical-building}\acvHeaderIconSep} {} Ausbildung}}%
		{\cvsection{\ifbool{showTitleEmojis} {\emoji{classical-building}\acvHeaderIconSep} {} Education}}%
	\vspace{\acvSectionContentTopSkip}%
	\begin{center}%
}{%
	\end{center}%
	\vspace{3.0mm}%
	\vspace{-4.0mm}%
}

\newcommand{\cvEducationDegree}[2]{%
	\switchDE {\def\@cvEducationDegreeDE{#2}} {\def\@cvEducationDegreeEN{#2}} }%
\newcommand{\cvEducationDegreeName}[2]{%
	\switchDE {\def\@cvEducationDegreeNameDE{#2}} {\def\@cvEducationDegreeNameEN{#2}} }%
\newcommand{\cvEducationInstitution}[2]{%
	\switchDE {\def\@cvEducationInstitutionDE{#2}} {\def\@cvEducationInstitutionEN{#2}} }%
\newcommand{\cvEducationLocation}[2]{%
	\switchDE {\def\@cvEducationLocationDE{#2}} {\def\@cvEducationLocationEN{#2}} }%
\newcommand{\cvEducationDescription}[2]{%
	\switchDE {\def\@cvEducationDescriptionDE{#2}} {\def\@cvEducationDescriptionEN{#2}} }%
\newcommand{\cvEducationDates}[2]{%
	\switchDE {\def\@cvEducationDatesDE{#2}} {\def\@cvEducationDatesEN{#2}} }%
\newcommand{\cvEducationGrade}[2]{%
	\switchDE {\def\@cvEducationGradeDE{#2}} {\def\@cvEducationGradeEN{#2}} }%

% Entry for education section
\newcommand*{\cvSchoolFlush}{%
	\isFancy{%
		\begin{tabular*}{\textwidth}{ L{\textwidth - 3.5cm} R{3.5cm} }%
			\schoolinstitutionstyle{ \switchDE{\@cvEducationInstitutionDE}{\@cvEducationInstitutionEN} } & \schoollocationstyle{ \switchDE{\@cvEducationLocationDE}{\@cvEducationLocationEN} } \\
			\experiencepositionstyle{ \switchDE{\@cvEducationDegreeDE \@cvEducationDegreeNameDE}{\@cvEducationDegreeEN\space\@cvEducationDegreeNameEN} } & \entrydatestyle{ \switchDE{\@cvEducationDatesDE}{\@cvEducationDatesEN} } \\
			\ifempty{\@cvEducationGradeDE} {} {\entrydatestyle{ \switchDE{Abschlussnote}{Final Grade} \switchDE{\@cvEducationGradeDE}{\@cvEducationGradeEN} } & \\}
			\multicolumn{2}{L{\textwidth}}{\descriptionstyle{ \switchDE{\@cvEducationDescriptionDE}{\@cvEducationDescriptionEN} }}
		\end{tabular*}%
	}{%
		\begin{tabular*}{\textwidth}{ R{\cvNatureLeftSidebar} @{\hspace{\cvNatureColumnInset}} L{\textwidth - \cvNatureLeftSidebar - \cvNatureColumnInset} }%
			\multirow{2}{=}{ \raggedleft \ifbool{showCalEmojis} {\emoji{spiral-calendar}\acvHeaderIconSep} {} \cvStylesSimpleDate{ \switchDE{\@cvEducationDatesDE}{\@cvEducationDatesEN} }\newline \cvStylesSimpleLocation{ \switchDE{\@cvEducationLocationDE}{\@cvEducationLocationEN} }} & \cvStylesSimpleTitle{ \switchDE{\@cvEducationDegreeDE\space\@cvEducationDegreeNameDE}{\@cvEducationDegreeEN \@cvEducationDegreeNameEN} } \\
			& \cvStylesSimpleOrganisation{ \switchDE{\@cvEducationInstitutionDE}{\@cvEducationInstitutionEN} } \ifempty{\@cvEducationGradeDE} {} {\\
			& \cvStylesSimpleSubtitle{\ifbool{showCalEmojis} {\emoji{graduation-cap}\acvHeaderIconSep} {} \switchDE{Abschlussnote}{Final Grade} \switchDE{\@cvEducationGradeDE}{\@cvEducationGradeEN}}} \ifempty{\@cvEducationDescriptionDE} {} {\\
			& \cvStylesSimpleDescriptions{ \switchDE{\@cvEducationDescriptionDE}{\@cvEducationDescriptionEN} }}%
		\end{tabular*}%
		\vspace{-1.0mm}%
	}%
}
%-------------------------------------------------------------------------------

% References
%-----------
\newenvironment{cvReferences}{%
	\ifthenelse{\equal{DE}{\cvLang}}%
		{\cvsection{\ifbool{showTitleEmojis} {\emoji{memo}\acvHeaderIconSep} {} Referenzen}}%
		{\cvsection{\ifbool{showTitleEmojis} {\emoji{memo}\acvHeaderIconSep} {} References}}%
	\vspace{\acvSectionContentTopSkip}%
	\begin{center}%
}{%
	\end{center}%
	\vspace{-4.0mm}%
}

\newcommand{\cvRefereeNameOne}[5]{%
	\def\@cvRefereeNameOne{#1}%
	\def\@cvRefereePostOne{#2}%
	\def\@cvRefereeOrganisationOne{#3}%
	\def\@cvRefereeTelephoneOne{#4}%
	\def\@cvRefereeEmailOne{#5} }

\newcommand{\cvRefereeNameTwo}[5]{%
	\def\@cvRefereeNameTwo{#1}
	\def\@cvRefereePostTwo{#2}%
	\def\@cvRefereeOrganisationTwo{#3}%
	\def\@cvRefereeTelephoneTwo{#4}
	\def\@cvRefereeEmailTwo{#5} }

\newcommand*{\cvRefereeFlush}{%
	\begin{tabular*}{\textwidth}{ @{\hspace{\cvNatureColumnInset}} @{\hspace{\cvNatureColumnInset}} L{0.50\textwidth - \cvNatureColumnInset - \cvNatureColumnInset} @{\hspace{\cvNatureColumnInset}} @{\hspace{\cvNatureColumnInset}} L{0.50\textwidth - \cvNatureColumnInset - \cvNatureColumnInset} }%
		\cvStylesSimpleTitle{\@cvRefereeNameOne} & \cvStylesSimpleTitle{\@cvRefereeNameTwo} \\
		\cvStylesSimpleOrganisation{\@cvRefereePostOne} & \cvStylesSimpleOrganisation{\@cvRefereePostTwo} \\
		\cvStylesSimpleDescriptions{\@cvRefereeOrganisationOne} & \cvStylesSimpleDescriptions{\@cvRefereeOrganisationTwo} \\
		\cvStylesSimpleDate{\@cvRefereeTelephoneOne} & \cvStylesSimpleDate{\@cvRefereeTelephoneTwo} \\
		\cvStylesSimpleDate{ \href{mailto:\@cvRefereeEmailOne}{\@cvRefereeEmailOne} } & \cvStylesSimpleDate{ \href{mailto:\@cvRefereeEmailTwo}{\@cvRefereeEmailTwo} }
	\end{tabular*}%
	\vspace{2.0mm}%
}
%-------------------------------------------------------------------------------


% Experience
%-----------
\newenvironment{cvexperience}{%
	\ifthenelse{\equal{DE}{\cvLang}}%
		{\cvsection{\ifbool{showTitleEmojis} {\emoji{briefcase}\acvHeaderIconSep} {} Berufserfahrung}}%
		{\cvsection{\ifbool{showTitleEmojis} {\emoji{briefcase}\acvHeaderIconSep} {} Experience}}%
	\vspace{\acvSectionContentTopSkip}
	\begin{center}
}{%
	\end{center}
	\vspace{-3.0mm}
}

\newcommand{\cvExperienceTitle}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvExperienceTitleDE{#2}} {\def\@cvExperienceTitleEN{#2}} }
\newcommand{\cvExperienceSubtitle}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvExperienceSubtitleDE{#2}} {\def\@cvExperienceSubtitleEN{#2}} }
\newcommand{\cvExperienceLocation}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvExperienceLocationDE{#2}} {\def\@cvExperienceLocationEN{#2}} }
\newcommand{\cvExperienceDates}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvExperienceDatesDE{#2}} {\def\@cvExperienceDatesEN{#2}} }
\newcommand{\cvExperienceDescription}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvExperienceDescriptionDE{#2}} {\def\@cvExperienceDescriptionEN{#2}} }
\newcommand{\cvExperienceOrganisation}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvExperienceOrganisationDE{#2}} {\def\@cvExperienceOrganisationEN{#2}} }

\newcommand*{\cvExperienceFlush}{%
	\isFancy{%
		\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.0cm} p{4.0cm}}%
			\experiencepositionstyle{ \switchDE{\@cvExperienceTitleDE}{\@cvExperienceTitleEN} } & \ifempty{\@cvExperienceSubtitleDE} {\multirow{1}{=}{\raggedleft \entrylocationstyle{ \switchDE{\@cvExperienceLocationDE}{\@cvExperienceLocationEN} }} \\
			\entrytitlestyle{ \switchDE{\@cvExperienceOrganisationDE}{\@cvExperienceOrganisationEN} } & \multirow{1}{=}{\raggedleft \entrydatestyle{ \switchDE{\@cvExperienceDatesDE}{\@cvExperienceDatesEN} }} \\}
			{\multirow[b]{2}{=}{\raggedleft \entrylocationstyle{ \switchDE{\@cvExperienceLocationDE}{\@cvExperienceLocationEN} }} \\
			\entrytitlestyle{ \switchDE{\@cvExperienceOrganisationDE}{\@cvExperienceOrganisationEN} } & \\
			\entrysubtitlestyle{ \switchDE{\@cvExperienceSubtitleDE}{\@cvExperienceSubtitleEN} } & \multirow{1}{=}{\raggedleft \entrydatestyle{ \switchDE{\@cvExperienceDatesDE}{\@cvExperienceDatesEN} }} \\}
			\multicolumn{2}{L{\textwidth}}{\descriptionstyle{ \switchDE{\@cvExperienceDescriptionDE}{\@cvExperienceDescriptionEN} }}
		\end{tabular*}%
	}{%
		\begin{tabular*}{\textwidth}{ R{\cvNatureLeftSidebar} @{\hspace{\cvNatureColumnInset}} L{\textwidth - \cvNatureLeftSidebar - \cvNatureColumnInset} }%
			\multirow{3}{=}{ \raggedleft \ifbool{showCalEmojis} {\emoji{spiral-calendar}\acvHeaderIconSep} {} \cvStylesSimpleDate{ \switchDE{\@cvExperienceDatesDE}{\@cvExperienceDatesEN} }\newline \cvStylesSimpleLocation{ \switchDE{\@cvExperienceLocationDE}{\@cvExperienceLocationEN} }} & \cvStylesSimpleTitle{ \switchDE{\@cvExperienceTitleDE}{\@cvExperienceTitleEN} } \\
			& \cvStylesSimpleOrganisation{ \switchDE{\@cvExperienceOrganisationDE}{\@cvExperienceOrganisationEN} } \\
			& \cvStylesSimpleDescriptions{ \switchDE{\@cvExperienceDescriptionDE}{\@cvExperienceDescriptionEN} }
		\end{tabular*}%
	}%
	\vspace{-1.0mm}%
}
%-------------------------------------------------------------------------------


% Positions / Extracurricular activities 
%---------------------------------------
\newenvironment{cvpositions}{%
	\ifthenelse{\equal{DE}{\cvLang}}%
		{\cvsection{\ifbool{showTitleEmojis} {\emoji{rocket}\acvHeaderIconSep} {} Ehrenamtliches und sonstige T{\"a}tigkeiten}}%
		{\cvsection{\ifbool{showTitleEmojis} {\emoji{rocket}\acvHeaderIconSep} {} Volunteering}}%
	\vspace{\acvSectionContentTopSkip}%
	\begin{center}
}{%
	\end{center}%
	\vspace{2.0mm}%
	\vspace{-4.0mm}%
}

\newcommand{\cvPositionPost}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvPositionPostDE{#2}} {\def\@cvPositionPostEN{#2}} }
\newcommand{\cvPositionLocation}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvPositionLocationDE{#2}} {\def\@cvPositionLocationEN{#2}} }
\newcommand{\cvPositionDates}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvPositionDatesDE{#2}} {\def\@cvPositionDatesEN{#2}} }
\newcommand{\cvPositionDescription}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvPositionDescriptionDE{#2}} {\def\@cvPositionDescriptionEN{#2}} }
\newcommand{\cvPositionOrganisation}[2]{%
	\def\@cvPositionOrganisationDE{#2}%
	\def\@cvPositionOrganisationEN{#2}%
}

\newcommand*{\cvPositionFlush}{%
	\isFancy{%
		\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.0cm} R{4.0cm}}%
			\entrytitlestyle{\ifthenelse{\equal{DE}{\cvLang}}{\@cvPositionOrganisationDE}{\@cvPositionOrganisationEN}} & \entrylocationstyle{\ifthenelse{\equal{DE}{\cvLang}}{\@cvPositionLocationDE}{\@cvPositionLocationEN}} \\
			\positionorgstyle{\ifthenelse{\equal{DE}{\cvLang}}{\@cvPositionPostDE}{\@cvPositionPostEN}} & \entrydatestyle{\ifthenelse{\equal{DE}{\cvLang}}{\@cvPositionDatesDE}{\@cvPositionDatesEN}}\\
			\multicolumn{2}{L{\textwidth}}{\descriptionstyle{\ifthenelse{\equal{DE}{\cvLang}}{\@cvPositionDescriptionDE}{\@cvPositionDescriptionEN}}}
		\end{tabular*}%
	}{%
		\begin{tabular*}{\textwidth}{ R{\cvNatureLeftSidebar} @{\hspace{\cvNatureColumnInset}} L{\textwidth - \cvNatureLeftSidebar - \cvNatureColumnInset} }%
			\multirow{3}{=}{ \raggedleft \ifbool{showCalEmojis} {\emoji{spiral-calendar}\acvHeaderIconSep} {} \cvStylesSimpleDate{\ifthenelse{\equal{DE}{\cvLang}}{\@cvPositionDatesDE}{\@cvPositionDatesEN}}\newline \cvStylesSimpleLocation{\ifthenelse{\equal{DE}{\cvLang}}{\@cvPositionLocationDE}{\@cvPositionLocationEN}}} & \cvStylesSimpleTitle{\ifthenelse{\equal{DE}{\cvLang}}{\@cvPositionPostDE}{\@cvPositionPostEN}} \\
			& \cvStylesSimpleOrganisation{\ifthenelse{\equal{DE}{\cvLang}}{\@cvPositionOrganisationDE}{\@cvPositionOrganisationEN}} \\
			& \cvStylesSimpleDescriptions{\ifthenelse{\equal{DE}{\cvLang}}{\@cvPositionDescriptionDE}{\@cvPositionDescriptionEN}}
		\end{tabular*}%
	}%
}
%-------------------------------------------------------------------------------

% Define an environment for cvprojects
\newenvironment{cvprojects}{%
\vspace{\acvSectionContentTopSkip}
\begin{center}
	}{%
	\vspace{-4.0mm}%
\end{center}
}
% Define an entry of cv projects
\newcommand*{\cvproject}[5]{%
\vspace{-2.0mm}
\setlength\tabcolsep{0pt}
\setlength{\extrarowheight}{0pt}
\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.0cm} R{4.0cm}}
	\ifempty{#2} {\multirow{2}{=}{\raggedright \entrytitlestyle{#1}} & \entrylocationstyle{#3} \\
	& \entrydatestyle{#4} \\}
	{\entrytitlestyle{#1} & \entrylocationstyle{#3} \\
	\entrysubtitlestyle{#2} & \entrydatestyle{#4} \\}
	\multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}}
\end{tabular*}
\vspace{0.75mm}%
}

%-------------------------------------------------------------------------------
% Cover Letter elements
%-------------------------------------------------------------------------------
% Define an environment for cvletter
\newenvironment{cvletter}{%
	\lettertextstyle
}{%
}

% Section
%--------
\newcommand{\lettersection}[3]{%
	\ifthenelse{\equal{DE}{#1}}{%
		\def\@letterSectionTitleDE{#2}%
		\def\@letterSectionTextDE{#3}%
	}{%
		\def\@letterSectionTitleEN{#2}%
		\def\@letterSectionTextEN{#3}%
	}%
}

\newcommand{\lettersectionflush}{%
	\par\addvspace{2.5ex}
	\phantomsection{}
	\ifthenelse{\equal{DE}{\cvLang}}{%
		\lettersectionstyle{\@letterSectionTitleDE}
		\par\nobreak\addvspace{0.4ex}
		\@letterSectionTextDE
	}{%
		\lettersectionstyle{\@letterSectionTitleEN}
		\par\nobreak\addvspace{0.4ex}
		\@letterSectionTextEN
	}%
}
%-------------------------------------------------------------------------------

% Opening (cover letter)
%-----------------------
\newcommand*{\letterOpeningMale}[1]{%
	\ifthenelse{\equal{DE}{#1}}%
		{Sehr geehrter Herr}%
		{Dear Mr}%
}%
\newcommand*{\letterOpeningFemale}[1]{%
	\ifthenelse{\equal{DE}{#1}}%
		{Sehr geehrte Frau}%
		{Dear Mrs}%
}%
\newcommand*{\letterOpeningUnknown}[1]{%
	\ifthenelse{\equal{DE}{#1}}%
		{Sehr geehrte Damen und Herren}%
		{Dear Sir / Madam}%
}%

\newcommand*{\letteropening}[2]{%
	\ifthenelse{\equal{male}{#1}}%
		{\def\@letteropening{\letterOpeningMale{\cvLang} #2,}}%
	{\ifthenelse{\equal{female}{#1}}%
		{\def\@letteropening{\letterOpeningFemale{\cvLang} #2,}}%
		{\def\@letteropening{\letterOpeningUnknown{\cvLang},}}%
	}%
}
%-------------------------------------------------------------------------------

% Title
%% Usage: \makelettertitle
\newcommand*{\makelettertitle}{%
	\vspace{8.4mm}
	\begin{spacing}{1.0}
		\recipienttitlestyle{\@recipientname}
	\end{spacing}
	\begin{spacing}{0.8}
		\recipientaddressstyle{\@recipientaddress}
	\end{spacing}
	\begin{spacing}{0.9}
		\recipientaddressstyle{\@letterdate} \\ \\
		\ifthenelse{\isundefined{\@lettertitle}}
		{}
		{\lettertitlestyle{\@lettertitle} \\ \\}
		\lettertextstyle{\@letteropening}
	\end{spacing}
}

% Closing / signing off
%% Usage: \makeletterclosing

\newcommand*{\letterclosing}[1]{%
	\ifthenelse{\equal{DE}{#1}}%
		{Mit freundlichen Gr{\"u}{\ss}en}%
		{Sincerely,}%
}%

\newcommand*{\makeletterclosing}{%
	\vspace{3.4mm}
	\lettertextstyle{\letterclosing{\cvLang}}
	\begin{figure}[h!]
		\includegraphics[width=0.18\linewidth]{sign}
	\end{figure} \\
	\letternamestyle{\@firstname\ \@lastname}
	\ifthenelse{\isundefined{\@letterenclosure}}%
		{\\}{%
		\\\\\\
		\letterenclosurestyle{\@letterenclname: \@letterenclosure} \\
		}%
}
