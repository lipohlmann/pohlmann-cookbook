\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{recipe_book}[2026 A class for recipe books]

\LoadClass[a4paper,twoside,11pt]{article}

\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage{environ}
\RequirePackage{calc}
\RequirePackage{multicol}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage{fontspec}
\RequirePackage[most]{tcolorbox}
\RequirePackage{tikz}
\RequirePackage{titlesec}
\RequirePackage{tocloft}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}
\RequirePackage{trimclip}
\RequirePackage{tabularx}

\RequirePackage{nicefrac}
\RequirePackage[nowarnings]{xcookybooky}
\RequirePackage[hyphens]{url}

\newcommand{\labelTableOfContents}{Table of Contents}


% Main body font
\setmainfont[
  Path=./admin/fonts/source-serif-4/,
  UprightFont = *-Regular.otf,
  ItalicFont = *-It.otf,
  BoldFont = *-Bold.otf,
  BoldItalicFont = *-BoldIt.otf
]{SourceSerif4}

% Decorative/display font
\newfontfamily\fontseasons{TeX Gyre Pagella}

% Light variant for decorative usage
\newfontfamily\fontseasonslight{TeX Gyre Pagella}

% Sans-serif font
\newfontfamily\fontpublicsans[  Path=./admin/fonts/source-sans-3/,
  UprightFont = *-Regular.otf,
  ItalicFont = *-It.otf,
  BoldFont = *-Bold.otf,
  BoldItalicFont = *-BoldIt.otf
]{SourceSans3}

% Format sections to be bigger
\titleformat{\section}
{\centering\fontseasons\selectfont}
{}
{0pt}
{\fontsize{32}{38}\selectfont}

\titlespacing*{\section}
{0pt}
{1.5cm}
{0.8cm}

% Custom footer with centered page number
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\fontsize{10}{12}\selectfont\thepage}

% Create a section that appears in the Table of Contents, but not visibly in the document
\newcommand\invisiblesection[1]{%
  \refstepcounter{section}%
  \addcontentsline{toc}{section}{\protect\numberline{\thesection}#1}%
  \sectionmark{#1}}

% Customize Table of Contents title appearance
\AtBeginDocument{%
  \renewcommand{\contentsname}{%
    \begin{center}%
      {\fontseasons\fontsize{28}{32}\selectfont \labelTableOfContents}%
      \vspace{1.5cm}%
    \end{center}%
  }%
}


% Customize appearance of TOC section entries
\renewcommand{\cftsecfont}{\fontseasons\fontsize{14}{22}\selectfont}
\renewcommand{\cftsecpagefont}{\fontpublicsans\fontsize{12}{16}\selectfont}

\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}

\setlength{\cftbeforesecskip}{0.9em}

% Command to produce the TOC with different margins, no page number on TOC page,
% then restore margins and reset page numbering
\newcommand{\customtableofcontents}{%
  \newgeometry{
    top=1in,
    bottom=1in,
    left=1in,
    right=1in
  }%
  \pagestyle{empty}% Apply empty style to ALL TOC pages
  \tableofcontents
  % \clearpage
  \pagestyle{fancy}% Restore custom fancy style
  \pagenumbering{arabic}% Restart page numbering from 1
  \restoregeometry
}