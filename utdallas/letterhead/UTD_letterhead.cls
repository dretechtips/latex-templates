\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{utdStatLetter}[2017/11/27 v1.0 University of Texas Dallas Math Letter head]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
\ProcessOptions
\LoadClass[12pt]{letter}

% Include setspace package for changing the spacing
\RequirePackage{setspace}
\usepackage[dvipsnames]{xcolor}
\definecolor{flame}{rgb}{1,0.457,0.090}
\definecolor{eco}{rgb}{0,1,0.496}

% Use geometry package to set one inch margins; also set raggedbottom
\usepackage{geometry}
\geometry{
  body={6.0in, 9.0in},
  left=1.0in,
  top=1.0in,
  hmargin=2.2cm,
  vmargin=2.2cm
}\raggedbottom

% Set up fonts for use in header
\def\xviiptsc{\fontfamily{ptm}\fontsize{17}{10}\scshape}
\def\ixptit{\fontfamily{ptm}\fontsize{9}{11}\itshape}

% Set up functions that define personal and departmental information
\def\campus#1{\def\@campus{#1}}
\def\deptname#1{\def\@deptname{#1}}
\def\collegename#1{\def\@collegename{#1}}
\def\deptaddr#1{\def\@deptaddr{#1}}
\def\telephone#1{\def\@telephone{#1}}
\def\fax#1{\def\@fax{#1}}
\def\email#1{\def\@email{#1}}
\def\date#1{\def\@sentdate{#1}}
\def\to#1{\def\@to{#1}}

% Set up defaults for these functions
\campus{}
\deptname{\textcolor{white}{Department of Mathematical Sciences}}
%\collegename{School of Natural Sciences \& Mathematics}
\collegename{}
\deptaddr{\textbf{Department of Mathematical Sciences}\\
  800 W. Campbell Road\\Richardson, Texas, 75080}
\telephone{}
\fax{}
\email{}
\date{\@date}
\to{}

% Set up the department name text block
\def\@deptnametext{\ixptit{\bfseries\@deptname}\\[5pt]\@collegename}
\newlength{\@deptnamewidth}
\settowidth{\@deptnamewidth}{\ixptit\begin{tabular}{l}\ignorespaces\@deptnametext\end{tabular}}

% Set up the department address text block
\def\@deptaddrtext{%
  \ixptit%
  \@deptaddr%
  \vspace{3mm}%
  \ifx\@telephone\@empty\relax\else\\\@telephone\fi%
  \ifx\@fax\@empty\relax\else\\Fax: \@fax\fi%
  \ifx\@email\@empty\relax\else\\\@email\fi%
  }%
\newlength{\@deptaddrwidth}
\settowidth{\@deptaddrwidth}{\ixptit\begin{tabular}{l}\ignorespaces\@deptaddrtext\end{tabular}}

\def\@Uheader{%
  % \xviiptsc \textcolor{flame}{University of Texas at Dallas}\hfill\\%
  \xviiptsc \includegraphics[scale = .5, clip, trim = 1cm 1.5cm 0 0]{UTD_header}\hfill\\%
  \rule{\textwidth}{0.5mm}\\%
  \parbox[t]{4cm}{\ixptit\bfseries\@campus}%
  \hfill%
  \parbox[t]{\@deptnamewidth}{\@deptnametext}%
  \hspace{2mm}\vspace{-.5cm}%
  \parbox[t]{\@deptaddrwidth}{\begin{flushright}\@deptaddrtext\end{flushright}}%
  \vspace{-.5cm}
}

\def\opening#1{%
  \newpage%
  \setcounter{page}{1}%
  \thispagestyle{empty}%
  \begin{singlespace}%
  {\@Uheader\vspace{2\parskip}\par}
  {\raggedleft\@sentdate\par}%
  {\raggedright\@to\par}%
  \vspace{1.5\parskip}%
  \end{singlespace}%
  #1\par\nobreak}


\setstretch{1}