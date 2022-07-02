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

% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}


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

\RequirePackage{vivre-card-macros}


% Directory locations
%--------------------
\fontdir


% Layout
%-------
%% Page Layout
\geometry{left=1.2cm, top=0.7cm, right=1.2cm, bottom=1.2cm, footskip=0.1cm}


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
					{\def\@photoborder{darkgray}}%
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
			\vspace{1.5mm}{%
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
			\vspace{-9.0mm}
		\end{center}
		\vspace{\acvHeaderAfterSocialSkip}
		\noindent\centering\color{lightgray}\rule[0.5\baselineskip]{0.67\headertextwidth}{1.0pt}
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
	\vspace{2.0mm}%
	\vspace{-4.0mm}
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
	\vspace{3.0mm}%
	\vspace{-4.0mm}%
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
	\begin{tabular*}{\textwidth}{ R{\cvNatureLeftSidebar} @{\hspace{\cvNatureColumnInset}} L{\textwidth - \cvNatureLeftSidebar - \cvNatureColumnInset} }%
		\multirow{2}{=}{ \raggedleft \cvStylesSimpleDate{ \switchDE{\@cvEducationDatesDE}{\@cvEducationDatesEN} }\newline \cvStylesSimpleLocation{ \switchDE{\@cvEducationLocationDE}{\@cvEducationLocationEN} }} & \cvStylesSimpleTitle{ \switchDE{\@cvEducationDegreeDE\space\@cvEducationDegreeNameDE}{\@cvEducationDegreeEN \@cvEducationDegreeNameEN} } \\
		& \cvStylesSimpleOrganisation{ \switchDE{\@cvEducationInstitutionDE}{\@cvEducationInstitutionEN} } \ifempty{\@cvEducationGradeDE} {} {\\
		& \cvStylesSimpleSubtitle{\switchDE{Abschlussnote}{Final Grade} \switchDE{\@cvEducationGradeDE}{\@cvEducationGradeEN}}} \ifempty{\@cvEducationDescriptionDE} {} {\\
		& \cvStylesSimpleDescriptions{ \switchDE{\@cvEducationDescriptionDE}{\@cvEducationDescriptionEN} }}%
	\end{tabular*}%
	\vspace{-1.0mm}%
}
%-------------------------------------------------------------------------------

% References
%-----------
\newenvironment{cvReferences}{%
	\switchDE{\cvsection{Referenzen}}{\cvsection{References}}%
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
	\begin{tabular*}{\textwidth}{ R{\cvNatureLeftSidebar} @{\hspace{\cvNatureColumnInset}} L{\textwidth - \cvNatureLeftSidebar - \cvNatureColumnInset} }%
		\multirow{3}{=}{ \raggedleft \cvStylesSimpleDate{ \switchDE{\@cvExperienceDatesDE}{\@cvExperienceDatesEN} }\newline \cvStylesSimpleLocation{ \switchDE{\@cvExperienceLocationDE}{\@cvExperienceLocationEN} }} & \cvStylesSimpleTitle{ \switchDE{\@cvExperienceTitleDE}{\@cvExperienceTitleEN} } \\
		& \cvStylesSimpleOrganisation{ \switchDE{\@cvExperienceOrganisationDE}{\@cvExperienceOrganisationEN} } \\
		& \cvStylesSimpleDescriptions{ \switchDE{\@cvExperienceDescriptionDE}{\@cvExperienceDescriptionEN} }
	\end{tabular*}%
	\vspace{-1.0mm}%
}
%-------------------------------------------------------------------------------

% Positions / Extracurricular activities 
%---------------------------------------
\newenvironment{cvpositions}{%
	\switchDE{\cvsection{Ehrenamtliches und sonstige T{\"a}tigkeiten}}{\cvsection{Volunteering}}%
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
	\begin{tabular*}{\textwidth}{ R{\cvNatureLeftSidebar} @{\hspace{\cvNatureColumnInset}} L{\textwidth - \cvNatureLeftSidebar - \cvNatureColumnInset} }%
		\multirow{3}{=}{ \raggedleft \cvStylesSimpleDate{\ifthenelse{\equal{DE}{\cvLang}}{\@cvPositionDatesDE}{\@cvPositionDatesEN}}\newline \cvStylesSimpleLocation{\ifthenelse{\equal{DE}{\cvLang}}{\@cvPositionLocationDE}{\@cvPositionLocationEN}}} & \cvStylesSimpleTitle{\ifthenelse{\equal{DE}{\cvLang}}{\@cvPositionPostDE}{\@cvPositionPostEN}} \\
		& \cvStylesSimpleOrganisation{\ifthenelse{\equal{DE}{\cvLang}}{\@cvPositionOrganisationDE}{\@cvPositionOrganisationEN}} \\
		& \cvStylesSimpleDescriptions{\ifthenelse{\equal{DE}{\cvLang}}{\@cvPositionDescriptionDE}{\@cvPositionDescriptionEN}}
	\end{tabular*}%
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
	\vspace{\acvSectionTopSkip}%
	\cvStylesSimpleTitle{\@recipientname} \\[0.25\baselineskip]
	\cvStylesSimpleLocation{\@recipientaddress} \hfill \cvStylesSimpleDate{\@letterdate} \\[-1.0ex]

	\ifthenelse{\isundefined{\@lettertitle}}
		{}
		{\cvStylesSimpleTitle{\underline{\@lettertitle}}}
	
	\vspace{\acvSectionTopSkip}%
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
