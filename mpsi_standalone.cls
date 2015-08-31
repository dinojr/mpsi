\NeedsTeXFormat{LaTeX2e} 
\ProvidesClass{mpsi_standalone}[2013/09/03 Classe perso mpsi pour fichiers standalone]

\RequirePackage{xkeyval}

\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{standalone}}

\ProcessOptionsX

\LoadClass[crop=true]{standalone}

\input{configuration-base.tex}

\RequirePackage{animate}

\endinput
