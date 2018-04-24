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
\RequirePackage[acronym, nopostdot]{glossaries} % add glosaries
\RequirePackage{enumitem} % for better alignment
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{tabularx,booktabs} 
\RequirePackage{fancyhdr}
%\RequirePackage{ltxtable}
\RequirePackage{ltablex} % for pagebreak in tabularx
\RequirePackage{caption} % to tune subcaptions
\RequirePackage[most]{tcolorbox}
\RequirePackage{subfigure}
\RequirePackage{xspace} % space after command
\RequirePackage{nameref}
\RequirePackage{float}
\RequirePackage{wrapfig}
\RequirePackage{adjustbox}
\RequirePackage{lipsum}
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
%%%%%%%%%%%%%%%%%%%%%%%%   TABLES   %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% define new column types (see package array)
\newcolumntype{Z}{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}X} 
\newcolumntype{M}{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}X}
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
% table counter for table steps 
\newcounter{titem}[table]
\newenvironment{titem}[2][]{\refstepcounter{titem}\par\medskip
	\noindent \textit{
		\begin{flushleft}
			\begin{hyphenrules}{nohyphenation}
				\thetitem.~#1~#2\newline
			\end{hyphenrules}
		\end{flushleft}
	}}
	
\newenvironment{steps}{
		% begin def
		\setcounter{stepc}{0}
		\noindent\begin{tabularx}{\linewidth}{p{0.2\linewidth}C{0.75\linewidth}}
		\toprule
		\textbf{Действие/Описание} &\textbf{Интерфейс} \\
		\midrule
		\end{tabularx}
		\vspace{-15pt}
	}{		
	}
	

\newtcolorbox{mybox}[1][]{%	
%	sharp corners,colframe=white,opacityback=0, left=0mm, height from=6.5cm to 20cm, #1
	sharp corners, left=0mm, height from=6.5cm to 20cm, #1
}

\newtcolorbox{mysmallbox}[1][]{%	
%	sharp corners,colframe=white,opacityback=0, left=0mm, height from=1.5cm to 20cm, #1
	sharp corners, left=0mm, height from=1.5cm to 20cm, #1
}


\NewEnviron{ist}[2]{
	\refstepcounter{stepc}
	\noindent\begin{minipage}{\textwidth}
				\begin{mybox}
					\begin{wrapfigure}{r}{0.65\textwidth}
						\includegraphics[width=0.65\textwidth]{#1}
						\vspace{-40pt}
					\end{wrapfigure}
					\noindent \textit{
						\begin{hyphenrules}{nohyphenation}
							\begin{flushleft}\thestepc.~#2 \end{flushleft}
						\end{hyphenrules}
					} 			
					\noindent\BODY
				\end{mybox}
			\end{minipage}
			\noindent\rule{\textwidth}{0.1mm}
			}


\NewEnviron{istt}[2]{
	\refstepcounter{stepc}
	\noindent\begin{minipage}{\textwidth}
		\begin{mysmallbox}
			\begin{wrapfigure}{r}{0.65\textwidth}
				\vspace{0.33cm}
				#1
				\vspace{-40pt}
			\end{wrapfigure}
			\noindent \textit{
				\begin{hyphenrules}{nohyphenation}
					\begin{flushleft}\thestepc.~#2 \end{flushleft}
				\end{hyphenrules}
			} 			
			\noindent\BODY
		\end{mysmallbox}
	\end{minipage}
	\noindent\rule{\textwidth}{0.1mm}
}


\newcounter{stepc}	
		
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
%%%%%%%%%%%%%%%%%%%%%%%     MISC    %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\labelenumii{\theenumi.\arabic{enumii}.}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%   COMMANDS  %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\parsedate #1:20#2#3#4#5#6#7#8\empty{#6#7/#4#5/20#2#3}
\def\moddate#1{\expandafter\parsedate\pdffilemoddate{#1}\empty}

\newcommand{\kmeans}{k-средних\xspace}

\newcommand{\Ward}{\mbox{Ward}\xspace}
\newcommand{\AWard}{\mbox{A-Ward}\xspace}
\newcommand{\AWardpb}{\mbox{A-Ward$ _{p\beta} $}\xspace}
\newcommand{\BiKMR}{\mbox{Bi K-Means R}\xspace}
\newcommand{\dePDDP}{dePDDP\xspace}
\newcommand{\IKmeans}{\mbox{IK-Means}\xspace}
\newcommand{\Ctrl}{\texttt{Ctrl}}

\newcommand{\SysName}{INDACT\xspace}
\newcommand{\Python}{Python\xspace}
\newcommand{\BinCatalog}{\texttt{\SysName}\xspace}
\newcommand{\ExeFile}{\texttt{\SysName.exe}\xspace}
\newcommand{\DataCatalog}{\texttt{data}\xspace}
\newcommand{\SettingsFile}{\texttt{settings.ini}\xspace}
\newcommand{\SampleFile}{\texttt{smartphones.dat}\xspace}
\newcommand{\SampleFileFull}{\texttt{\SysName/data/smartphones.dat}\xspace}
\newcommand{\fullref}[1]{\ref{#1} \nameref{#1}}


\newcommand{\menu}[1]{\menubox{\texttt{#1}}}
\newcommand{\button}[1]{\menubox{\texttt{#1}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%   TIKZ  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usetikzlibrary{calc}


\makeatletter
\newcommand{\gettikzxy}[3]{%
	\tikz@scan@one@point\pgfutil@firstofone#1\relax
	\edef#2{\the\pgf@x}%
	\edef#3{\the\pgf@y}%
}
\makeatother

\def\regnoter[#1](#2)(#3:#4:#5){%
	% Synopsis
	% \regnoter[draw options](left buttom)(text:end x:end y)
	\gettikzxy{(#2)}{\ax}{\ay}
	\draw[#1] (\ax, \ay) rectangle  node[pos=.5] {\textbf{#3}} ++(0.8,0.8);
	\draw[#1] (\ax+8mm  , \ay+4mm) -- (\ax+12mm,\ay+4mm) -- (#4,#5);
}


\def\regnoteb[#1](#2)(#3:#4:#5){%
	\gettikzxy{(#2)}{\ax}{\ay}
	\draw[#1] (\ax, \ay) rectangle  node[pos=.5] {\textbf{#3}} ++(0.8,0.8);
	\draw[#1] (\ax+4mm  , \ay) -- (\ax+4mm,\ay-4mm) -- (#4,#5);
}

\def\regnotel[#1](#2)(#3:#4:#5){%
	\gettikzxy{(#2)}{\ax}{\ay}
	\draw[#1] (\ax, \ay) rectangle  node[pos=.5] {\textbf{#3}} ++(0.8,0.8);
	\draw[#1] (\ax , \ay+4mm) -- (\ax-4mm,\ay+4mm) -- (#4,#5);
}

\def\regnote[#1](#2)(#3){%
	\gettikzxy{(#2)}{\ax}{\ay}
	\filldraw[fill=white, draw=black, #1] (\ax, \ay) rectangle  node[pos=.5] {\textbf{#3}} ++(0.8,0.8);
}

\def\regnotermulti[#1](#2)(#3:#4:#5:#6:#7:#8:#9){%
	\gettikzxy{(#2)}{\ax}{\ay}
	\draw[#1] (\ax, \ay) rectangle  node[pos=.5] {\textbf{#3}} ++(0.8,0.8);
	\draw[#1] (\ax+8mm  , \ay+4mm) -- (\ax+12mm,\ay+4mm) -- (#4,#5);
	\draw[#1] (\ax+8mm  , \ay+4mm) -- (\ax+12mm,\ay+4mm) -- (#6,#7);
	\draw[#1] (\ax+8mm  , \ay+4mm) -- (\ax+12mm,\ay+4mm) -- (#8,#9);
}

\def\regnotelmulti[#1](#2)(#3:#4:#5:#6:#7:#8:#9){%
	\gettikzxy{(#2)}{\ax}{\ay}
	\filldraw[fill=white, draw=black, #1] (\ax, \ay) rectangle  node[pos=.5] {\textbf{#3}} ++(0.8,0.8);
	\draw[#1] (\ax , \ay+4mm) -- (\ax-4mm,\ay+4mm) -- (#4,#5);
	\draw[#1] (\ax , \ay+4mm) -- (\ax-4mm,\ay+4mm) -- (#6,#7);
	\draw[#1] (\ax , \ay+4mm) -- (\ax-4mm,\ay+4mm) -- (#8,#9);
}


\makeatletter
\def\grd@save@target#1{%
	\def\grd@target{#1}}
\def\grd@save@start#1{%
	\def\grd@start{#1}}
\tikzset{
	grid with coordinates/.style={
		to path={%
			\pgfextra{%
				\edef\grd@@target{(\tikztotarget)}%
				\tikz@scan@one@point\grd@save@target\grd@@target\relax
				\edef\grd@@start{(\tikztostart)}%
				\tikz@scan@one@point\grd@save@start\grd@@start\relax
				\draw[minor help lines] (\tikztostart) grid (\tikztotarget);
				\draw[major help lines] (\tikztostart) grid (\tikztotarget);
				\grd@start
				\pgfmathsetmacro{\grd@xa}{\the\pgf@x/1cm}
				\pgfmathsetmacro{\grd@ya}{\the\pgf@y/1cm}
				\grd@target
				\pgfmathsetmacro{\grd@xb}{\the\pgf@x/1cm}
				\pgfmathsetmacro{\grd@yb}{\the\pgf@y/1cm}
				\pgfmathsetmacro{\grd@xc}{\grd@xa + \pgfkeysvalueof{/tikz/grid with coordinates/major step}}
				\pgfmathsetmacro{\grd@yc}{\grd@ya + \pgfkeysvalueof{/tikz/grid with coordinates/major step}}
				\foreach \x in {\grd@xa,\grd@xc,...,\grd@xb}
				\node[anchor=north] at (\x,\grd@ya) {\pgfmathprintnumber{\x}};
				\foreach \y in {\grd@ya,\grd@yc,...,\grd@yb}
				\node[anchor=east] at (\grd@xa,\y) {\pgfmathprintnumber{\y}};
			}
		}
	},
	minor help lines/.style={
		help lines,
		step=\pgfkeysvalueof{/tikz/grid with coordinates/minor step}
	},
	major help lines/.style={
		help lines,
		line width=\pgfkeysvalueof{/tikz/grid with coordinates/major line width},
		step=\pgfkeysvalueof{/tikz/grid with coordinates/major step}
	},
	grid with coordinates/.cd,
	minor step/.initial=.2,
	major step/.initial=1,
	major line width/.initial=2pt,
}
\makeatother