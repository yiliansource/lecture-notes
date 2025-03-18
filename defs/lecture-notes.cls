\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecture-notes}[Custom template for lecture notes.]


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessOptions\relax
\LoadClass[oneside]{scrbook}

\RequirePackage[ngerman]{babel}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{
  amsmath, amsthm, amssymb, mathtools, dsfont, units,       
  graphicx, wrapfig, subfig, float,                         
  listings, color, inconsolata, pythonhighlight,            
  hyperref, enumerate, enumitem, framed
}
\RequirePackage{hyperref} 
\RequirePackage{newpxtext, newpxmath, inconsolata}
\RequirePackage[left=1.35in, right=1.35in, top=1.0in, bottom=1.2in]{geometry}
\RequirePackage[bottom]{footmisc}
% \RequirePackage{anyfontsize}
\RequirePackage{scrhack}


\KOMAoptions{headings=big}


\renewcommand{\baselinestretch}{1.2}
\setlength{\parskip}{1.5mm}
\setlength{\headsep}{10mm}
\allowdisplaybreaks

\RequirePackage[font={it,footnotesize}]{caption}
\hypersetup{colorlinks=true, linkcolor=RoyalBlue, citecolor=RedOrange, urlcolor=ForestGreen}
\setlist[itemize]{wide=0pt, leftmargin=16pt, labelwidth=10pt, align=left}


\RedeclareSectionCommand[style=section]{chapter}
\setkomafont{chapter}{\normalfont\bfseries\LARGE}


\RequirePackage[subfigure]{tocloft}
\setlength{\cftbeforesecskip}{.9ex}
\cftsetindents{section}{0em}{0em}
\renewcommand{\cfttoctitlefont}{\large\bfseries}

\makeatletter
\renewcommand{\cftsecpresnum}{\begin{lrbox}{\@tempboxa}}
\renewcommand{\cftsecaftersnum}{\end{lrbox}}
\makeatother

\graphicspath{{Images/}{../Images/}}



\newcommand\numberthis{\addtocounter{equation}{1}\tag{\theequation}}
\let\b\mathbf
\let\bg\boldsymbol
\let\mc\mathcal

\RequirePackage[mathscr]{euscript}


\theoremstyle{plain}
\newtheorem{theorem}{Satz}[chapter]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{corollary}[theorem]{Korollar}


\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{example}[theorem]{Beispiel}

\theoremstyle{remark}
\newtheorem{remark}[theorem]{Bemerkung}


% \pagestyle{fancy}
% \renewcommand{\footrulewidth}{0pt}
% \renewcommand{\headrulewidth}{0pt}

% \renewcommand{\sectionmark}[1]{\markright{#1} }
% \fancyhead[R]{\small\textit{\nouppercase{\rightmark}}}

% \fancyhead[L]{\hyperref[sec:contents]{\small}}

\makeatletter
\newcommand{\lecturer}[1]{\gdef\@lecturer{#1}}

\renewcommand{\maketitle}{
    \thispagestyle{plain}
    \begin{center}
        {\huge\bfseries\@title\par}
        \vspace{0.2em}
        {\Large\@lecturer\par}
        \vspace{1em}
        {\large\@author\par}
        \vspace{0.2em}        
        \today
    \end{center}
}
\makeatother