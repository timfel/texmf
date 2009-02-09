%%
% $Id: film.cls,v 1.7 2006/04/11 22:55:10 hudson Exp $
%
% Copyright T.J. Porter 2001 <techman@d2.net.au>, released under the terms of the GPL copyright
% Modifications:
%  (c) 2006 Trammell Hudson <hudson@osresearch.net>
%  (c) 2003 Väinö Järvelä <vaino.jarvela@pp.inet.fi>
%
% please obtain a copy if you do not have one http://www.fsf.org/copyleft/gpl.html
%
% abbreviations used in scripts are as follows:
% INT. - interior	EXT. - exterior
%(O.S) - off screen	b.g. - background	PAN - camera movement
%(V.O) - voice over	C.U. - close-up		INSERT - cut to close-up of
% each page should be 1 minute of film
% Spec scripts should not be more than 120 pages or less than 110.
% Nothing goes in a script that you cannot see or hear.
%
% Trammell Hudson <hudson@osresearch.net>, 2006:
% - No sign of Väinö's transition command.  I added my own.
%
% Väinö Järvelä <vaino.jarvela@pp.inet.fi>, 2003:
% - Added newpage to scene.
% - New command: transition.
% - Join speaker & speech and wrap in a box so won't overlap pages.
% - Changed tp's notes according to changes.

% tp's notes
% USAGE :-
% \act{int}
% \scene{int} {saloon} {night}
% \newactor{Name} -- use \ACTORNAME
% \speech {MATT DILLON} {I'm going to have to arrest you, Miss Kitty}
% \dialog{JOHN}{JANE}{ (John says) & \\ (Jane says) & \\ (John again) & \\ ...}
% \action{Miss Kitty draws a concealed Derringer, fires it at Matt!}
% \transition{CUT TO}
% \scene{int} {hospital} {night}
%
%% This is file `film.cls',

\LoadClass{scrartcl}
\usepackage{tabularx, graphicx}
\usepackage{ifthen, comicsans}
%\usepackage{fullpage}
%\raggedbottom

%%% check whether we are running pdflatex
    
\newif\ifpdf 
\ifx\pdfoutput\undefined 
\pdffalse % we are not running pdflatex 
\else 
\pdfoutput=1 % we are running pdflatex 
\pdfcompresslevel=9     % compression level for text and image;
\pdftrue 
\fi

\newcommand{\ausgabeS}{}
\newcommand{\ausgabe}[1]{\renewcommand{\ausgabeS}{#1}}
\newcommand{\auftragnehmerS}{}
\newcommand{\auftragnehmer}[1]{\renewcommand{\auftragnehmerS}{#1}}
\newcommand{\auftraggeberS}{}
\newcommand{\auftraggeber}[1]{\renewcommand{\auftraggeberS}{#1}}
\newcommand{\projektS}{}
\newcommand{\projekt}[1]{\renewcommand{\projektS}{#1}}
\newcommand{\spruchS}{}
\newcommand{\spruch}[1]{\renewcommand{\spruchS}{#1}}
\newcommand{\titelbildS}{}
\newcommand{\titelbild}[1]{\renewcommand{\abgabeS}{#1}}
\newcommand{\abgabeS}{}
\newcommand{\abgabe}[1]{\renewcommand{\abgabeS}{#1}}

\renewcommand\maketitle{\begin{titlepage}

  \let\footnoterule\relax
  \let \footnote \thanks
  %\null\vfil
  %\vskip 2\p@
  \begin{center}
  \textbf{\textsc{\Huge \@title}}\par%
  \rule{\linewidth}{0.5mm}
  \end{center}
  \vskip 5em%
  \begin{center}
  \underline{\textbf{\LARGE \projektS}}\par%
  %\rule{\linewidth}{0.5mm}
  \end{center}
  \vskip 6em%
  \begin{center}%
    \vskip 1em%
    \@author \\
    \@date\\
    \vskip 1em%
    \includegraphics[height=11cm]{tinanudel.pdf}  
  \end{center}\par
  \vskip 2em%
  \begin{center}
    {\Large\spruchS}
  \end{center}
%  \vfil\null
  \end{titlepage}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\and\relax
}

\setcounter{footnote}{0}%

\newcommand{\kapitel}[1]{
    \vskip 1em%
    \pagebreak[4]
    \refstepcounter{section}
    \begin{center}
       \underline{\textbf{\Large\thesection{ } #1}}\\
       \vskip 1.4em%
    \addcontentsline{toc}{section}{\protect\numberline{\thesection}{#1}}
    \end{center}}

\newcommand{\sektion}[1]{
    \begin{raggedright}
    \vskip 1em%
    \refstepcounter{subsection}
    \underline{\large \thesubsection{ } #1}\\
    \addcontentsline{toc}{subsection}{\protect\numberline{\thesubsection}{#1}}
    \vskip 1em%
    \end{raggedright}
}

\newcommand{\sektionn}[1]{
    \begin{raggedright}
    \vskip 1em%
    \underline{\large #1}\\
    \addcontentsline{toc}{subsection}{\protect\numberline{}{#1}}
    \vskip 1em%
    \end{raggedright}
}

\newcommand{\tocaddkapitel}[1]{\addcontentsline{toc}{section}{#1}}
\newcommand{\tocaddsektion}[1]{\addcontentsline{toc}{subsection}{#1}}

\newcommand{\save}[2]{\renewcommand{#1}{#2}}

\newenvironment{drehbuch}
    {}
    {\pagebreak[4]}

\newcommand{\action}[1]{
    \vskip 0.5em%
    ~\\
	\hspace{-0.35in}
	\parbox{4in}
	{
		\textsc{#1}
	}
	\par

}

\newcommand{\speech}[3][]{
	\par
	%\hspace{0.75in}
	%\vspace{2mm plus 0mm minus 0mm}
	\begin{center}

	\parbox{5in}
	{
		\begin{center}
			{\Large\textsc{\mdseries#2}}
			\ifthenelse{\equal{#1}{}}{}{
				\par
				(\textsc{#1})
			}
		\end{center}
		{
			\vspace{-3mm plus 0mm minus 0mm}
            \begin{raggedright}
			\large #3
            \end{raggedright}
		}
	}
	\par

	\end{center}
}

\newcommand{\speechruf}[3][]{
	\par
	%\hspace{0.75in}
	%\vspace{2mm plus 0mm minus 0mm}
	\begin{center}

	\parbox{5in}
	{
		\begin{center}
			{\Large\textsc{\mdseries#2}}
			\ifthenelse{\equal{#1}{}}{}{
				\par
				(\textsc{#1})
			}
		\end{center}
		{            
			\vspace{-3mm plus 0mm minus 0mm}
            \begin{center}
			\large #3
            \end{center}
		}
	}
	\par

	\end{center}
}

%
% This should be fully left justified and break out of a parbox,
% but I'm not sure how to do it.  So, if you call it inside of a dialog
% it will only be inside of the parbox.
%
\newcommand{\transition}[1]{
	\par
	\hspace{\textwidth minus 3.5in}
	\parbox{3in}
	{
		\raggedleft
		\textsc{\mdseries#1}
	}
	\par

}



%
% For rapid back and forth dialog
% Usage:
% \dialog{Holmes}{Watson}{
% (Holmes says something & \\
% & (Watson says something) \\
% (Holmes again) & \\
% }
%
% It would be better if alternate paragraphs could be split this way,
% but I don't know how to write a LaTeX rule to do this.
%
\newcommand{\dialog}[3]{
	\hspace{0.25in}
	\begin{tabular}{p{2in}p{2in}}
		\begin{center}
			\Large\textsc{\mdseries#1}
		\end{center}
		&
		\begin{center}
			\Large\textsc{\mdseries#2}
		\end{center}
	\end{tabular}
	\par
	\hspace{0.25in}
	\begin{tabular}{p{2in}|p{2in}}
		#3
	\end{tabular}
}

% Have scenes entered into the table of contents with just the
% name.
%\parskip=\medskipamount\relax
%\let\@startsection\@undefined
\endinput


%% End of file `film.cls'.
