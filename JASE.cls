%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              File: JASE.cls		                  %
%              Version: 1.12                          %
%              Date: 12th December 2019               %
%                                                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jase}[2020/02/18, v1.0]
\AtEndOfClass{\RequirePackage{microtype}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions*
\LoadClass{extarticle}

% Fonts and language
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{mathpazo} % Widely available alternative to Garamond
\RequirePackage[scaled]{helvet}
\RequirePackage[T1]{fontenc}
\RequirePackage{url}
\RequirePackage[colorlinks=true, allcolors=blue]{hyperref}
\RequirePackage{mfirstuc} %for uppercase the first letter of section title


% define font styles
\newcommand{\titlefont}{\normalfont\sffamily\bfseries\fontsize{15}{17}\selectfont}
\newcommand{\datesfont}{\normalfont\rmfamily\itshape\fontsize{8}{10}\selectfont}
%\renewcommand\UrlFont{\color{color1}\rmfamily}
\newcommand{\absfont}{\normalfont\rmfamily\linespread{1.2}\fontsize{9}{11}\selectfont}
%\newcommand{\copyrightfont}{\normalfont\rmfamily\fontsize{8}{10}\selectfont}
%\newcommand{\ociscodefont}{\normalfont\rmfamily\fontsize{8}{10}\selectfont}

% Author and affiliation
\RequirePackage{authblk}
\setlength{\affilsep}{1em}
\renewcommand\Authfont{\normalfont\sffamily\bfseries\scshape\fontsize{12}{14}\selectfont}
\renewcommand\Affilfont{\normalfont\sffamily\itshape\fontsize{9}{10}\selectfont}


\usepackage{placeins}%%%%stop floating


\RequirePackage{xifthen}

% Graphics, tables and other formatting
\RequirePackage{graphicx}
%\RequirePackage{colortbl}
\RequirePackage{booktabs}
\RequirePackage{algorithm}
\RequirePackage[noend]{algpseudocode}
\RequirePackage{changepage}
\RequirePackage[left=2cm,%
                right=2cm,%
                top=2.5cm,%
                bottom=2.5cm,%
                headheight=15pt,%
                headsep=10pt,%
                a4paper,twoside]{geometry}%
\RequirePackage[labelfont={bf,sf},%
                labelsep=period,%
                figurename=Fig.,%
                singlelinecheck=off,%
                justification=RaggedRight]{caption}

\setlength{\columnsep}{24pt} % Distance between the two columns of text
\setlength{\parindent}{12pt} % Paragraph indent

%%%%%% Bibliography
\usepackage[
    backend=biber,
    style=numeric-comp,
    giveninits=true,
    maxcitenames=2, %for \textcite command to show el at.
    maxbibnames=99,
    url=false,
    doi=true,
    isbn=false,
    hyperref=true,
    backref=false,
   % doi=false,isbn=false,url=false,
    %bibstyle=numeric
   % citestyle=numeric-comp
    sorting=none
  ]{biblatex}
  
%\renewbibmacro*{in:}{}
%\DeclareFieldFormat*{volume}{\bibstring{volume} #1\space}
\DeclareFieldFormat*{volume}{\textbf{Vol.} #1\space}
%\AtEveryBibitem{\clearfield{number}}
\AtEveryBibitem{\clearfield{month}}

\DeclareFieldFormat{labelnumberwidth}{\mkbibbrackets{\mkbibbold{#1}}} %to format labelnumber
\DeclareFieldFormat{journaltitle}{\mkbibbold{#1}} %to format journal title
\DeclareFieldFormat{volume}{\mkbibitalic{\mkbibbold{#1}}} %to format volume
\DeclareFieldFormat[article]{title}{\mkbibitalic{``#1"}} %to format title
\DeclareFieldFormat[thesis]{title}{\mkbibitalic{``#1"}} %to format title
\DeclareFieldFormat[article]{year}{\mkbibparens{#1}} %to format year
\DeclareFieldFormat[article]{number}{\mkbibparens{#1}} %to format year
\DeclareFieldFormat{pages}{#1}
\DeclareFieldFormat[thesis]{type}{\mkbibparens{#1}} %to format year
%code for ordering fields
\DeclareBibliographyDriver{article}{%
  \usebibmacro{bibindex}%
  \usebibmacro{begentry}%
  \printnames{author}\addcomma\space%
    \printfield{year}\space%  
    \printfield{title}\space%
   % \usebibmacro{journal}%
   \printfield{journaltitle}
%   \usebibmacro{volume+number+eid}%
    \printfield{volume}%
    \iffieldundef{number}
    {\addcolon\space}
    {\printfield{number}\addcolon\space}%
    \iffieldundef{pages}
    {}
    {\printfield{pages}\adddot}%
   \newunit\newblock%
  \iftoggle{bbx:isbn}%
    {\printfield{issn}}%
    {}%
  \newunit\newblock%
  \addperiod%
  \usebibmacro{doi+eprint+url}%
  \usebibmacro{pageref}%
  \usebibmacro{finentry}}

% \makeatletter
\newcommand\fs@coloruled{\def\@fs@cfont{\bfseries}\let\@fs@capt\floatc@coloruled
 \def\@fs@pre{\kern2pt}%
\def\@fs@post{\kern2pt{\color{color2}\hrule}\relax}%
 \def\@fs@mid{\kern2pt{\color{color2}\hrule}\kern2pt}%
\let\@fs@iftopcapt\iftrue}
%\makeatother

\floatstyle{coloruled}
\restylefloat{algorithm}

% Headers and footers
\RequirePackage{fancyhdr}  % custom headers/footers
\pagestyle{fancy}  
\fancypagestyle{plain}{\pagestyle{fancy}}
%Headers
\fancyhead[LO,RO]{}
\fancyhead[LE,RE]{}
\fancyhead[C]{\footnotesize	\textit{Submission for JASE}}
% Footers
\lfoot{}%
\cfoot{\normalsize\thepage}%
\rfoot{}%
\renewcommand{\headrulewidth}{0pt}% % No header rule
\renewcommand{\footrulewidth}{0pt}% % No footer rule

% Section/subsection/paragraph set-up
\RequirePackage[explicit]{titlesec}
  \renewcommand\thesection{\@arabic\c@section}%
  \renewcommand\thesubsection{\@arabic\c@section.\@arabic\c@subsection}%
  \renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}%

\titleformat{\section}
  {\large\rmfamily\bfseries}
  {\thesection.}
  {0.5em}
  {\makefirstuc{#1}}
  []
\titleformat{name=\section,numberless}
  {\large\rmfamily\bfseries}
  {}
  {0em}
  {\makefirstuc{#1}}
  []
\titleformat{\subsection}
  {\rmfamily\bfseries}
  {\thesubsection.}
  {0.5em}
  {\makefirstuc{#1}}
  []
\titleformat{\subsubsection}
  {\rmfamily\small\bfseries\itshape}
  {\thesubsubsection.}
  {0.5em}
  {\makefirstuc{#1}}
  []
\titleformat{\paragraph}[runin]
  {\rmfamily\small\bfseries}
  {}
  {0em}
  {\makefirstuc{#1}}
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{2pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{2pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{12pt}


%%%Keywords formatting
\newcommand{\keywords}[1]{%
    \vskip8\p@%
    \noindent{\bfseries\fontsize{7\p@}{13\p@}Keywords:}
   \noindent{\raggedright\fontsize{8\p@}{13\p@}\selectfont #1\par}
  }%

%%%Abstract formatting
\def\xabstract{abstract}
\long\def\abstract#1\end#2{\def\two{#2}\ifx\two\xabstract
\long\gdef\theabstract{\ignorespaces#1}
\def\go{\end{abstract}}\else
\typeout{ }#1\end{#2}
\gdef\theabstract{ }\let\go\relax\fi
\go}

% Define a new environment with abstract content and styling
% (to enable switching between long and short articles)
\newcommand{\abscontent}{
\noindent
{%
\parbox{\dimexpr\linewidth}{%
	\absfont \theabstract
}%
}%
\vskip8pt%
\noindent
\hfil\rule{\linewidth}{0.4pt}
}

% Format abstract in reduced width box for certain layouts
\newcommand{\abscontentformatted}{
\begin{adjustwidth}{24pt}{24pt}
\rule{\linewidth}{.4pt}
\vskip6pt%
\abscontent
\end{adjustwidth}
}

% Custom title page
\renewcommand{\@maketitle}{%
{\vphantom{M}%
\vskip15pt%
{\centering \titlefont \@title\par}%
\vskip11pt
{\centering \@author\par}
\vskip11pt%
%\ifthenelse{\boolean{shortarticle}}
%{\ifthenelse{\boolean{singlecolumn}}{}{
% just a single line for short article
%\rule{\linewidth}{.4pt}
%\vskip1pt}}
%{% else display the abstract contents (in reduced width box)
%{%
%\abscontentformatted
%}%
\abscontentformatted
\vskip12pt%
}%
}%
%}%

%%subfigure
%\usepackage{subfig}
\usepackage{subcaption}

