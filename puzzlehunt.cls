% Class for puzzlehunt booklets
% See http://en.wikibooks.org/wiki/LaTeX/Creating_Packages
% and the version used with https://github.com/MaPPmath/hsc16
% Use with:
%     \documentclass{puzzlehunt}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{puzzlehunt}[2016/07/05 PUZZLEHUNT]

% No fancy options, please
\DeclareOption*{
  \ClassWarning{puzzlehunt}{No class options allowed.}
}

% Process given options
\ProcessOptions\relax

% Load base
\LoadClass[11pt,openany,oneside,letterpaper]{book}

% Page formatting
\RequirePackage[margin=0.8in]{geometry}

% Space out paragraphs
\setlength{\parskip}{6pt plus1pt minus1pt}




% Graphics
\RequirePackage{graphicx} % to display images

% Logicpuzzle package
\RequirePackage{logicpuzzle}
\let\titleformat\undefined % to avoid namespace collision with titlesec

% Datetime formatting
\RequirePackage[yyyymmdd,hhmmss]{datetime}

% Fonts
\usepackage{cmbright}
\usepackage[T1]{fontenc}


% Custom Title Page

\newcommand{\phBannerLogo}{example-image-16x10.pdf}% uses mwe image
\newcommand{\phSetBannerLogo}[1]{\renewcommand{\phBannerLogo}{#1}}

\newcommand{\phTitlePage}{%
\begin{titlepage}
  \begin{center}
	\includegraphics[width=0.6\textwidth]{\phBannerLogo}\par\vspace{1cm}
	{\Huge\textbf{\@title} \par}
	\vspace{2em}
	{\LARGE\textit{\@author} \par}
	\vfill
	{\large Version \@date \par}
  \end{center}
\end{titlepage}
}

\newcommand{\phTableOfContents}{\tableofcontents}


% Custom Chapter/Section Headings
\RequirePackage[explicit]{titlesec}
\RequirePackage{fancyhdr}

\pagestyle{plain}

\newcommand{\phSquareLogo}{example-image-1x1.pdf}% uses mwe image
\newcommand{\phSetSquareLogo}[1]{\renewcommand{\phSquareLogo}{#1}}

\titleformat{\chapter}[display]{}{}{0pt}
{
  \Large\bfseries
  \includegraphics[height=1.2in]{\phSquareLogo}
  \begin{tabular}[b]{l}
    {\Large \@title \vspace{0.1in}} \\
    {\Huge \bfseries #1 \vspace{0.25in}}
  \end{tabular}
  \vspace{1em}
}
\titlespacing{\chapter}{0pt}{0pt}{0pt}


\newcommand{\phSetSectionFancyStyle}[1]{
  \titleformat{\section}[display]{}{}{0pt}
  {
    \Large\bfseries
    \includegraphics[height=1.2in]{\phSquareLogo}
    \begin{tabular}[b]{l}
      {\Large \@title \vspace{0.1in}} \\
      {\Huge \bfseries \phChapterName \vspace{0.1in}} \\
      {\LARGE \bfseries #1 \vspace{0.05in}}
    \end{tabular}
    \vspace{1em}
  }
  \titlespacing{\section}{0pt}{0pt}{0pt}
}

\newcommand{\phSetSectionSimpleStyle}[1]{
  \titleformat{\section}[hang]{\normalfont\Large\bfseries}{}{0pt}{#1}
  \titlespacing*{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
}

\phSetSectionSimpleStyle{}

\newcommand{\phChapterName}{\@title}
\newcommand{\phSetChapterName}[1]{\renewcommand{\phChapterName}{#1}}

\newcommand{\phPart}[1]{\part{#1}}
\newcommand{\phChapter}[1]{\chapter{#1}\phSetChapterName{#1}}
\newcommand{\phSection}[1]{\phSetSectionSimpleStyle{#1}\section{#1}}
\newcommand{\phWorksheet}[1]{\newpage\phSetSectionFancyStyle{#1}\section{#1}}



% Lorem ipsum generator (useful for mockups)
\RequirePackage{lipsum}

% Hyperlinks
\RequirePackage[hidelinks]{hyperref}


% that's all folks
\endinput
