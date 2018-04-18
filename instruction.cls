\NeedsTeXFormat{LaTeX2e}[1998/12/01]
\ProvidesClass{instruction}[2018/04/18 Eremeykin instruction for INDACT]
\ClassWarningNoLine{diploma}{This class requires MikTeX 1.2c--2.4}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions
\LoadClass[a4paper]{article} % default class
\RequirePackage[utf8]{inputenc} % use UTF-8
\RequirePackage[T2A,OT1]{fontenc} % rus fonts
\RequirePackage[russian]{babel} % russian language
\RequirePackage{indentfirst} % paragraph indent
\RequirePackage{bashful} % for version specification
\RequirePackage[most]{tcolorbox}
\RequirePackage[acronym]{glossaries} % add glosaries
\RequirePackage{enumitem} % for better alignment
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{tabularx,booktabs} 
\RequirePackage{fancyhdr}
\RequirePackage{ltablex} % for pagebreak in tabularx
\RequirePackage{caption} % to tune subcaptions
\RequirePackage[most]{tcolorbox}
\RequirePackage{subfigure}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%   LAYOUT   %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\sloppy
\setlength{\parindent}{1cm}  % set paragraph indent
%\setstretch{1.5} % line interval
\newcommand{\sectionbreak}{\clearpage} % set start each section on a new page
%\settextfraction{0.88} % set fraction of text
% set margins
\setlength\oddsidemargin{-0in}
\setlength\evensidemargin{-0in}
\setlength\textwidth{165mm}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%   TITLES   %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% set titles of sections
\usepackage{titlesec}
\titleformat{\section}{\normalfont\fontsize{16}{0}\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}{\normalfont\fontsize{14}{0}\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\bf\fontsize{14}{0}}{\thesubsubsection}{1em}{}

% set titles spacing
\titlespacing*{\section}{0pt}{5ex}{3ex} % left before after
\titlespacing*{\subsection}{0pt}{3ex}{1ex}
\titlespacing*{\subsubsection}{0pt}{3ex}{1ex}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%   GLOSSARIES   %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\glsnamefont}[1]{\textbf{#1}}
\makeglossaries

\loadglsentries{glossarie.tex}

\newglossarystyle{acrostyle}{%
	\glossarystyle{long}%
	\renewenvironment{theglossary}%
	{\begin{longtable}{p{2cm}p{10cm}}}%
		{\end{longtable}}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%   CAPTIONS   %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% figures captions style
\DeclareCaptionLabelFormat{gostfigure}{Рисунок #2}
\DeclareCaptionLabelFormat{slide}{Слайд №#2}
\DeclareCaptionLabelFormat{gosttable}{Таблица #2}
\DeclareCaptionLabelSeparator{gost}{~---~}
% set new styles
\captionsetup{labelsep=gost}
\captionsetup[figure]{labelformat=gostfigure}
\captionsetup[table]{labelformat=gosttable}
\captionsetup{figurewithin=none, tablewithin=none}
\renewcommand{\thesubfigure}{\asbuk{subfigure}}
% set tables and pictures captions align
\captionsetup[table]{justification=raggedleft} 
\captionsetup[figure]{justification=centering,labelsep=endash} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%   BIBLIOGRAPHY   %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% set bibliography style
\bibliographystyle{utf8gost705u} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%   LINKS  %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% web links style
\usepackage{hyperref}
\hypersetup{
	colorlinks=true,
	linkcolor=blue,
	urlcolor=blue,
}

\urlstyle{same}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%   PAGE HEADERS  %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% setup page fancy headers, (see fancyhdr package)
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\rightmark}
\fancyhead[R]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%   COLOR BOXES  %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\definecolor{myblue}{rgb}{0.000, 1.000, 1.000}
\definecolor{dodgerblue}{rgb}{0.117,0.564,1.000}

% colorbox for algorithm
\newtcolorbox[auto counter]{guide}[1][]{enhanced jigsaw,inherit height,
	colback=red!5,opacityback=0.9,colframe=red,title=Алгоритм \#\thetcbcounter,
	grow to left by=4mm,grow to right by=4mm,
	arc is angular,arc=0mm,
	fonttitle=\bfseries\large,
}

% colorbox for menu
\newtcbox{\menubox}{enhanced,nobeforeafter,tcbox raise base,boxrule=0.4pt,top=0mm,bottom=0mm,
	right=1mm,left=1mm,arc=2pt,boxsep=2pt,before upper={\vphantom{dlg}},
	colframe=blue!50!black,coltext=black,colback=myblue,
}
\robustify{\menubox}

% color box for file
\newtcbox{\filebox}{enhanced,nobeforeafter,tcbox raise base,boxrule=0.4pt,top=0mm,bottom=0mm,
	right=0mm,left=4mm,arc=1pt,boxsep=2pt,before upper={\vphantom{dlg}},
	colframe=green!50!black,coltext=green!25!black,colback=myblue,
	overlay={\begin{tcbclipinterior}\fill[dodgerblue] (frame.south west)
			rectangle node[text=white,font=\sffamily\bfseries\tiny,rotate=90] {FILE} ([xshift=4mm]frame.north west);\end{tcbclipinterior}}}
\robustify{\filebox}

% colorbox for directory
\newtcbox{\dirbox}{enhanced,nobeforeafter,tcbox raise base,boxrule=0.4pt,top=0mm,bottom=0mm,
	right=0mm,left=4mm,arc=1pt,boxsep=2pt,before upper={\vphantom{dlg}},
	colframe=green!50!black,coltext=green!25!black,colback=myblue,
	overlay={\begin{tcbclipinterior}\fill[dodgerblue] (frame.south west)
			rectangle node[text=white,font=\sffamily\bfseries\tiny,rotate=90] {DIR} ([xshift=4mm]frame.north west);\end{tcbclipinterior}}}

\robustify{\dirbox}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%   COMMANDS  %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\parsedate #1:20#2#3#4#5#6#7#8\empty{#6#7/#4#5/20#2#3}
\def\moddate#1{\expandafter\parsedate\pdffilemoddate{#1}\empty}