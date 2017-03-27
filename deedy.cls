% Intro Options
\ProvidesClass{deedy}[2014/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

% Package Imports
\usepackage[hmargin=1.25cm, vmargin=0.7cm]{geometry}
\usepackage[usenames,dvipsnames]{xcolor}
\usepackage[hidelinks]{hyperref}
\usepackage{titlesec}
\usepackage[absolute]{textpos}
\usepackage[UKenglish]{babel}
\usepackage[UKenglish]{isodate}
\usepackage{fontspec,xltxtra,xunicode}
\usepackage{fontawesome}
\usepackage{siunitx}

% Color definitions
\definecolor{date}{HTML}{666666}
\definecolor{primary}{HTML}{2b2b2b}
\definecolor{headings}{HTML}{6a6a6a}
\definecolor{subheadings}{HTML}{333333}

% Set main fonts
\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Color=primary, Path = fonts/raleway/]{Raleway-Regular}
\newfontfamily{\FA}{FontAwesome}

% Name command
\newcommand{\namesection}[5]{
	\centering{
		\sffamily
		\fontspec[Path = fonts/raleway/]{Raleway-SemiBold}\fontsize{40pt}{10cm}\selectfont #1 
		\fontspec[Path = fonts/raleway/]{Raleway-Light}\selectfont #2
	} \\
	\vspace{5pt}
	\centering{ \color{headings}\fontspec[Path = fonts/raleway/]{Raleway-SemiBold}\fontsize{11pt}{14pt}\selectfont #3} \\
    \vspace{2pt}
    \centering{ \color{headings}\fontspec[Path = fonts/raleway/]{Raleway-Italic}\fontsize{11pt}{14pt}\selectfont #4} \\
    \vspace{2pt}
    \centering{ \color{headings}\fontspec[Path = fonts/raleway/]{Raleway-Regular}\fontsize{11pt}{14pt}\selectfont #5}
	\noindent\makebox[\linewidth]{\rule{\paperwidth}{0.4pt}}
	\vspace{-15pt}
}
\titlespacing{\section}{0pt}{0pt}{0pt}

% Headings command
\titleformat{\section}{\color{headings}
\scshape\fontspec[Path = fonts/raleway/]{Raleway-Regular}\fontsize{16pt}{24pt}\selectfont \raggedright\uppercase}{} {0em}{}

% Subeadings command
\titleformat{\subsection}{\color{subheadings}
\fontspec[Path = fonts/raleway/]{Raleway-SemiBold}\fontsize{12pt}{12pt}\selectfont\bfseries\flushleft\uppercase}{}{0em}{}
\titlespacing{\subsection}{0pt}{\parskip}{-\parskip}
\titlespacing{\subsubsection}{0pt}{\parskip}{-\parskip}
\newcommand{\runsubsection}[1]{\color{subheadings}
\fontspec[Path = fonts/raleway/]{Raleway-SemiBold}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase{#1}\normalfont}

% Descriptors command
\newcommand{\descript}[1]{\color{subheadings}\raggedright\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont {#1 \\} \normalfont}

% Location command
\newcommand{\location}[1]{\color{headings}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont {#1 \\} \normalfont}

% Section seperators command
\newcommand{\sectionsep}[0]{\vspace{8pt}}

% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{\vspace{-\topsep}\begin{itemize}\itemsep1.3pt \parskip0pt \parsep0pt}{\end{itemize}\vspace{-\topsep}}

\RequirePackage{hyperref}