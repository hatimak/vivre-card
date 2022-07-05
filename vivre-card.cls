%% Start of file `vivre-card.cls'.
% Vivre Card CV Class file
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

\usepackage[german,english]{babel}
\RequirePackage{datetime}
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
%\def\cvLang{DE}
%% This remains commented because the Makefile passes the relevant define from 
%% the command-line. Uncomment this and set to desired value if not using the 
%% Makefile

% Display basic emojis
%% Use \ifthenelse construct in your file to personalise use
\newbool{showEmojis}
\setbool{showEmojis}{false}


%-------------------------------------------------------------------------------
% Colors TODO @hatimak
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{212121}
\definecolor{mediumgray}{HTML}{454545}
\definecolor{gray}{HTML}{454545}
\definecolor{lightgray}{HTML}{696969}

% Text colors
\definecolor{darktext}{HTML}{474747}
\definecolor{text}{HTML}{424242}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}


%-------------------------------------------------------------------------------
% Styles
%-------------------------------------------------------------------------------
\newcommand*{\cvStylesHeaderFirstName}[1]{{\fontsize{30.0pt}{1em}\normalfont\color{text} #1}}
\newcommand*{\cvStylesHeaderLastName}[1]{{\fontsize{30.0pt}{1em}\bfseries\color{graytext} #1}}

\newcommand*{\cvStylesSimpleDate}[1]{{\fontsize{10.25pt}{1em}\fontseries{sbc}\selectfont\slshape\color{darktext} #1}}
\newcommand*{\cvStylesSimpleLocation}[1]{{\fontsize{9.625pt}{1em}\slshape\color{graytext} #1}}
\newcommand*{\cvStylesSimpleTitle}[1]{{\fontsize{10.375pt}{1em}\bfseries\color{darktext} #1}}
\newcommand*{\cvStylesSimpleOrganisation}[1]{{\fontsize{9.625pt}{1em}\fontseries{sbc}\selectfont\slshape\color{graytext} #1}}
\newcommand*{\cvStylesSimpleSubtitle}[1]{{\fontsize{9.375pt}{1em}\fontseries{sbc}\selectfont\slshape\color{lighttext} #1}}
\newcommand*{\cvStylesSimpleDescriptions}[1]{{\fontsize{9.375pt}{1em}\upshape\color{text} #1}}

\newcommand*{\cvStylesSimpleLetter} {\fontsize{10.0pt}{1.4em}\upshape\color{graytext} }


\newcommand*{\cvStylesSimpleHeaderMainData}[1]{{\fontsize{8.375pt}{1em}\upshape\color{text} #1}}
\newcommand*{\cvStylesSimpleHeaderSupplementData}[1]{{\fontsize{8.25pt}{1em}\upshape\color{graytext} #1}}
\newcommand*{\cvStylesSimpleHeaderField}[1]{{\fontsize{8.25pt}{1em}\normalfont\slshape\color{graytext} #1}}

\newcommand*{\cvStylesSimpleFooter}[1]{{\fontsize{8pt}{1em}\fontseries{sbc}\selectfont\color{lighttext} #1}}


\newcommand*{\cvStylesSimpleSection}[1]{{\fontsize{16.0pt}{1em}\bfseries\color{text}#1}}
\newcommand*{\cvStylesSimpleSubsection}[1]{{\fontsize{14.0pt}{1em}\bfseries\color{text}#1}}

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
%% Usage: \address{EN | DE}{<address>}
\newcommand*{\address}[2]{ \ifthenelse{\equal{DE}{#1}} {\def\@addressDE{#2}} {\def\@addressEN{#2}} }

% Position
\newcommand*{\position}[1]{\def\@position{#1}}

% Date of Birth
%% Usage: \birthdate{<birth date>}{<birth month>}{<birth year>}
\newcommand*{\birthdate}[3]{\def\@birthdate{ \switchDE{#1.\space\monthnamegerman[#2]}{#1\space\monthnameenglish[#2]}#3 }}

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

% Custom Link (optional)
%% Usage: \customlink{<name>}{<href url>}
\newcommand*{\customlink}[2]{\def\@customlinkname{#1}\def\@customlinkhref{#2}}

% Twitter
%% Usage: \twitter{<twitter handle>}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}

% Xing (optional)
%% Usage: \xing{<xing name>}
\newcommand*{\xing}[1]{\def\@xing{#1}}

% Recipient's information (cover letter)
%% Usage: \recipient{<company name or dept>}{<recipient address>}
\newcommand*{\recipient}[2]{\def\@recipientname{#1}\def\@recipientaddress{#2}}

% Title (cover letter, optional)
%% Usage: \lettertitle{<title>}
\newcommand*{\lettertitle}[1]{\def\@lettertitle{#1}}

% Date (cover letter)
%% Usage: \letterdate{<date>}{<month>}{<year>}
\newcommand*{\letterdate}[3]{\def\@letterdate{\switchDE{#1.\space\monthnamegerman[#2]}{#1\space\monthnameenglish[#2]}\space #3}}

% Enclosure for letter (cover letter, optional)
\newcommand*{\letterenclosure}[2]{ \ifthenelse{\equal{DE}{#1}} {\def\@letterenclosureDE{#2}} {\def\@letterenclosureEN{#2}} }


%-------------------------------------------------------------------------------
% Helpers TODO: @hatimak
%-------------------------------------------------------------------------------
%% Define helper macros a user can change easily
% Header
\newcommand{\acvHeaderAfterSocialSkip}{6mm}

% Simple Nature geometrical measurements
\newcommand{\cvNatureLeftSidebar}{3.90cm}
\newcommand{\cvNatureColumnInset}{0.80em}

% Section, like Education, Experience
%% Usage: \cvsection{<section-title>}
\newcommand{\cvsection}[1]{%
	\vspace{2.67mm}
	\cvStylesSimpleSection{ #1 }
	\phantomsection
}

% Environment for CV items, bullet list for description, particularly in the Experiences section
\newenvironment{cvitems}{%
	\vspace{-4.0mm}
		\begin{itemize}[leftmargin=4.0ex]
			\setlength{\parskip}{0pt}
			\setlength\itemsep{0.27em}
}{%
		\end{itemize}
	\vspace{-4.0mm}
}

\newenvironment{cvInnerItems}{%
	\begin{itemize}[leftmargin=4.0ex]
		\setlength{\parskip}{0pt}
		\setlength\itemsep{0.18em}
}{%
	\end{itemize}
	\vspace{-4.0mm}
}


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

%-------------------------------------------------------------------------------
% CV Structure
%-------------------------------------------------------------------------------
% Header
% ------
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
					{\def\@photoborder{mediumgray}}%
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
		\cvStylesHeaderFirstName{\@firstname}\cvStylesHeaderLastName{{}\space\@lastname}%
		\\[0.6mm]%
		\ifthenelse{\isundefined{\@position}}%
			{}%
			{\cvStylesSimpleOrganisation{\@position\\[-0.3mm]}}%
		\begin{center}
			\vspace{1.67mm}{%
			\setlength{\tabcolsep}{0pt}
			\setlength\extrarowheight{-3pt}
			\begin{tabular}{ r l }%
				\cvStylesSimpleHeaderField{\ifbool{showEmojis}{\emoji{birthday-cake}\space}{\switchDE{Geburtsdatum:}{Birth date:}{}}} & \cvStylesSimpleHeaderMainData{\@birthdate} \\%
				\ifthenelse{\isundefined{\@addressDE} \or \isundefined{\@addressEN}}%
					{}{%
					\cvStylesSimpleHeaderField{\ifbool{showEmojis}{\emoji{house-with-garden}\space}{\switchDE{Anschrift:}{Address:}{}}} & \cvStylesSimpleHeaderMainData{\switchDE{\@addressDE}{\@addressEN}} \\ }%
				\ifthenelse{\isundefined{\@mobile}}%
					{}{%
					\cvStylesSimpleHeaderField{\ifbool{showEmojis}{\emoji{mobile-phone}\space}{\switchDE{Telefon:}{Phone:}{}}} & \cvStylesSimpleHeaderMainData{\@mobile} \\ }%
				\ifthenelse{\isundefined{\@email}}%
					{}{%
					\cvStylesSimpleHeaderField{\ifbool{showEmojis}{\emoji{envelope}\space}{\switchDE{Email:}{Email:}{}}} & \cvStylesSimpleHeaderMainData{\href{mailto:\@email}{\@email}} \\ }%
				\ifthenelse{\isundefined{\@homepage}}%
					{}{%
					\cvStylesSimpleHeaderField{\ifbool{showEmojis}{\emoji{globe-with-meridians}\space}{\switchDE{Homepage:}{Home page:}{}}} & \cvStylesSimpleHeaderMainData{\href{https://\@homepage}{\cvStylesSimpleHeaderSupplementData{https://}\@homepage}} \\ }%
				\ifthenelse{\isundefined{\@github}}%
					{}{%
					\cvStylesSimpleHeaderField{\ifbool{showEmojis}{\faGithubSquare\space}{\switchDE{GitHub:}{GitHub:}{}}} & \cvStylesSimpleHeaderMainData{\href{https://github.com/\@github}{\cvStylesSimpleHeaderSupplementData{https://github.com/}\@github}} \\ }%
				\ifthenelse{\isundefined{\@gitlab}}%
					{}{%
					\cvStylesSimpleHeaderField{\ifbool{showEmojis}{\faGitlab\space}{\switchDE{GitLab:}{GitLab:}{}}} & \cvStylesSimpleHeaderMainData{\href{https://gitlab.com/\@gitlab}{\cvStylesSimpleHeaderSupplementData{https://gitlab.com/}\@gitlab}} \\ }%
				\ifthenelse{\isundefined{\@linkedin}}%
					{}{%
					\cvStylesSimpleHeaderField{\ifbool{showEmojis}{\faLinkedinSquare\space}{\switchDE{LinkedIn:}{LinkedIn:}{}}} & \cvStylesSimpleHeaderMainData{\href{https://www.linkedin.com/in/\@linkedin}{\cvStylesSimpleHeaderSupplementData{https://www.linkedin.com/in/}\@linkedin}} \\ }%
				\ifthenelse{\isundefined{\@customlinkname}}%
					{}{%
					\cvStylesSimpleHeaderField{\ifbool{showEmojis}{\emoji{link}\space}{\switchDE{\@customlinkname:}{\@customlinkname:}{}}} & \cvStylesSimpleHeaderMainData{\href{\@customlinkhref}{\@customlinkhref}} \\ }%
				\ifthenelse{\isundefined{\@twitter}}%
					{}{%
					\cvStylesSimpleHeaderField{\ifbool{showEmojis}{\faTwitter\space}{\switchDE{Twitter:}{Twitter:}{}}} & \cvStylesSimpleHeaderMainData{\href{https://twitter.com/\@twitter}{\cvStylesSimpleHeaderSupplementData{https://twitter.com/}\@twitter}} \\ }%
				\ifthenelse{\isundefined{\@xing}}%
					{}{%
					\cvStylesSimpleHeaderField{\ifbool{showEmojis}{\faXingSquare\space}{\switchDE{Xing:}{Xing:}{}}} & \cvStylesSimpleHeaderMainData{\href{https://www.xing.com/profile/\@xing}{\cvStylesSimpleHeaderSupplementData{https://www/xing.com/profile/}\@xing}} \\ }%
			\end{tabular}}%
			\vspace{-9.33mm}
		\end{center}
		\vspace{\acvHeaderAfterSocialSkip}
		\noindent\centering\color{lightgray}\rule[0.5\baselineskip]{0.72\headertextwidth}{1.0pt}
	\end{minipage}%
	\begin{minipage}{\headerphotowidth}%
		\ifthenelse{\equal{\@photoalign}{right}}%
			{\raggedright\drawphoto}%
			{}%
	\end{minipage}%
	\vspace{-4.0mm}
	\ifthenelse{\isundefined{\@photo}}%
		{\vspace{2.0mm}}%
}
%-------------------------------------------------------------------------------

% Footer
% ------
%% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand*{\makecvfooter}[3]{%
	\fancyfoot{}
	\fancyfoot[L]{\cvStylesSimpleFooter{#1}}
	\fancyfoot[C]{\cvStylesSimpleFooter{#2}}
	\fancyfoot[R]{\cvStylesSimpleFooter{#3}}
}
%-------------------------------------------------------------------------------

% Skills
%-------
\newenvironment{cvskills}{%
	\switchDE{\cvsection{Kenntnisse}}{\cvsection{Skills}}%
	\begin{center}
		
		\begin{tabular*}{\textwidth}{ R{\cvNatureLeftSidebar} @{\hspace{\cvNatureColumnInset}} L{\textwidth - \cvNatureLeftSidebar - \cvNatureColumnInset} }
}{%
		\end{tabular*}
	\end{center}
	\vspace{1.0mm}%
	\vspace{-4.33mm}
}

% Entry for skill
%% Usage: \cvskill{<type>}{<skillset>}
\newcommand*{\cvskill}[3]{%
	\ifthenelse{\equal{DE}{\cvLang}} {\cvStylesSimpleTitle{#2}} {\cvStylesSimpleTitle{#1}} & \cvStylesSimpleDescriptions{#3} \\
	\\ [-1.0em]
}
%-------------------------------------------------------------------------------

% Education
%----------
\newenvironment{cveducation}{%
	\switchDE{\cvsection{Ausbildung}}{\cvsection{Education}}%
	\begin{center}%
}{%
	\end{center}%
	\vspace{2.0mm}%
	\vspace{-4.33mm}%
}

\newcommand{\cvEducationDegree}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvEducationDegreeDE{#2}} {\def\@cvEducationDegreeEN{#2}} }%
\newcommand{\cvEducationDegreeName}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvEducationDegreeNameDE{#2}} {\def\@cvEducationDegreeNameEN{#2}} }%
\newcommand{\cvEducationInstitution}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvEducationInstitutionDE{#2}} {\def\@cvEducationInstitutionEN{#2}} }%
\newcommand{\cvEducationLocation}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvEducationLocationDE{#2}} {\def\@cvEducationLocationEN{#2}} }%
\newcommand{\cvEducationDescription}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvEducationDescriptionDE{#2}} {\def\@cvEducationDescriptionEN{#2}} }%
\newcommand{\cvEducationDates}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvEducationDatesDE{#2}} {\def\@cvEducationDatesEN{#2}} }%
\newcommand{\cvEducationGrade}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvEducationGradeDE{#2}} {\def\@cvEducationGradeEN{#2}} }%

% Entry for education section
\newcommand*{\cvSchoolFlush}{%
	\vspace{-0.67mm}%
	\begin{tabular*}{\textwidth}{ R{\cvNatureLeftSidebar} @{\hspace{\cvNatureColumnInset}} L{\textwidth - \cvNatureLeftSidebar - \cvNatureColumnInset} }%
		\multirow{2}{=}{ \raggedleft \cvStylesSimpleDate{ \switchDE{\@cvEducationDatesDE}{\@cvEducationDatesEN} }\newline \cvStylesSimpleLocation{ \switchDE{\@cvEducationLocationDE}{\@cvEducationLocationEN} }} & \cvStylesSimpleTitle{ \switchDE{\@cvEducationDegreeDE\space\@cvEducationDegreeNameDE}{\@cvEducationDegreeEN\space\@cvEducationDegreeNameEN} } \\
		& \cvStylesSimpleOrganisation{ \switchDE{\@cvEducationInstitutionDE}{\@cvEducationInstitutionEN} } \ifempty{\@cvEducationGradeDE} {} {\\
		& \cvStylesSimpleSubtitle{\switchDE{Abschlussnote}{Final Grade} \switchDE{\@cvEducationGradeDE}{\@cvEducationGradeEN}}} \ifempty{\@cvEducationDescriptionDE} {} {\\
		& \cvStylesSimpleDescriptions{ \switchDE{\@cvEducationDescriptionDE}{\@cvEducationDescriptionEN} }}%
	\end{tabular*}%
	\vspace{-1.67mm}%
}
%-------------------------------------------------------------------------------

% References
%-----------
\newenvironment{cvReferences}{%
	\switchDE{\cvsection{Referenzen}}{\cvsection{References}}%
	\begin{center}%
}{%
	\end{center}%
	\vspace{-4.33mm}%
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
		\cvStylesSimpleSubtitle{\ifbool{showEmojis}{\emoji{mobile-phone}}{\cvStylesSimpleHeaderField{\switchDE{Telefon}{Phone}:}}} \cvStylesSimpleDate{\@cvRefereeTelephoneOne} & \cvStylesSimpleSubtitle{\ifbool{showEmojis}{\emoji{mobile-phone}}{\cvStylesSimpleHeaderField{\switchDE{Telefon}{Phone}:}}} \cvStylesSimpleDate{\@cvRefereeTelephoneTwo} \\
		\cvStylesSimpleSubtitle{\ifbool{showEmojis}{\emoji{envelope}}{\cvStylesSimpleHeaderField{Email:}}} \cvStylesSimpleDate{ \href{mailto:\@cvRefereeEmailOne}{\@cvRefereeEmailOne} } & \cvStylesSimpleSubtitle{\ifbool{showEmojis}{\emoji{envelope}}{\cvStylesSimpleHeaderField{Email:}}} \cvStylesSimpleDate{ \href{mailto:\@cvRefereeEmailTwo}{\@cvRefereeEmailTwo} }
	\end{tabular*}%
	\vspace{2.0mm}%
}
%-------------------------------------------------------------------------------

% Experience
%-----------
\newenvironment{cvexperience}{%
	\switchDE{\cvsection{Berufserfahrung}}{\cvsection{Experience}}%
	\begin{center}
}{%
	\end{center}
	\vspace{-3.33mm}
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
	\vspace{-0.67mm}%
	\begin{tabular*}{\textwidth}{ R{\cvNatureLeftSidebar} @{\hspace{\cvNatureColumnInset}} L{\textwidth - \cvNatureLeftSidebar - \cvNatureColumnInset} }%
		\multirow{3}{=}{ \raggedleft \cvStylesSimpleDate{ \switchDE{\@cvExperienceDatesDE}{\@cvExperienceDatesEN} }\newline \cvStylesSimpleLocation{ \switchDE{\@cvExperienceLocationDE}{\@cvExperienceLocationEN} }} & \cvStylesSimpleTitle{ \switchDE{\@cvExperienceTitleDE}{\@cvExperienceTitleEN} } \\
		& \cvStylesSimpleOrganisation{ \switchDE{\@cvExperienceOrganisationDE}{\@cvExperienceOrganisationEN} } \\
		& \cvStylesSimpleDescriptions{ \switchDE{\@cvExperienceDescriptionDE}{\@cvExperienceDescriptionEN} }
	\end{tabular*}%
	\vspace{-1.67mm}%
}
%-------------------------------------------------------------------------------

% Projects
%-----------
\newenvironment{cvProjects}{%
	\switchDE{\cvsection{Projekte}}{\cvsection{Projects}}%
	\begin{center}
}{%
	\end{center}
	\vspace{-3.33mm}
}

\newcommand{\cvProjectTitle}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvProjectTitleDE{#2}} {\def\@cvProjectTitleEN{#2}} }
\newcommand{\cvProjectSubtitle}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvProjectSubtitleDE{#2}} {\def\@cvProjectSubtitleEN{#2}} }
\newcommand{\cvProjectLocation}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvProjectLocationDE{#2}} {\def\@cvProjectLocationEN{#2}} }
\newcommand{\cvProjectDates}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvProjectDatesDE{#2}} {\def\@cvProjectDatesEN{#2}} }
\newcommand{\cvProjectDescription}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvProjectDescriptionDE{#2}} {\def\@cvProjectDescriptionEN{#2}} }
\newcommand{\cvProjectOrganisation}[2]{%
	\ifthenelse{\equal{DE}{#1}} {\def\@cvProjectOrganisationDE{#2}} {\def\@cvProjectOrganisationEN{#2}} }

\newcommand*{\cvProjectFlush}{%
	\begin{tabular*}{\textwidth}{ R{\cvNatureLeftSidebar} @{\hspace{\cvNatureColumnInset}} L{\textwidth - \cvNatureLeftSidebar - \cvNatureColumnInset} }%
		\multirow{3}{=}{ \raggedleft \cvStylesSimpleDate{ \switchDE{\@cvProjectDatesDE}{\@cvProjectDatesEN} }\newline \cvStylesSimpleLocation{ \switchDE{\@cvProjectLocationDE}{\@cvProjectLocationEN} }} & \cvStylesSimpleTitle{ \switchDE{\@cvProjectTitleDE}{\@cvProjectTitleEN} } \\
		& \cvStylesSimpleOrganisation{ \switchDE{\@cvProjectOrganisationDE}{\@cvProjectOrganisationEN} } \\
		& \cvStylesSimpleDescriptions{ \switchDE{\@cvProjectDescriptionDE}{\@cvProjectDescriptionEN} }
	\end{tabular*}%
	\vspace{-1.5mm}%
}
%-------------------------------------------------------------------------------

% Positions / Extracurricular activities 
%---------------------------------------
\newenvironment{cvpositions}{%
	\switchDE{\cvsection{Ehrenamtliches und sonstige T{\"a}tigkeiten}}{\cvsection{Volunteering}}%
	\begin{center}
}{%
	\end{center}%
	\vspace{1.0mm}%
	\vspace{-4.33mm}%
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
	\vspace{-0.67mm}%
	\begin{tabular*}{\textwidth}{ R{\cvNatureLeftSidebar} @{\hspace{\cvNatureColumnInset}} L{\textwidth - \cvNatureLeftSidebar - \cvNatureColumnInset} }%
		\multirow{3}{=}{ \raggedleft \cvStylesSimpleDate{\ifthenelse{\equal{DE}{\cvLang}}{\@cvPositionDatesDE}{\@cvPositionDatesEN}}\newline \cvStylesSimpleLocation{\ifthenelse{\equal{DE}{\cvLang}}{\@cvPositionLocationDE}{\@cvPositionLocationEN}}} & \cvStylesSimpleTitle{\ifthenelse{\equal{DE}{\cvLang}}{\@cvPositionPostDE}{\@cvPositionPostEN}} \\
		& \cvStylesSimpleOrganisation{\ifthenelse{\equal{DE}{\cvLang}}{\@cvPositionOrganisationDE}{\@cvPositionOrganisationEN}} \\
		& \cvStylesSimpleDescriptions{\ifthenelse{\equal{DE}{\cvLang}}{\@cvPositionDescriptionDE}{\@cvPositionDescriptionEN}}
	\end{tabular*}%
	\vspace{-1.67mm}%
}
%-------------------------------------------------------------------------------

% Summary
%--------
\newenvironment{cvSummary}{%
	\switchDE{\cvsection{Kurzprofil}}{\cvsection{Summary}}%
	\cvStylesSimpleLetter{
		\par\nobreak
}{%
	}
	\vspace{3.0mm}%
	\vspace{-4.0mm}%
}

%-------------------------------------------------------------------------------
% Cover Letter elements
%-------------------------------------------------------------------------------
% Define an environment for cvletter
\newenvironment{cvletter}{%
	\cvStylesSimpleLetter
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
	\par\addvspace{0.9ex}
	\phantomsection{}
	\ifthenelse{\equal{DE}{\cvLang}}{%
		\cvStylesSimpleSubsection{\@letterSectionTitleDE}%
		\par\nobreak\addvspace{-0.90ex}%
		\@letterSectionTextDE
	}{%
		\cvStylesSimpleSubsection{\@letterSectionTitleEN}%
		\par\nobreak\addvspace{-0.90ex}%
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
% -----
%% Usage: \makelettertitle
\newcommand*{\makelettertitle}{%
	\vspace{3.0mm}%
	\cvStylesSimpleTitle{\@recipientname} \\[0.25\baselineskip]
	\cvStylesSimpleLocation{\@recipientaddress} \hfill \cvStylesSimpleDate{\@letterdate} \\[-1.0ex]

	\ifthenelse{\isundefined{\@lettertitle}}
		{}
		{\cvStylesSimpleTitle{\underline{\@lettertitle}}}
	
	\vspace{3.0mm}%
	\cvStylesSimpleLetter{\@letteropening}
}
%-------------------------------------------------------------------------------

% Closing / signing off
% ---------------------
%% Usage: \makeletterclosing

\newcommand*{\letterclosing}{%
	\ifthenelse{\equal{DE}{\cvLang}}%
		{Mit freundlichen Gr{\"u}{\ss}en}%
		{Sincerely,}%
}%

\newcommand*{\makeletterclosing}{%
	\cvStylesSimpleLetter{\letterclosing}
	\vspace{-1.0ex}
	\begin{figure}[h!]
		\includegraphics[width=0.18\linewidth]{sign}
	\end{figure} \\[-2.0ex]
	\cvStylesSimpleTitle{\@firstname\ \@lastname}
	\ifthenelse{\isundefined{\letterenclosure}}%
		{}{%
		\par\nobreak\addvspace{0.8ex}
		\cvStylesSimpleOrganisation{\switchDE{Im Anhang}{Attached}:} \cvStylesSimpleSubtitle{\switchDE{\@letterenclosureDE}{\@letterenclosureEN}}
		}%
}
