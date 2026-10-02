% ---------------------------------------------------------------------------
% neudata.cls — Neudata Consulting Ltd document class
% Reports, proposals and technical notes in the Neudata house style.
% Built on article; compiles with pdfLaTeX (Overleaf default) or XeLaTeX.
%
% \documentclass[options]{neudata}
%   report | proposal | note   document type label on the cover (default: report)
%   draft                      adds a DRAFT watermark
%   nocover                    starts with a simple title block instead of a cover page
% ---------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{neudata}[2026/10/02 Neudata Consulting Ltd document class]

\newcommand{\neudata@doctype}{Report}
\newif\ifneudata@draft
\newif\ifneudata@cover \neudata@covertrue
\DeclareOption{report}{\renewcommand{\neudata@doctype}{Report}}
\DeclareOption{proposal}{\renewcommand{\neudata@doctype}{Proposal}}
\DeclareOption{note}{\renewcommand{\neudata@doctype}{Technical note}}
\DeclareOption{draft}{\neudata@drafttrue}
\DeclareOption{nocover}{\neudata@coverfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[11pt, a4paper]{article}

% ----- Packages ---------------------------------------------------------------
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{tgheros}                   % body: Helvetica-like sans
\RequirePackage{tgadventor}                % headings: Century Gothic-like
\renewcommand{\familydefault}{\sfdefault}
\RequirePackage{microtype}
\RequirePackage[a4paper, top=2.8cm, bottom=2.6cm, left=2.3cm, right=2.3cm,
                headheight=1.2cm, headsep=0.6cm, footskip=1.1cm]{geometry}
\RequirePackage[table]{xcolor}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{lastpage}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{enumitem}
\RequirePackage[most]{tcolorbox}
\RequirePackage[font={small}, labelfont={bf, color=NeudataTeal}]{caption}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{etoolbox}

% ----- Colours ----------------------------------------------------------------
\definecolor{NeudataTeal}{HTML}{0D7377}
\definecolor{NeudataDeepTeal}{HTML}{055F56}
\definecolor{NeudataBlue}{HTML}{0070C0}
\definecolor{NeudataNavy}{HTML}{04242F}
\definecolor{NeudataLogoBlue}{HTML}{0B376C}
\definecolor{NeudataMist}{HTML}{EAF2F5}
\definecolor{NeudataGrey}{HTML}{8A99A3}
\definecolor{NeudataInk}{HTML}{1F2D33}
\color{NeudataInk}
\hypersetup{colorlinks=true, linkcolor=NeudataTeal, urlcolor=NeudataBlue, citecolor=NeudataTeal}

\newcommand{\neudata@headfont}{\fontfamily{qag}\selectfont}

% ----- Metadata ------------------------------------------------------------------
\newcommand{\neudata@subtitle}{}
\newcommand{\neudata@client}{}
\newcommand{\neudata@reference}{}
\newcommand{\neudata@confidentiality}{}
\newcommand{\neudata@version}{}
\newcommand{\neudata@logo}{figures/neudata-logo.png}
\newcommand{\subtitle}[1]{\renewcommand{\neudata@subtitle}{#1}}
\newcommand{\client}[1]{\renewcommand{\neudata@client}{#1}}
\newcommand{\reference}[1]{\renewcommand{\neudata@reference}{#1}}
\newcommand{\confidentiality}[1]{\renewcommand{\neudata@confidentiality}{#1}}
\newcommand{\version}[1]{\renewcommand{\neudata@version}{#1}}
\newcommand{\logo}[1]{\renewcommand{\neudata@logo}{#1}}
\newcommand{\neudatatoday}{\two@digits{\day}-\two@digits{\month}-\the\year}
\date{\neudatatoday}

% ----- Headings: teal with a thin rule; blue sub-sections -------------------------
\setcounter{secnumdepth}{3}
\titleformat{\section}
  {\neudata@headfont\Large\bfseries\color{NeudataTeal}}
  {\thesection}{0.6em}{}[{\color{NeudataTeal}\titlerule[0.6pt]}]
\titleformat{\subsection}
  {\neudata@headfont\large\bfseries\color{NeudataBlue}}{\thesubsection}{0.6em}{}
\titleformat{\subsubsection}
  {\neudata@headfont\normalsize\bfseries\color{NeudataTeal}}{\thesubsubsection}{0.6em}{}
\titlespacing*{\section}{0pt}{2.2ex plus .5ex minus .2ex}{1.4ex}
\titlespacing*{\subsection}{0pt}{1.8ex plus .4ex minus .2ex}{0.8ex}

\setlist[itemize,1]{label={\color{NeudataTeal}\textbullet}, leftmargin=1.4em}
\setlist[itemize,2]{label={\color{NeudataBlue}\textendash}}
\setlist[enumerate,1]{label={\color{NeudataTeal}\bfseries\arabic*.}}
\setlength{\parskip}{0.5em}
\setlength{\parindent}{0pt}

% ----- Header and footer -------------------------------------------------------
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrule}{{\color{NeudataTeal}\hrule height 0.6pt}}
\fancyhead[L]{\small\color{NeudataTeal}\neudata@headfont\@title}
\fancyhead[R]{\includegraphics[height=0.85cm]{\neudata@logo}}
\fancyfoot[C]{\scriptsize\color{NeudataTeal}Neudata \,|\, \#ClearDataClearImpact}
\fancyfoot[R]{\scriptsize\color{NeudataGrey}\thepage\ / \pageref*{LastPage}}
\fancyfoot[L]{\scriptsize\color{NeudataGrey}\neudata@confidentiality}
\fancypagestyle{plain}{\fancyhf{}\renewcommand{\headrule}{}%
  \fancyfoot[C]{\scriptsize\color{NeudataTeal}Neudata \,|\, \#ClearDataClearImpact}}

% ----- Cover page --------------------------------------------------------------------
\renewcommand{\maketitle}{%
  \ifneudata@cover
  \begin{titlepage}
    \begin{tikzpicture}[remember picture, overlay]
      \node[anchor=north west, inner sep=0] at ([xshift=2.3cm, yshift=-2.2cm]current page.north west)
        {\includegraphics[height=3.2cm]{\neudata@logo}};
      \node[anchor=north east, inner sep=0, text=NeudataGrey, font=\small\neudata@headfont]
        at ([xshift=-2.3cm, yshift=-2.6cm]current page.north east)
        {\MakeUppercase{\neudata@doctype}};
      \draw[NeudataTeal, line width=0.8pt]
        ([xshift=2.3cm, yshift=-7.2cm]current page.north west) -- ([xshift=-2.3cm, yshift=-7.2cm]current page.north east);
      \node[anchor=north west, text width=\textwidth, align=left, inner sep=0]
        at ([xshift=2.3cm, yshift=-8.2cm]current page.north west) {%
          {\neudata@headfont\fontsize{30}{36}\selectfont\bfseries\color{NeudataTeal}\@title\par}
          \ifx\neudata@subtitle\@empty\else\vspace{0.8em}{\neudata@headfont\Large\color{NeudataNavy}\neudata@subtitle\par}\fi
          \ifx\neudata@client\@empty\else\vspace{2.2em}{\large Prepared for: \textbf{\neudata@client}\par}\fi};
      \node[anchor=south west, text width=\textwidth, align=left, inner sep=0]
        at ([xshift=2.3cm, yshift=3.4cm]current page.south west) {%
          {\large\bfseries \@author\par}\vspace{0.4em}
          {\normalsize Date: \textbf{\@date}\par}
          \ifx\neudata@reference\@empty\else{\normalsize Reference: \neudata@reference\par}\fi
          \ifx\neudata@version\@empty\else{\normalsize Version: \neudata@version\par}\fi
          \ifx\neudata@confidentiality\@empty\else\vspace{0.8em}{\bfseries\color{NeudataBlue}\MakeUppercase{\neudata@confidentiality}\par}\fi};
      \node[anchor=south, inner sep=0, text=NeudataTeal, font=\small]
        at ([yshift=1.6cm]current page.south)
        {Neudata Consulting Ltd \,|\, \href{https://www.neu-data.com}{www.neu-data.com} \,|\, contact@neu-data.com};
      \node[anchor=south, inner sep=0, text=NeudataGrey, font=\footnotesize\itshape]
        at ([yshift=1.1cm]current page.south) {Insight. Impact. Innovation.};
    \end{tikzpicture}
  \end{titlepage}
  \setcounter{page}{1}%
  \else
  \begin{center}
    \includegraphics[height=2cm]{\neudata@logo}\par\vspace{1em}
    {\neudata@headfont\LARGE\bfseries\color{NeudataTeal}\@title\par}
    \ifx\neudata@subtitle\@empty\else\vspace{0.4em}{\large\color{NeudataNavy}\neudata@subtitle\par}\fi
    \vspace{0.8em}{\@author\ \,|\, \@date\par}
  \end{center}\vspace{1em}
  \fi}

% ----- Draft watermark ----------------------------------------------------------------
\ifneudata@draft
  \AddToHook{shipout/background}{%
    \put(0,0){\begin{tikzpicture}[remember picture, overlay]
      \node[rotate=45, text=NeudataGrey!25, font=\fontsize{90}{90}\selectfont\bfseries]
        at (current page.center) {DRAFT};
    \end{tikzpicture}}}
\fi

% ----- Boxes ---------------------------------------------------------------------------
% \begin{keyfindings} ... \end{keyfindings}
\newtcolorbox{keyfindings}[1][Key findings]{%
  enhanced, breakable, colback=NeudataMist, colframe=NeudataTeal,
  boxrule=0pt, leftrule=4pt, arc=0pt, outer arc=0pt,
  left=10pt, right=10pt, top=6pt, bottom=6pt,
  fonttitle=\neudata@headfont\bfseries\color{NeudataTeal}, coltitle=NeudataTeal,
  colbacktitle=NeudataMist, title=#1, titlerule=0pt}
% \begin{neudatanote}[Title] ... \end{neudatanote}
\newtcolorbox{neudatanote}[1][Note]{%
  enhanced, breakable, colback=white, colframe=NeudataBlue, boxrule=0.6pt, arc=2pt,
  fonttitle=\bfseries, coltitle=white, colbacktitle=NeudataBlue, title=#1}

% ----- Tables: navy header row ----------------------------------------------------------
% Header row:  \neudataheader \neudatath{Group} & \neudatath{n} & \neudatath{\%} \\
\newcommand{\neudataheader}{\rowcolor{NeudataNavy}}
\newcommand{\neudatath}[1]{\textcolor{white}{\textbf{#1}}}

% ----- Closing copyright page ------------------------------------------------------------
\newcommand{\neudatacopyrightpage}{%
  \clearpage\thispagestyle{plain}
  \vspace*{\fill}
  \begin{center}\includegraphics[height=3cm]{\neudata@logo}\end{center}
  \vspace{1.5em}
  {\large\bfseries\color{NeudataBlue}Copyright \textcopyright\ Neudata, \the\year\par}\medskip
  {\ttfamily\small
  All property rights and copyright are reserved.\par\smallskip
  This document contains proprietary data, information, and materials developed by Neudata for
  dedicated use only and may not be communicated, copied, reproduced, distributed, published, or
  cited, in whole or in part, without the prior written consent of Neudata. Where explicit written
  permission has been granted, appropriate attribution must be included, followed by ``by courtesy
  of Neudata''.\par\smallskip
  Any unauthorized use or infringement of these materials may give rise to legal action and claims
  for damages, without prejudice to any other rights of Neudata, including rights relating to
  patents, trademarks, or other forms of intellectual property protection.\par}
  \vspace*{\fill}}

\endinput
