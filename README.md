# jcs-emacs-init #

[![Build Status](https://travis-ci.com/jcs090218/jcs-emacs-init.svg?branch=master)](https://travis-ci.com/jcs090218/jcs-emacs-init)
[![License](https://img.shields.io/badge/License-BSD%202--Clause-orange.svg)](https://opensource.org/licenses/BSD-2-Clause)

This is Jen-Chieh Shen's emacs configuration, repeatedly utilized 
and modified since 2015, hopefully this could help someone who is 
new or struggle with Emacs. This configuration should works on 
most OSs, indicates Windows, Linux and MacOS.
<br/>

Emacs itself supports multiple programming languages. I managed 
all the programming languages I personally used. Indeed, I am 
a penchant to numerous technologies, incorporate hardware, firmware 
and software. Here is the list of programming languages I know 
and it has extended from this config.

* ActionScript 2.0 or 3.0 / Assembly Language
* BASIC / Batchfile
* C / C++ / C# / Clojure / COBOL / CSS
* Elisp
* Go
* Haskell / Haxe / HTML
* JSON / Java / JavaScript
* Lisp / Lua
* Makefile
* Objective-C
* Perl / PHP / Python
* Ruby / Rust
* Scala / Shell / SQL / Swift
* TypeScript
* Verilog / Vim script
* XML
* YAML

This configuration polished and goes toward the to the modern 
text editor, e.g. Atom, Sublime Text 2/3, VS Code, etc. 


## Features ##

* *Abbreivation Definition* - powered by 
[project-abbrev](https://github.com/jcs090218/project-abbrev).
* *Autocompletion* - powered by 
[auto-complete](https://github.com/auto-complete/auto-complete).
* *Auto Highlight Symbol* - powered by 
[auto-highlight-symbol-mode](https://github.com/mhayashi1120/auto-highlight-symbol-mode).
* *Binary/Hex Editor* - powered by 
[nhexl-mode](https://github.com/emacsmirror/nhexl-mode).
* *Collaborative Editing* - powered by 
[togetherly](https://github.com/zk-phi/togetherly) and 
[floobits](https://github.com/Floobits/floobits-emacs).
* *Context Menu* - powered by 
[right-click-context](https://github.com/zonuexe/right-click-context).
* *File Explorer* - powered by 
[sr-speedbar](http://cedet.sourceforge.net/speedbar.shtml).
* *File Header* - powered by 
[file-header](https://github.com/alternative-emacs-packages/file-header).
* *Font* - powered by 
[use-ttf](https://github.com/jcs090218/use-ttf).
* *Highlight Matched Pairs* - powered by 
[show-paren-mode](https://www.emacswiki.org/emacs/ShowParenMode).
* *Recet Files* - powered by 
[recentf](https://www.emacswiki.org/emacs/RecentFiles).
* *Regexp* - powered by 
[re-builfer](https://www.emacswiki.org/emacs/ReBuilder).
* *Line Annotation* - powoered by 
[line-reminder](https://github.com/jcs090218/line-reminder).
* *Line Number* - powered by 
[linum](https://www.emacswiki.org/emacs/LineNumbers).
* *Minimap* - powered by 
[sublimity](https://github.com/zk-phi/sublimity).
* *Mode Line* - powered by 
[powerline](https://github.com/milkypostman/powerline).
* *Multiple Cursor* - powered by 
[iedit](https://github.com/victorhge/iedit).
* *Navigation/Searcher* - powered by 
[ag](https://github.com/Wilfred/ag.el).
* *Package Archive* - powered by 
[melpa](http://melpa.org/),
* *PDF Viewer* - powered by 
[pdf-tools](https://github.com/politza/pdf-tools).
* *Shell* - powered by 
[shell](https://www.emacswiki.org/emacs/ShellMode) and 
[exec-path-from-shell](https://github.com/purcell/exec-path-from-shell).
* *Simplify Usage* - powered by 
[helm](https://github.com/emacs-helm/helm).
* *Source Control Management* - powered by 
[magit](https://github.com/magit/magit).
* *Syntax Check* - powered by 
[flycheck](http://www.flycheck.org/en/latest/).
* *Tab Bar* - powered by 
[tabber](https://github.com/dholm/tabbar).
* *Text Editing* - powered by 
[org-mode](https://orgmode.org/).
* *Undo/Redo* - powered by 
[undo-tree](https://www.emacswiki.org/emacs/UndoTree).


## Installation ##
To install, clone this repo and copy the core `files`/`directories` 
to the emacs config directory accordingly.
```sh
# clone this repo
git clone https://github.com/jcs090218/jcs-emacs-init.git

# change current directory to project directory
cd jcs-emacs-init

# copy init file to home
cp ./.emacs ~/

# copy core directories to home
cp -r ./.emacs.d ~/
cp -r ./.emacs.jcs ~/
```


## Supported Emacs versions ##
The config should run on Emacs 24.3 or higher, but still, recommend 
to always run on the latest Emacs version available on your machine.
<br/>
