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
\RequirePackage[default,opentype]{sourcesanspro}
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
\definecolor{darkgray}{HTML}{363636}
\definecolor{gray}{HTML}{616161}
\definecolor{lightgray}{HTML}{999999}
% Basic colors
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
% Text colors
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
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
% Fonts
%-------------------------------------------------------------------------------
% Set font for header (default is Roboto)
\newfontfamily\headerfont[
	Path=\@fontdir,
	UprightFont=*-Regular,
	ItalicFont=*-Italic,
	BoldFont=*-Bold,
	BoldItalicFont=*-BoldItalic,
]{Roboto}

\newfontfamily\headerfontlight[
	Path=\@fontdir,
	UprightFont=*-Thin,
	ItalicFont=*-ThinItalic,
	BoldFont=*-Medium,
	BoldItalicFont=*-MediumItalic,
]{Roboto}

\newcommand*{\footerfont}{\sourcesanspro}
\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}

%-------------------------------------------------------------------------------
% Styles TODO @hatimak
%-------------------------------------------------------------------------------
% Configure styles for each CV elements
% For fundamental structures
\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{32pt}{1em}\headerfont\bfseries\color{text} #1}}
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{32pt}{1em}\headerfontlight\color{graytext} #1}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{7.6pt}{1em}\bodyfont\scshape\color{awesome} #1}}
\newcommand*{\headeraddressstyle}[1]{{\fontsize{8pt}{1em}\headerfont\itshape\color{lighttext} #1}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{6.8pt}{1em}\headerfont\color{text} #1}}
\newcommand*{\headerquotestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\itshape\color{darktext} #1}}
\newcommand*{\footerstyle}[1]{{\fontsize{8pt}{1em}\footerfont\scshape\color{lighttext} #1}}
\newcommand*{\sectionstyle}[1]{{\fontsize{16pt}{1em}\bodyfont\bfseries\scshape\color{text}\@sectioncolor[#1]}}
\newcommand*{\subsectionstyle}[1]{{\fontsize{12pt}{1em}\bodyfont\scshape\textcolor{text}{#1}}}
\newcommand*{\paragraphstyle}{\fontsize{9pt}{1em}\bodyfontlight\upshape\color{text}}

% For elements of entry
\newcommand*{\entrytitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\slshape\color{graytext} #1}}
\newcommand*{\entrydatestyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{awesome} #1}}
\newcommand*{\descriptionstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\upshape\color{text} #1}}

\newcommand*{\experiencepositionstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\scshape\color{awesome} #1}}
\newcommand*{\entrysubtitlestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\slshape\color{graytext} #1}}

\newcommand*{\positionorgstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\slshape\color{awesome} #1}}

% For elements of subentry
\newcommand*{\subentrytitlestyle}[1]{{\fontsize{8pt}{1em}\bodyfont\mdseries\color{graytext} #1}}
\newcommand*{\subentrypositionstyle}[1]{{\fontsize{7pt}{1em}\bodyfont\scshape\color{graytext} #1}}
\newcommand*{\subentrydatestyle}[1]{{\fontsize{7pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\subentrylocationstyle}[1]{{\fontsize{7pt}{1em}\bodyfontlight\slshape\color{awesome} #1}}
\newcommand*{\subdescriptionstyle}[1]{{\fontsize{8pt}{1em}\bodyfontlight\upshape\color{text} #1}}

% For elements of honor
\newcommand*{\honortitlestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\color{graytext} #1}}
\newcommand*{\honorpositionstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\honordatestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\slshape\color{graytext} #1}}
\newcommand*{\honorlocationstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{awesome} #1}}

% For elements of skill
\newcommand*{\skilltypestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\skillsetstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\color{text} #1}}

% For elements of school
\newcommand*{\schooldatestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\slshape\color{graytext} #1}}
\newcommand*{\schoolinstitutionstyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\degreetitlestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\slshape\color{awesome} #1}}
\newcommand*{\schooldegreestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\scshape\color{graytext} #1}}
\newcommand*{\schoolscorestyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\color{text} #1}}
\newcommand*{\schoollocationstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{awesome} #1}}

% For elements of the cover letter
\newcommand*{\lettersectionstyle}[1]{{\fontsize{14pt}{1em}\bodyfont\bfseries\color{text}\@sectioncolor[#1]}}
\newcommand*{\recipientaddressstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\scshape\color{graytext} #1}}
\newcommand*{\recipienttitlestyle}[1]{{\fontsize{11pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\lettertitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\bfseries\color{darktext} \underline{#1}}}
\newcommand*{\letterdatestyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\lettertextstyle}{\fontsize{10pt}{1.4em}\bodyfontlight\upshape\color{graytext}}
\newcommand*{\letternamestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\letterenclosurestyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\slshape\color{lighttext} #1}}


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
%% Usage: \name{<position>}
\newcommand*{\position}[1]{\def\@position{#1}}

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
% Helpers
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
\newcommand{\acvSectionContentTopSkip}{2.5mm}


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
					{\setlength{\photodim}{1.1cm}}%
					{\setlength{\photodim}{1.5cm}}%
				\ifthenelse{\equal{\@photoedge}{edge}}%
					{\def\@photoborder{awesome}}%
					{\def\@photoborder{none}}%
				\begin{tikzpicture}%
					\node[\@photoshape, draw=\@photoborder, line width=0.4mm, inner sep=\photodim, fill overzoom image=\@photo] () {};
				\end{tikzpicture}%
			}%
	}
	\newlength{\headertextwidth}%
	\newlength{\headerphotowidth}%
	\ifthenelse{\isundefined{\@photo}}{%
		\setlength{\headertextwidth}{\textwidth}%
		\setlength{\headerphotowidth}{0cm}%
	}{%
		\setlength{\headertextwidth}{0.76\textwidth}%
		\setlength{\headerphotowidth}{0.24\textwidth}%
	}%
	\begin{minipage}[c]{\headerphotowidth}%
		\ifthenelse{\equal{\@photoalign}{left}}
			{\raggedright\drawphoto}%
			{}%
	\end{minipage}%
	\begin{minipage}[c]{\headertextwidth}%
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
		\ifthenelse{\isundefined{\@address}}%
			{}%
			{\headeraddressstyle{\@address\\[\acvHeaderAfterAddressSkip]}}%
		\headersocialstyle{%
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
		} \\[\acvHeaderAfterSocialSkip]%
		\ifthenelse{\isundefined{\@quote}}%
			{}{%
			\headerquotestyle{\@quote\\}\vspace{\acvHeaderAfterQuoteSkip}}%
	\end{minipage}%
	\begin{minipage}[c]{\headerphotowidth}%
		\ifthenelse{\equal{\@photoalign}{right}}%
			{\raggedleft\drawphoto}%
			{}%
	\end{minipage}%
	\ifthenelse{\isundefined{\@photo}}%
		{\vspace{-3.5mm}}%
		{\vspace{-6.5mm}}%
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
%% TODO @hatimak: Make English and German versions
%% Usage: \cvsection{<section-title>}
\newcommand{\cvsection}[1]{%
	\vspace{\acvSectionTopSkip}
	\sectionstyle{#1}
	\phantomsection
	\color{awesome}\vhrulefill{0.9pt}
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

% Environment for skills
\newenvironment{cvskills}{%
	\vspace{\acvSectionContentTopSkip}
	\vspace{-2.0mm}
	\begin{center}
		\setlength\tabcolsep{1ex}
		\setlength{\extrarowheight}{0pt}
		\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} R{3.0cm} L{\textwidth - 3.0cm}}
}{%
		\end{tabular*}
	\end{center}
	\vspace{-2mm}
}

% Entry for skill
%% Usage: \cvskill{<type>}{<skillset>}
\newcommand*{\cvskill}[2]{%
	\skilltypestyle{#1} & \skillsetstyle{#2} \\
}

% Environment for CV items, bullet list for description, particularly in the Experiences section
\newenvironment{cvitems}{%
	\vspace{-4.0mm}
	\begin{justify}
		\begin{itemize}[leftmargin=2.67ex, nosep, noitemsep]
			\setlength{\parskip}{0pt}
			\renewcommand{\labelitemi}{\bullet}
}{%
		\end{itemize}
	\end{justify}
	\vspace{-4.0mm}
}

% Environment for Education
\newenvironment{cveducation}{%
	\vspace{\acvSectionContentTopSkip}
	\vspace{-2mm}
	\begin{center}
		\setlength\tabcolsep{0pt}
		\setlength{\extrarowheight}{2.0pt}
		\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 3.5cm} R{3.5cm}}
}{%
		\end{tabular*}
	\end{center}
	\vspace{-4.0mm}
}

% Entry for education section
\newcommand*{\cvschool}[8]{%
	\schoolinstitutionstyle{#3} & \schoollocationstyle{#4} \\[-2.0pt]

	\ifempty{#7} {\experiencepositionstyle{#1} & \entrydatestyle{#5} \\[-2.0pt]
	\entrysubtitlestyle{#2} & \ifbool{eduShowGrade}{\entrydatestyle{#6}}{} \\[-2.0pt]}
	{\experiencepositionstyle{#1 #2} & \entrydatestyle{#5} \\[-2.0pt]
	\entrysubtitlestyle{Thesis:} ``\entrysubtitlestyle{#7}'' & \ifbool{eduShowGrade}{\entrydatestyle{#6}}{} }\ifempty{#8} {\\[3.0pt]} {\\[-2.0pt]
	\multicolumn{2}{L{\textwidth}}{\descriptionstyle{#8}} \\[3.0pt]}
}

% Define an environment for cvexperience
\newenvironment{cvexperience}{%
\vspace{\acvSectionContentTopSkip}
\begin{center}
	}{%
	\vspace{-4.0mm}
\end{center}
}
% Define an entry of cv experience
\newcommand*{\cvposition}[6]{%
\vspace{-2.0mm}
\setlength\tabcolsep{0pt}
\setlength{\extrarowheight}{0pt}
\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.0cm} p{4.0cm}}
	\experiencepositionstyle{#1} & \ifempty{#3} {\multirow{1}{=}{\raggedleft \entrylocationstyle{#4}} \\
	\entrytitlestyle{#2} & \multirow{1}{=}{\raggedleft \entrydatestyle{#5}} \\}
	{\multirow[b]{2}{=}{\raggedleft \entrylocationstyle{#4}} \\
	\entrytitlestyle{#2} & \\
	\entrysubtitlestyle{#3} & \multirow{1}{=}{\raggedleft \entrydatestyle{#5}} \\}
	\multicolumn{2}{L{\textwidth}}{\descriptionstyle{#6}}
\end{tabular*}
\vspace{0.75mm}%
}

% Define an environment for cvprojects
\newenvironment{cvprojects}{%
\vspace{\acvSectionContentTopSkip}
\begin{center}
	}{%
	\vspace{-4.0mm}
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


% Define an environment for cvpositions
\newenvironment{cvpositions}{%
\vspace{\acvSectionContentTopSkip}
\begin{center}
	}{%
	\vspace{-4.0mm}
\end{center}
}

% Define an entry of cv positions
\newcommand*{\cvrole}[5]{%
\vspace{-2.0mm}
\setlength\tabcolsep{0pt}
\setlength{\extrarowheight}{0pt}
\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.0cm} R{4.0cm}}
	\entrytitlestyle{#1} & \entrylocationstyle{#3} \\
	\positionorgstyle{#2} & \entrydatestyle{#4} \ifempty{#5} {} {\\
	\multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}} }
\end{tabular*}
%  \vspace{0.5mm}%
}

% Define an entry of cv positions for 2 positions at the same institute/organisation
\newcommand*{\cvroletwo}[8]{%
\vspace{-2.0mm}
\setlength\tabcolsep{0pt}
\setlength{\extrarowheight}{0pt}
\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.0cm} R{4.0cm}}
	\entrytitlestyle{#1} & \entrylocationstyle{#2} \\
	\positionorgstyle{#3} & \entrydatestyle{#4} \ifempty{#5} {\\} {\\
	\multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}} \\}
	\positionorgstyle{#6} & \entrydatestyle{#7} \ifempty{#8} {} {\\
	\multicolumn{2}{L{\textwidth}}{\descriptionstyle{#8}} }
\end{tabular*}
%  \vspace{0.5mm}%
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
%% Usage: \lettersection{<section-title>}
\newcommand{\lettersection}[1]{%
	\par\addvspace{2.5ex}
	\phantomsection{}
	\lettersectionstyle{#1}
	\par\nobreak\addvspace{0.4ex}
}

% Opening (cover letter)
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
