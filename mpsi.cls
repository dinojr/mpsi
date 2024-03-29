\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mpsi}[2015/07/26 par Julien Cubizolles]
\makeatletter
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Options de classe
%%%%%%%%%%%%%%%%%%%%%%%%%%
\PassOptionsToPackage{force}{filehook}

\RequirePackage{xkeyval}

\newif\ifcours
\DeclareOptionX{cours}[false]{\courstrue}

\newif\ifDS
\DeclareOptionX{DS}[false]{\DStrue}

\newif\ifDM
\DeclareOptionX{DM}[false]{\DMtrue}

\newif\ifexos
\DeclareOptionX{exos}[false]{\exostrue}

\newif\ifpython
\DeclareOptionX{python}[false]{\pythontrue}

\newif\ifTP
\DeclareOptionX{TP}[false]{\TPtrue}

\newif\ifCls@mpsi@colonne
\DeclareOptionX{colonne}[true]{\@nameuse{Cls@mpsi@colonne#1}}

\newif\ifCls@mpsi@access
\DeclareOptionX{access}[true]{\@nameuse{Cls@mpsi@access#1}}

\newif\ifcorr
\corrtrue
\DeclareOptionX{nocorr}[false]{\corrfalse}

\newif\ifCls@mpsi@noVersion
\DeclareOptionX{noVersion}[true]{\@nameuse{Cls@mpsi@noVersion#1}}
        
\def\Cls@mpsi@class{extarticle}

\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{\Cls@mpsi@class}}

\ProcessOptionsX

\ifCls@mpsi@access
\PassOptionsToClass{onecolumn,landscape,20pt}{\Cls@mpsi@class}
\Cls@mpsi@colonnefalse
\else
\ifCls@mpsi@colonne
\PassOptionsToClass{twocolumn,landscape}{\Cls@mpsi@class}
\fi
\fi

\LoadClass[a4paper]{\Cls@mpsi@class}

\input{configuration-base.tex}
\ifCls@mpsi@access
\tikzset{style courant/.append style = {scale=2}}
\fi
\input{configuration-sections.tex}
%% Attention, des conflits entre standalone et pstricks: standalone
%% doit être chargé avant pstricks
%% \item (LaTeX Error: Command \clipbox already defined.
% Or name \end... illegal, see p.192 of the manual.)
\RequirePackage{standalone}

\RequirePackage{pageslts}
\AtBeginDocument{\pagenumbering{arabic}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%    Sections
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{framed}

\RequirePackage[hyperref,framed,thmmarks,amsmath]{ntheorem}
\RequirePackage[framemethod=TikZ,xcolor]{mdframed}

\ifTP
% \renewcommand\section{\@startsection {section}{1}{\z@}%
%                                     {-1.75ex \@plus -.5ex \@minus -.1ex}%
%                                     {2.3ex \@plus.2ex}%
%                                     {\normalfont\Large\bfseries\sffamily}}
% \renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
%                                         {-1.625ex\@plus -.5ex \@minus -.1ex}%
%                                         {1.5ex \@plus .2ex}%
%                                         {\normalfont\large\bfseries\sffamily}}
% \renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
%                                         {-1.625ex\@plus -.5ex \@minus -.1ex}%
%                                         {1.5ex \@plus .2ex}%
%                                         {\normalfont\normalsize\bfseries\sffamily}}


\newmdenv[roundcorner=5pt,backgroundcolor=gray!30,skipabove=5pt]{important}

\theoremheaderfont{\sffamily\upshape\bfseries}
\theoremstyle{nonumberbreak}
\theoremseparator{ :}
\theorembodyfont{\itshape}
\newtheorem{protocole}{Protocole}
\newtheorem{exploitation}{Exploitation}
\newtheorem{interpretation}{Interprétation}
\newtheorem{manip}{Manipulations}
\newtheorem{materiel}{Matériel}
\newtheorem{question}{Questions}

\theorembodyfont{\rmfamily}
\newtheorem{objectif}{Objectifs}
\newtheorem{capacites}{Capacités mises en œuvre}

\RequirePackage{enumitem,amssymb}
\newlist{todolist}{itemize}{2}
\setlist[todolist]{label=$\square$}

\fi

\ifDS
% \renewcommand\section{\@startsection {section}{1}{\z@}%
%   {-1.75ex \@plus -.5ex \@minus -.1ex}%
%   {2.3ex \@plus.2ex}%
%   {\normalfont\large\bfseries\sffamily}}
% \renewcommand{\thesection}{\textsf{\bfseries\Roman{section}}}
\newcommand{\withsections}{
  \renewcommand\theenumi{\textsf{\bfseries\thesection.\arabic{enumi}}}
  \renewcommand\theenumii{\textsf{\bfseries\alph{enumii}}}
}
\newcommand{\withoutsections}{
  \renewcommand\theenumi{\textsf{\bfseries\arabic{enumi}}}
  \renewcommand\theenumii{\textsf{\bfseries\alph{enumii}}}}
\withoutsections
\fi

\ifDM
% \renewcommand\section{\@startsection {section}{1}{\z@}%
%   {-1.75ex \@plus -.5ex \@minus -.1ex}%
%   {2.3ex \@plus.2ex}%
%   {\normalfont\large\bfseries\sffamily}}
% \renewcommand{\thesection}{\textsf{\bfseries\Roman{section}}}
\newcommand{\withsections}{
  \renewcommand\theenumi{\textsf{\bfseries\thesection.\arabic{enumi}}}
  \renewcommand\theenumii{\textsf{\bfseries\alph{enumii}}}
}
\newcommand{\withoutsections}{
  \renewcommand\theenumi{\textsf{\bfseries\arabic{enumi}}}
  \renewcommand\theenumii{\textsf{\bfseries\alph{enumii}}}}
\withoutsections
\fi

% \renewcommand{\thesection}{\Roman{section}}
% \renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
% \renewcommand{\thesubsubsection}{\thesubsection.\alph{subsubsection}}

\newcommand{\dontcount}{
  \addtocounter{page}{-1}
%  \immediate\write\@auxout{\string\newlabel{LastPage}{{}{\thepage}{}{page.\thepage}{}}}%
%  \addtocounter{page}{1}
}

\RequirePackage[hyperref,thmmarks,framed]{ntheorem}
\theoremheaderfont{\sffamily\upshape\bfseries}

\renewtheoremstyle{break}%
% {\item[\rlap{\vbox{\hbox{\hskip\labelsep \theorem@headerfont
%         ##1\ ##2\theorem@separator}\hbox{\strut}}}]}%
% {\item[\rlap{\vbox{\hbox{\hskip\labelsep \theorem@headerfont
%         ##1\ ##2 : ##3\theorem@separator}\hbox{\strut}}}]}
{\item[\rlap{\vbox{\hbox{\hskip\labelsep \theorem@headerfont
        ##1\ ##2\theorem@separator}\hbox{\strut}}}]}%
{\item[\rlap{\vbox{\hbox{\hskip\labelsep \theorem@headerfont
        ##1\ ##2 : ##3\theorem@separator}\hbox{\strut}}}]}%
\theoremseparator{}
\theoremstyle{break}
\theoremsymbol{}

\theorembodyfont{\rmfamily}

\mdfdefinestyle{mpsiframe}{nobreak,roundcorner=5pt,backgroundcolor=gray!30,skipabove=\baselineskip,skipbelow=\baselineskip,outerlinewidth=2pt,backgroundcolor=gray!10}

\newtheorem{loi}{Loi}
\surroundwithmdframed[style=mpsiframe]{Loi}

\ifCls@mpsi@colonne
\theoremheaderfont{\sffamily\upshape\bfseries\large}
\else \theoremheaderfont{\Large \sffamily\upshape\bfseries}
\fi 

\ifDM
\theoremprework{\vskip \baselineskip
}
\theorempostwork{%\vskip \baselineskip
  \begin{center} 
    \begin{minipage}{.5\columnwidth}
      \strut
      \hrule%\strut
    \end{minipage}
  \end{center}
  } 
\fi
\ifDS
\theoremprework{\vskip \baselineskip
  } 
\theorempostwork{%\vskip \baselineskip
  \begin{center} 
    \begin{minipage}{.5\columnwidth}
      \strut
      \hrule
    \end{minipage}
  \end{center}
  } 
\fi

\newtheorem{exercice}{Exercice}

%%%%%%%% Pourquoi faut-il le répéter ?
\ifDM
\theoremprework{\vskip \baselineskip
}
\theorempostwork{\strut
  \begin{center} 
    \begin{minipage}{.5\columnwidth}
      \strut\hrule
    \end{minipage}
  \end{center}
  } 
\fi
\ifDS
\theoremprework{\vskip \baselineskip%
%  \setcounter{section}{0}
  } 
\theorempostwork{\strut
  \begin{center} 
    \begin{minipage}{.5\columnwidth}
      \strut 
      \hrule
    \end{minipage}
  \end{center}
  } 
\fi
\newtheorem{probleme}{Problème}

%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% Les réponses
%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{answers}

\Newassociation{corprob}{solprob}{mycor}
\Newassociation{corexo}{solexo}{mycor}
\let\oldcorprob\corprob
\let\oldcorexo\corexo
\Newassociation{commentaires}{comm}{mycor}
\newcounter{bogusprob}
\newcounter{bogusexo}

\renewcommand{\solproblabel}[1]{\textbf{\large \textsf{Correction du
         problème \textbf{#1}}}}

\renewcommand{\solexolabel}[1]{\textbf{\large \textsf{Correction de
      l'exercice  \textbf{#1}}}}

\renewcommand{\corprob}{\refstepcounter{bogusprob}\oldcorprob}
\renewcommand{\corexo}{\refstepcounter{bogusexo}\oldcorexo}

\let\oldsolprob\solprob
\renewcommand{\solprob}[1]{\oldsolprob{#1}\ \par} 
\let\oldsolexo\solexo
\renewcommand{\solexo}[1]{\oldsolexo{#1}\ \par} 

\@addtoreset{section}{probleme}
\@addtoreset{section}{solprob}
\@addtoreset{section}{exo}
\@addtoreset{section}{solexo}

%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%% Les réponses
%%%%%%%%%%%%%%%%%%%%%% 
\RequirePackage{answers}
\AtBeginDocument{
  \Opensolutionfile{mycor}
}
\AtEndDocument{%
  \Closesolutionfile{mycor}
  \ifcorr
  \cleardoublepage
  \Readsolutionfile{mycor}
  \fi
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Environnement d'exos, réponses : fins
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

\ifDS
%%%%%%%% Pour un DS
  \newcommand{\@titlecor}{DS \@title : corrigé}
  \newcommand{\titlecor}[1]{\renewcommand{\@titlecor}{#1}}
\fi

\ifDM
%%%%%%%% Pour un DM
  \newcommand{\@titlecor}{DM \@title : corrigé}
  \newcommand{\titlecor}[1]{\renewcommand{\@titlecor}{#1}}
  \newcommand{\@sujet}{sujet}
  \newcommand{\sujet}[1]{\renewcommand{\@sujet}{#1}}
  \newcommand{\makesujet}{%
    \begin{center}
      \textsf{\textbf{\Large \@sujet}}
    \end{center}
  }
\fi

\ifexos
  %%%%%%%%% si on fait une feuille d'exos
  \let\maketitle\relax
  \newcommand{\@titlecor}{\@title : corrigé}
  \newcommand{\titlecor}[1]{\renewcommand{\@titlecor}{#1}}
  \newcommand{\semaine}[2]{%
  \newcommand{\@semaine@debut}{#1}\newcommand{\@semaine@fin}{#2}}
  \newcommand{\makesemaine}{Semaine du \@semaine@debut\xspace au \@semaine@fin}
   \def\maketitlecor{%
     \par
     \begingroup
     \if@twocolumn
     \twocolumn[\@maketitlecor]
     \else \newpage
     \global\@topnum\z@ 
     \@maketitlecor
     \fi
     \endgroup
     \setcounter{footnote}{0}
     \let\maketitle\relax%
     \let\@maketitlecor\relax%
    \gdef\@titlecor{}%
   }
   \def\@maketitlecor{%
     \newpage
     \null
     \vskip 2em 
     \begin{center}
       {\LARGE \bf  \upshape \@titlecor \par} % Changer ici pour le style de fonte
     \end{center}
     \par
     \vskip 1.5em
   }

\def\theme{\@ifnextchar [{\@itheme}{\@itheme[.5\columnwidth]}}
\def\@itheme[#1]#2{%
  \begin{center}
    \begin{minipage}[t]{#1}
      \begin{center} \hrule \vspace \baselineskip
        \textbf{\sffamily \Large \protect{#2}}
      \end{center} \hrule
    \end{minipage}
  \end{center}
}

\newcommand{\@classifu}{}
\newcommand{\classifu}{\renewcommand{\@classifu}}
\newcommand{\@classifd}{}
\newcommand{\classifd}{\renewcommand{\@classifd}}
\newcommand{\@classift}{}
\newcommand{\classift}{\renewcommand{\@classift}}

\newcommand{\classification}[1]{
  \begin{center}
    \begin{minipage}[t]{.8\linewidth}
      \hrule\vskip .5\baselineskip
      \itshape \protect{#1}
      \normalfont
      \begin{description}
      \item[Exercices d'application :] \@classifu
      \item[Culture en sciences physiques :] \@classifd
      \item[Corrigés en TD :] \@classift
      \end{description}
      \hrule
    \end{minipage}
  \end{center}
}
\fi % fin du paramétrage des feuilles d'exos

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%  Géométrie
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr}
\RequirePackage{fancybox}


\setlength{\abovedisplayskip}{6pt plus 1.5pt minus 3.5pt}
\setlength{\belowdisplayskip}{\abovedisplayskip}
% \setlength{\abovedisplayshortskip}{0pt}
\AtBeginDocument{%
  % \abovedisplayskip=6pt plus 1.5pt minus 3.5pt
  % \belowdisplayskip=\abovedisplayskip
  % \flushleft
}

\renewcommand{\footrulewidth}{0.4pt}
\lhead{\@classe \xspace, \@lycee}
\chead{%
  \ifnum\thepage=1 
  \ifCls@mpsi@colonne \LARGE\textbf{\textsf{\@title}}
  \else \large\textbf{\textsf{\@title}}
  \fi
  \else \large\textbf{\textsf{\@title}}
  \fi
}

\rhead{%
    \ifexos \makesemaine  \fi
    \ifDS   \@jour   \fi
    \ifDM \makepourle \fi
    \ifTP \@jour \fi
    \ifcours \@jour \fi
  }
  
  \ifCls@mpsi@colonne
     %%%%%%%%%%%%%%%%%%
     % Si on demande le twocolumn
     %%%%%%%%%%%%%%%%%%
    \RequirePackage[a4paper,margin=1.5cm,includeheadfoot,landscape,headsep=18pt]{geometry}
    \ifpython
    \setlength{\columnsep}{40pt}
    \fi
    \columnseprule=.8pt
    \ifCls@mpsi@access
    \pagestyle{empty}
    \else
    \pagestyle{fancy}
    \fi
    %%%%%%%%%%%%%%%%%%
    %% Header/footage
    %%%%%%%%%%%%%%%%%%
    \lfoot{%
      \ifCls@mpsi@noVersion
      \else
      \unitlength=1cm
      \begin{picture}(0,0)
        \put(-.5,0){%
          \rotatebox[origin=tl]{90}{%
            \tiny\textsl{\texttt{\jobname.tex},version du \timestamp}}}
      \end{picture}
      \fi
      \@auteur,\xspace \@licence
    }
    
     \cfoot{\textsc{\thepage}/\textsc{\pageref{VeryLastPage}}}
     \rfoot{\@anneesco}
     
  \else
  %%%%%%%%%%%%%%%%%%%%%%
  % Si on ne demande pas le twocolumn
  %%%%%%%%%%%%%%%%%%%%%%
  
  \ifCls@mpsi@access
  \RequirePackage[paperheight=30
  cm,paperwidth=30cm,textwidth=17cm,textheight=27cm,left=1cm,top=1cm]{geometry}
  \RequirePackage{xparse}
  \RenewDocumentEnvironment{minipage}{ o o o m }{\par}{\par}
  \pagestyle{empty}
  \else
  \RequirePackage[a4paper,margin=1cm,includeheadfoot,headsep=15pt]{geometry}
  \pagestyle{fancy}
  \lfoot{%
    \ifCls@mpsi@noVersion
    \else
    \unitlength=1cm
    \begin{picture}(0,0)
      \put(-.5,0){%
        \rotatebox[origin=tl]{90}{%
          \tiny\textsl{\texttt{\jobname.tex},version du \timestamp}
        }
      }
    \end{picture}
    \fi
    {\small \@auteur\xspace}
    {\tiny \@licence}
  }
  \rfoot{\@anneesco}
  \fi
  
  \fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%  Géométrie - fin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifpython
  \RequirePackage{minted}
  \setminted[ipython]{frame=lines,fontsize=\scriptsize,linenos,breaklines}
  \setminted[python]{frame=lines,fontsize=\scriptsize,linenos,breaklines}
\fi
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Packages nécessaires
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \reserveinserts{28}
%et pour en avoir davantage

% \RequirePackage{ae,aecompl}


%\frenchbsetup{AutoSpacePunctuation=true}
% \RequirePackage{numprint}
% \RequirePackage{psfrag} 

% \RequirePackage[cyr]{aeguill} 


%\RequirePackage{frcursive}
% \RequirePackage[T1]{fontenc}
% \RequirePackage{lmodern}



%\RequirePackage{wrapfig}   %%%%%%% figures

%\RequirePackage{manfnt,mathrsfs} % des fontes


% \input{shortcut}
% \input{chimie}

% Compatibilité version antérieure
\theoremheaderfont{\sffamily\upshape\bfseries}
\theoremstyle{nonumberbreak}
\theoremseparator{ :}
% \theoremsymbol{$\bullet$}
\theorembodyfont{\rmfamily}
\newtheorem{exemple}{Exemple}
\newtheorem{remarque}{Remarque}
\theoremsymbol{\leavevmode\bfseries \sffamily \tiny Fin}
\newtheorem{demo}{Démonstration}

\newcommand{\rem}{\textbf{Remarque:}\xspace}
\makeatother
\endinput
