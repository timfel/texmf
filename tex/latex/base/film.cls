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

\LoadClass{report}
\usepackage{fancyhdr}
\usepackage{ifthen}
%\usepackage{fullpage}
\parindent = 0 pt
\textwidth = 348pt
\textheight = 680pt
\voffset = -0.5in
\baselineskip=2pt
\raggedbottom

%
% Include the scene and act on each page
%
\renewcommand{\@oddhead}{\hfill Szene \thesection}
%\renewcommand{\@seccntformat}[1]{\large\textsc{\thesection: #1}}


\newcommand{\act}[1]{
	\chapter{#1}
}

% Have scenes entered into the table of contents with just the
% name.
\newcommand{\scene}[3]{
	%\par
    \begin{centering}
	\section[#2]{Szene #1 - #2 #3 }%
    \end{centering}
	%\par
}

\newcommand{\action}[1]{
	\hspace{-0.35in}
	\parbox{2in}
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
			\large #3
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

%
% Create an actor whose dialog can be created by using \ACTORNAME
%
\newcommand{\newactor}[2]{
	\let \actor #1
	\newcommand{#1}[2][]{
		\speech[#1]{\actor}{#2}
	}
}

\renewcommand{\chaptername}{Act}

\parskip=\medskipamount\relax
%\let\@startsection\@undefined
\endinput


%% End of file `film.cls'.
