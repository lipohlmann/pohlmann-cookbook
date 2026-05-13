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


% Main body font
\setmainfont[
  Path=./admin/fonts/source-serif-4/,
  UprightFont = *-Regular.otf,
  ItalicFont = *-It.otf,
  BoldFont = *-Bold.otf,
  BoldItalicFont = *-BoldIt.otf
]{SourceSerif4}
% Decorative/display font
\newfontfamily\fontseasons{EB Garamond}

% Light variant for decorative usage
\newfontfamily\fontseasonslight{Cormorant Garamond Light}

% Sans-serif font
\newfontfamily\fontpublicsans{Source Sans 3}

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
\makeatletter
\renewcommand{\l@section}[2]{%
  \thispagestyle{empty}
  \addpenalty{\@secpenalty}%
  \addvspace{0.5em}%
  \noindent
  \begin{center}
    \begin{tabular*}{0.7\textwidth}{@{\extracolsep{\fill}} l r}
      {\fontsize{14}{16}\selectfont\fontseasons #1} &
      {\fontsize{12}{14}\selectfont\fontpublicsans #2}
    \end{tabular*}
  \end{center}
}
\makeatother

% Command to produce the TOC with different margins, no page number on TOC page,
% then restore margins and reset page numbering
\newcommand{\customtableofcontents}{%
  \newgeometry{
    top=2cm,
    bottom=2cm,
    left=2cm,
    right=2cm
  }%
  \pagestyle{empty}% Apply empty style to ALL TOC pages
  \tableofcontents
  \clearpage
  \pagestyle{fancy}% Restore custom fancy style
  \pagenumbering{arabic}% Restart page numbering from 1
  \restoregeometry
}