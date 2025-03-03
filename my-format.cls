
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{my-format}
[2024/07/13 v1.0.0 NLSE-primer]
\newcommand{\draftmarkstyle}{\scriptsize\sffamily}
\DeclareOption{draft}{%
  \PassOptionsToClass{\CurrentOption}{book}
  \AtEndOfClass{
    \AtBeginShipout{\AtBeginShipoutUpperLeft{%
      \draftmarkstyle
      \put(+0.125in,            -0.125in-\f@size pt  ){\rlap{DRAFT}}
      \put(-0.125in+\paperwidth,-0.125in-\f@size pt  ){\llap{DRAFT}}
      \put(+0.125in,            +0.125in-\paperheight){\rlap{DRAFT}}
      \put(-0.125in+\paperwidth,+0.125in-\paperheight){\llap{DRAFT}}
      \put(+0.5\paperwidth,+0.125in-\paperheight)%
        {\makebox[0in][c]{\today}}
}}}}
\newlength{\margin@v}
\newlength{\margin@xhi}\setlength{\margin@xhi}{0.5in}
\newlength{\margin@xho}\setlength{\margin@xho}{0.0in}
\DeclareOption{narrowmargins}   {\setlength{\margin@v}{0.75in}}
\DeclareOption{normalmargins}   {\setlength{\margin@v}{1.00in}}
\DeclareOption{widemargins}     {\setlength{\margin@v}{1.25in}}
\DeclareOption{extrawidemargins}{\setlength{\margin@v}{1.50in}}
\DeclareOption{equalmargins}%
  {\setlength{\margin@xho}{0.5\margin@xhi}
   \setlength{\margin@xhi}{0.5\margin@xhi}}
\AtEndOfClass{
  \setlength{\leftmargin}{\dimexpr\margin@v+\margin@xhi}
  \setlength{\rightmargin}{\dimexpr\margin@v+\margin@xho}
  \geometry{
    top      = \margin@v,
    bottom   = \margin@v,
    inner    = \leftmargin,
    outer    = \rightmargin,
    headsep  = \dimexpr 0.5\margin@v - \headheight,
    footskip = \dimexpr 0.5\margin@v,
    marginparwidth = \dimexpr \rightmargin - 0.25in,
    marginparsep   = 0.125in,
}}
\DeclareOption{doublespacing}{%
  \AtEndOfClass{\doublespacing}
}
\DeclareOption{onehalfspacing}{%
  \AtEndOfClass{\onehalfspacing}
}
\DeclareOption{singlespacing}{%
  \AtEndOfClass{\singlespacing}
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ExecuteOptions{letterpaper} % book
\ExecuteOptions{normalmargins,onehalfspacing,chapterhead} % ut-thesis
\ProcessOptions
\LoadClass{book}
\RequirePackage{picture}  % for draft mode
\RequirePackage{atbegshi} % for draft mode
\RequirePackage{geometry} % for margins etc.
\RequirePackage{setspace} % for line spacing
\renewcommand*{\author}  [1]{\gdef\@author{#1}}
\renewcommand*{\title}   [1]{\gdef\@title{#1}}
%\renewcommand*{\gradyear}   [1]{\gdef\@gradyear{#1}}

\author    {(author)}
\title     {(title)}

\newcommand{\@romanskip}[1]{\@roman{\if@twoside\numexpr#1-1\else#1\fi}}
\g@addto@macro\frontmatter{\pagenumbering{romanskip}\pagestyle{plain}}
\g@addto@macro\mainmatter {\pagenumbering{arabic}\pagestyle{headings}}

\renewcommand*{\maketitle}%
  {\thispagestyle{empty}
   \large
   \begin{center}
      \singlespacing
      \null
      \vfill
      \textsc{\@title}
      \vfill
      by
      \vfill
      {\@author}
      \vfill
      \vfill
      
      {\copyright} {\@author}, Vejle, Denmark 
   \end{center}
   {{\newpage}}  
  }

\newenvironment*{abstract}%
  {\thispagestyle{plain}
   \begin{center}
     \singlespacing
      {\@title}\\[2ex]
      {\@author}\\
      {\@gradyear}\\
      \section*{Abstract}
   \end{center}
   \begingroup
   \doublespacing}%
  {\newpage\par\endgroup}%\par\endgroup\cleardoublepage
\newenvironment*{dedication}%
  {\thispagestyle{plain}
   \null
   \vfill

   \vfill
   \vfill
   \newpage}
   {\newpage\par\endgroup}%\par\endgroup\cleardoublepage
\newenvironment*{acknowledgements}%
  {\thispagestyle{plain}
   \begin{center}
   \section*{Acknowledgments}
   \end{center}
   \begingroup}
  {\newpage\par\endgroup}
%\let\cleardoublepage=\clearpage
%\let\ocleardoublepage\cleardoublepage
%\def\cleardoublepage{{\newpage\pagestyle{plain}\ocleardoublepage}}
\newcommand{\headerstyle}[1]{\footnotesize\MakeUppercase{#1}}
\if@twoside
\renewcommand*{\ps@headings}%
  {\let\@mkboth\markboth
   \let\@oddfoot\@empty
   \let\@evenfoot\@empty
   \def\@oddhead{\headerstyle{\rightmark\hfil\thepage}}%
   \def\@evenhead{\headerstyle{\thepage\hfil\leftmark}}%
   \def\chaptermark##1{\markboth{%
     \if@mainmatter\headerstyle{\@chapapp\ \thechapter.\ ##1}\fi}{}}
   \def\sectionmark##1{\markright{%
     \if@mainmatter\headerstyle{\thesection.\ ##1}\fi}}}
\else
\renewcommand*{\ps@headings}%
  {\let\@mkboth\markboth
   \let\@oddfoot\@empty
   \let\@evenfoot\@empty
   \def\@oddhead{\headerstyle{\rightmark\hfil\thepage}}%
   \def\chaptermark##1{\markright{%
     \if@mainmatter\headerstyle{\@chapapp\ \thechapter.\ ##1}\fi}}}
\fi
\pagestyle{headings}
\setlength\abovecaptionskip{1ex}
\setlength\belowcaptionskip{1ex}
\endinput
%%
%% End of file
