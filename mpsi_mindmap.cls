\NeedsTeXFormat{LaTeX2e} 
\ProvidesClass{mpsi_mindmap}[2013/09/03 Classe perso mpsi pour fichiers mindmap]

\RequirePackage{xkeyval}


\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptionsX

\LoadClass[a4paper,landscape,17pt]{extarticle}
\RequirePackage[a4paper,margin=0cm,landscape,headsep=0pt]{geometry}

\input{configuration-paquets-communs}
\input{configuration-math}
\input{configuration-couleurs}
\input{configuration-physique}
\input{configuration-chimie}
\input{shortcut}

\input{configuration-tikz-base}
\input{configuration-tikz-circuits}
\input{configuration-tikz-pgfplots}
\input{configuration-polices}

\input{chimie}
\usetikzlibrary{mindmap}
\endinput
