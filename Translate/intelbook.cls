\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{intelbook}[2017/07/27 A Chinese article style. Developed by Time-Coder]

\LoadClass[UTF8,a4paper,11pt]{ctexbook}
\ctexset{section={format={\Large \bfseries}}}

% Packages
% \RequirePackage{fontspec}                   % 字体
\RequirePackage{setspace}
\RequirePackage[letterpaper, portrait]{geometry} 
\geometry{left={1.5cm},right={1.5cm},top={2cm},bottom={2cm}}
\RequirePackage{titlesec}
\RequirePackage{siunitx}
\RequirePackage{indentfirst}
\RequirePackage{fancyhdr}					% 设置页眉页脚
\RequirePackage{chngpage}					% 设置页边距
\RequirePackage{longtable}					% 长表格跨页显示
\RequirePackage{booktabs}					% 编辑表格所需
\RequirePackage{multirow}					% 表格合并跨多行的单元格
\RequirePackage{multicol}					% 双栏排版
\RequirePackage{flushend}					% 双栏布局最后一页对齐
\RequirePackage{cuted}						% 双栏排版时，给宽的图片、表格等提供单栏空间
\RequirePackage{bm}							% 数学粗体
\RequirePackage{mathrsfs}					% 数学花体
\RequirePackage{amsmath}					% 提供公式换行环境
\RequirePackage{amssymb}					% 提供特殊字符
\RequirePackage{textcomp}					% 提供一些带圈的特殊符号
\RequirePackage{pifont}						% 提供带圈数字等特殊字符
\RequirePackage{cases}						% 提供分段函数每行编号环境
\RequirePackage{ctex}						% 提供中文支持
\RequirePackage{float}						% 强制使浮动环境不浮动
\RequirePackage{url}						% 网址超链接
\RequirePackage{algorithm}					% 为算法提供浮动体环境
\RequirePackage{algorithmic}				% 提供了描述算法常用的结构命令
\RequirePackage{graphicx}					% 提供插图命令
\RequirePackage{epsfig}						% 在 pdflatex 编译时也支持 eps 图片
\RequirePackage{subfigure}					% 提供插入子图的命令
\RequirePackage{caption}					% 使图片标题格式化
\RequirePackage{xcolor}						% 用 RGB 方式定义各种颜色
\definecolor{intel}{RGB}{8,96,168}
\definecolor{INTEL}{RGB}{8,96,168}
\RequirePackage{minted}
\RequirePackage{tcolorbox}
\tcbuselibrary{minted}
\tcbuselibrary{skins,breakable}
\usetikzlibrary{shadings,shadows}
\RequirePackage[colorlinks,%
                linkcolor=intel,%
                anchorcolor=red,%
                citecolor=intel,
                urlcolor=intel]{hyperref}   % 页面超链接
\RequirePackage{xpatch}

%% Newcommands
% font newcommands
\setCJKmainfont{微软雅黑}
\setmainfont{Neo Sans Intel}
\newcommand{\YAHEI}[1]{{\CJKfontspec{微软雅黑} #1}}
\newcommand{\KAI}[1]{{\kaishu #1}}
\newcommand{\HEI}[1]{{\heiti #1}}
\newcommand{\SONG}[1]{{\songti #1}}
\newcommand{\FSONG}[1]{{\fangsong #1}}
\newcommand{\LI}[1]{{\lishu #1}}
\newcommand{\YOU}[1]{{\youyuan #1}}
\newcommand{\red}[1]{\textcolor{red}{#1}}
\newcommand{\intelblue}[1]{\textcolor{intel}{#1}}
\newcommand{\blue}[1]{\textcolor{blue}{#1}}
\newcommand{\green}[1]{\textcolor{green}{#1}}
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}
\newcommand{\registered}{\!\,\raisebox{-2mm}{\huge{\textregistered}}}
\renewcommand{\copyright}{\!\,\raisebox{-2mm}{\huge{\textcopyright}}}
% math newcommands
\newcommand{\floor}[1]{ \left\lfloor {#1} \right\rfloor }
\newcommand{\ceil}[1]{ \left\lceil {#1} \right\rceil }
\newcommand{\mpair}[2]{ \left\langle {#1}, {#2} \right\rangle}
\newcommand{\mat}[1]{\bm{#1}}
\newcommand{\dif}{\mathrm{d}}
\newcommand{\me}{\mathrm{e}}
\newcommand{\mi}{\mathrm{i}}
\newcommand{\vecmat}[1]{\vecm{\left( #1 \right)}}
\newcommand{\vecsmat}[1]{\vecs{\left( #1 \right)}}
\newcommand{\vecasym}[1]{[#1]_\times}
\newcommand{\id}{\mathbbm{1}}
\newcommand{\fracode}[2]{\frac{\dif {#1}}{\dif {#2}}}
\newcommand{\fracpde}[2]{\frac{\partial {#1}}{\partial {#2}}}
\newcommand{\fracpderow}[2]{\partial {#1}/\partial {#2}}
\newcommand{\fracoderow}[2]{\dif {#1}/\dif {#2}}
\newcommand{\fracpdemix}[3]{\frac{\partial^2 {#1}}{\partial {#2} \partial {#3}}}
\newcommand{\lap}[2]{\frac{\partial^2 {#1}}{\partial {#2}^2}}
\newcommand{\laprow}[2]{\partial^2 {#1}/\partial {#2}^2}
\newcommand{\secode}[2]{\frac{\dif^2 {#1}}{\dif {#2}^2}}
\newcommand{\set}[1]{\left\{ #1 \right\}}
\newcommand{\abs}[1]{\left| #1 \right|}
\newcommand{\absvec}[1]{\left| \bf{#1} \right|}
\newcommand{\ket}[1]{|#1 \rangle}
\newcommand{\bra}[1]{\langle #1 |}
\newcommand{\braket}[2]{ \langle #1 | #2 \rangle}
\newcommand{\norm}[1]{\lVert #1 \rVert}
\newcommand{\normF}[1]{{\parallel #1 \parallel}_\textrm{F}}
\newcommand{\tA}[1]{{#1}^\textsf{T}}
\newcommand{\inv}[1]{#1^{-1}}
\newcommand{\ginv}[1]{#1^+}
\newcommand{\tAinv}[1]{{#1}^{-\textsf{T}}}
\newcommand{\ES}[3]{\mathbb{#1}^{{#2}\times {#3}}}
\newcommand{\PS}[3]{\mathbb{#1}^{{#2}\times{#3}}}
\newcommand{\overarrow}[1]{\stackrel{\raisebox{-2pt}[0pt][0pt]{\small$\rightharpoonup$}}{#1}}

% figure newcommands
% 使用 Scale=0.5的图片而且点击图片标题能够回到引用图片的地方，需要和下面的\IREF命令配合使用
\newcommand{\IMG}[4]{
\begin{figure}[H]
\centering\includegraphics[scale=#1]{#2}
\hyperref[#4totext]{\caption{#3}\label{#4}}
\end{figure}
}
% 使用点击文字到图片的超链接
\newcommand{\IREF}[1]{\hyperref[#1]{\KAI{图\ref{#1}}} \label{#1totext}}

%% Renewcommand
\renewcommand{\vec}[1]{\mathbf{#1}}
\renewcommand{\baselinestretch}{1.2}
\renewcommand{\thefigure}{\textbf{\thechapter-\arabic{figure}}}
\renewcommand{\theequation}{\thechapter-\arabic{equation}}
\renewcommand{\captionfont}{\color{intel}\bfseries}
\renewcommand{\abstractname}{\Large \HEI{摘 \quad 要}}
\renewcommand{\contentsname}{\hfil 目 \quad 录}
% \renewcommand{\figurename}{图}
\renewcommand{\algorithmicrequire}{\textbf{输入:}}
\renewcommand{\algorithmicensure}{\textbf{输出:}}

% Settings
\setlength{\columnsep}{3em}			% 双栏排版时两栏间距设为 3em
\setlength{\parindent}{2em}			% 段落缩进量设为 2em
\makeatletter
\@addtoreset{figure}{section}		% 使图片编号与章编号关联
\@addtoreset{equation}{section}		% 使公式编号与章编号关联
\makeatother

\let\hruleptFour\hrule
\def\hrule{\hruleptFour height 1pt}

\newcommand{\tmpchapter}[1]{}
\let\tmpchapter=\chapter
\renewcommand{\chapter}[1]{
    \tmpchapter{\intelblue{#1}}
    \vspace*{-14mm}
    \hrule
    \nobreak
    \vspace*{2mm}
}

\newcommand*{\justifyheading}{\raggedleft}
\titleformat{\chapter}[display]{\normalfont\LARGE\bfseries\justifyheading}{\intelblue{第 \thechapter 章}}{-5pt}{\LARGE}
\titlespacing*{\chapter}{0pt}{-5mm}{40pt}

\renewcommand\thesection{\intelblue{\arabic{chapter}.\arabic{section}}}
\newcommand{\tmpsection}[1]{}
\let\tmpsection=\section
\renewcommand{\section}[1]{\tmpsection{\intelblue{#1}}}

\renewcommand\thesubsection{\intelblue{\arabic{chapter}.\arabic{section}.\arabic{subsection}}}
\newcommand{\tmpsubsection}[1]{}
\let\tmpsubsection=\subsection
\renewcommand{\subsection}[1]{\tmpsubsection{\intelblue{#1}}}

\graphicspath{{Figures/}}			% 设置图片搜索路径
\DeclareMathOperator{\diag}{diag}
\DeclareMathOperator{\rank}{rank}
\DeclareMathOperator{\vecm}{vec}
\DeclareMathOperator{\vecs}{vecs}
\DeclareMathOperator*{\argmin}{argmin}

\def\equationautorefname{\KAI{式}}%
\def\footnoteautorefname{\KAI{脚注}}%
\def\itemautorefname{\KAI{项}}%
\def\figureautorefname{\textbf{图}\!}%
\def\subfigureautorefname{图\,\thechapter.\!\!}%
\def\tableautorefname{\KAI{表}}%
\def\partautorefname{\KAI{篇}}%
\def\appendixautorefname{\KAI{附录}}%
\def\sectionautorefname{\KAI{章}}%
\def\subsectionautorefname{\KAI{节}}%
\def\subsubsectionautorefname{\KAI{小节}}%
\def\paragraphautorefname{\KAI{段落}}%
\def\subparagraphautorefname{\KAI{子段落}}%
\def\FancyVerbLineautorefname{\KAI{行}}%
\def\theoremautorefname{\KAI{定理}}%
\def\algorithmautorefname{\KAI{算法}}%

% minted setting
\definecolor{mintedbackground}{rgb}{0.95,0.95,0.95}
\newminted[ccode]{c}{
bgcolor=mintedbackground,
linenos=true,
fontsize=\footnotesize,
frame=single,
tabsize=4,
mathescape=true
}
\newminted[cppcode]{c++}{
bgcolor=mintedbackground,
linenos=true,
fontsize=\footnotesize,
frame=single,
tabsize=4,
mathescape=true
}
\newminted[latexcode]{latex}{
bgcolor=mintedbackground,
linenos=true,
fontsize=\footnotesize,
frame=single,
tabsize=4,
mathescape=true
}
\newminted[matlabcode]{matlab}{
bgcolor=mintedbackground,
linenos=true,
fontsize=\footnotesize,
frame=single,
tabsize=4,
mathescape=true
}
\newminted[mathematicacode]{wolfram}{
bgcolor=mintedbackground,
linenos=true,
fontsize=\footnotesize,
frame=single,
tabsize=4,
mathescape=true
}
\newminted[shellcode]{shell}{
bgcolor=mintedbackground,
linenos=true,
fontsize=\footnotesize,
frame=single,
tabsize=4,
mathescape=true
}
\newminted[jsoncode]{json}{
bgcolor=mintedbackground,
linenos=true,
fontsize=\footnotesize,
frame=single,
tabsize=4,
mathescape=true
}

\newtcblisting{code}[2][]
{%
    left=0mm,
    rightrule=0.2mm,
    leftrule=0.2mm,
    toprule=0.2mm,
    bottomrule=0.2mm,
    breakable,
    enhanced,
    drop fuzzy shadow=black!80,
    colback=mintedbackground,
    listing only,
    listing engine=minted,
    minted options=%
    {%
        linenos=true,
        tabsize=4,
        mathescape=true
    },
    minted language=#2,
    #1
}

\definecolor{framecolor}{RGB}{26,89,142}
\definecolor{backcolor}{RGB}{233,238,244}
\newenvironment{block}[1]{%
    \tcolorbox[beamer,%
    noparskip,%
    breakable,%
    colback=backcolor,colframe=framecolor,%
    drop fuzzy shadow=black!80,
    title=#1]}%
    {\endtcolorbox}