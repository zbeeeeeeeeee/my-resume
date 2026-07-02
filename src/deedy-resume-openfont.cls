% Intro Options
\ProvidesClass{deedy-resume-openfont}[2014/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

% Package Imports
\usepackage[hmargin=1.25cm, vmargin=0.75cm]{geometry}
\usepackage[hidelinks]{hyperref}

% Publications
\usepackage{cite}
\renewcommand\refname{\vskip -1.5cm}

% Color definitions
\usepackage[usenames,dvipsnames]{xcolor} 
\definecolor{date}{HTML}{666666} 
\definecolor{primary}{HTML}{000000}
\definecolor{headings}{HTML}{6A6A6A}
\definecolor{subheadings}{HTML}{333333}
\definecolor{accent}{HTML}{4A6A8A}

% Set main fonts
\usepackage{xeCJK}
\setCJKmainfont[Path = fonts/, Extension=.otf, AutoFakeBold=4.0, AutoFakeSlant=0.2]{FZYouSong GBK}
\setCJKsansfont[Path = fonts/source-han-sans/, Scale=MatchLowercase, Mapping=tex-text]{SourceHanSansSC-ExtraLight}
\setmainfont[Path = fonts/, Extension=.otf, AutoFakeBold=4.0, AutoFakeSlant=0.2]{FZYouSong GBK}
\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path = fonts/source-han-sans/]{SourceHanSansSC-ExtraLight}
\xeCJKsetup{CJKecglue={\hskip 0.15em plus 0.05em minus 0.05em}}

% Date command
\usepackage[absolute]{textpos}
\usepackage[UKenglish]{isodate}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\newcommand{\lastupdated}{\begin{textblock}{60}(155,5)
\color[HTML]{AAAAAA}\fontspec[Path = fonts/, Extension=.otf]{FZYouSong GBK}\fontsize{7pt}{9pt}\selectfont
Last Updated on \today\ $\cdot$ with \LaTeX
\end{textblock}}

% Name command
\newcommand{\namesection}[3]{
\centering{
\fontsize{30pt}{30pt}
\color{primary}
\fontspec[Path = fonts/, Extension=.otf, AutoFakeBold=2.5]{FZYouSong GBK}\selectfont #1
\fontspec[Path = fonts/, Extension=.otf, AutoFakeBold=2.5]{FZYouSong GBK}\selectfont #2
} \\[5pt]
\centering{
\color{headings}
\fontspec[Path = fonts/, Extension=.otf, AutoFakeBold=1.5]{FZYouSong GBK}\fontsize{11pt}{11pt}\selectfont #3}
\noindent\makebox[\linewidth]{\color{accent}\rule{\paperwidth}{0.4pt}}
\vspace{-15pt}
}

% Section seperators 
\usepackage{titlesec}
\titlespacing{\section}{0pt}{0pt}{0pt} 
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\newcommand{\sectionsep}{\vspace{8pt}}

% Headings command
\titleformat{\section}{\color{accent}
\scshape\fontspec[Path = fonts/, Extension=.otf, AutoFakeBold=2.5]{FZYouSong GBK}\fontsize{16pt}{24pt}\selectfont \raggedright}{}{0em}{}

% Subeadings command
\titleformat{\subsection}{
\color{primary}\fontspec[Path = fonts/, Extension=.otf, AutoFakeBold=1.5]{FZYouSong GBK}\fontsize{12pt}{12pt}\selectfont\bfseries\raggedright}{}{0em}{}

\newcommand{\runsubsection}[1]{
\color{primary}\fontspec[Path = fonts/, Extension=.otf, AutoFakeBold=1.5]{FZYouSong GBK}\fontsize{12pt}{12pt}\selectfont\bfseries {#1} \normalfont}

% Descriptors command
\newcommand{\descript}[1]{
\color{primary}\raggedright\fontspec[Path = fonts/, Extension=.otf]{FZYouSong GBK}\fontsize{10pt}{10pt}\selectfont {#1 \\} \normalfont}

% Location command
\newcommand{\location}[1]{
\color{headings}\raggedright\fontspec[Path = fonts/, Extension=.otf]{FZYouSong GBK}\fontsize{10pt}{10pt}\selectfont {#1\\} \normalfont}

% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{
\vspace{-\topsep}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt\color{primary}}
{\end{itemize}\vspace{-\topsep}}

