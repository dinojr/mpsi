\NeedsTeXFormat{LaTeX2e} 
\ProvidesClass{mpsi_standalone}[2013/09/03 Classe perso mpsi pour fichiers standalone]

\RequirePackage{xkeyval}

\newif\ifPstricks
\DeclareOptionX{Pstricks}[false]{\Pstrickstrue}

\newif\ifTikz
\DeclareOptionX{Tikz}[true]{\Tikztrue}

\newif\ifAnimate
\DeclareOptionX{Animate}[false]{\Animatetrue}

\ifPstricks
   \PassOptionsToClass{pspicture=true}{standalone}
   \Tikzfalse
\fi

\ifTikz
   \PassOptionsToClass{tikz=true}{standalone}
\fi

\ifAnimate
    \PassOptionsToClass{multi=animateinline}{standalone}
\fi

\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{standalone}}

\ProcessOptionsX

\LoadClass[crop=true]{standalone}


% \RequirePackage[utf8]{inputenc}
% utf8x plutôt que utf8 pour pouvoir taper du grec directement

% À changer pour passer à luatex
% \RequirePackage[T1]{fontenc}

% \RequirePackage{etex}

% Option dangereuse, trop de code tapé sans algebraic
%\psset{algebraic=true}

% \RequirePackage{gensymb} % pour \micro, \mu
% \RequirePackage[greek,frenchb]{babel}


% \RequirePackage[narrowiints,partialup]{kpfonts}
% \RequirePackage[frenchstyle,narrowiints,partialup]{kpfonts}


% \RequirePackage{graphicx}
% \DeclareGraphicsExtensions{.pdf,.png,.jpg,.gif}

% \RequirePackage{mathtools}
% pour DeclarePairedDelimiter et co.

\input{configuration-paquets-communs}
\input{configuration-math}
\input{configuration-couleurs}
\input{configuration-physique}

\ifTikz
\input{configuration-tikz-base}
\input{configuration-tikz-circuits}
\input{configuration-tikz-pgfplots}
\input{shortcut}
\input{wilk-tikz-circuits}
\fi

\ifPstricks
  \RequirePackage{pstricks,pstricks-add,pst-coil}
\fi

\ifAnimate
\RequirePackage{animate}
\fi

\input{chimie}

\endinput
