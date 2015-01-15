# Vim configuration

## Introduction
A vim configuration designed for PHP and optimised for Laravel. 

##Installation
This installation assumes running on an ubuntu system. However, changing the installation
steps for another OS shouldn't be too dificult.

* Run `sudo apt-get install vim`
+ Clone this repo into the `~/.vim` directory
* Setup vundle: `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim` 
* Run `vim`
* In vim run `:PluginInstall` and wait for packages to install.

### Font installation
Fonts must be installed on the target machine and if using an SSH client must also be installed on the host.
Fonts are from [powerline/fonts](https://github.com/powerline/fonts).

####Target Machine

* In the home directory run `git clone https://github.com/powerline/fonts.git`
* Now `cd fonts`
* Run `./install.sh`
* `fc-cache -vf ~/.fonts/`

    
####Host Machine
* [Click here](https://github.com/powerline/fonts/archive/master.zip) to download the fonts.
* In the downloaded directory follow your PC instructions to install *Sauce Code Powerline Regulat.otf*.
* In your SSH client select that as the font.

###Ctags
Some key mappings for ctags have been used. To install ctags run `sudo apt-get install exuberant-ctags`.
Then in your working directory run `ctags -R` to generate the ctags file. You can then hit <kbd>CTRL</kbd>+<kbd>p</kbd> to bring up ctrlP and search tags.

###Fast saving
The configuration has a key map of <kbd>CTRL</kbd>+<kbd>S</kbd> to save a file, as is common in most text editors.
However, in most terminals this will freeze the terminal so some things must be added to your `.bashrc` file to stop this:

* `vim ~/.bashrc`
* Append `stty ixany` to the bottom of the file.
* Append `stty ixoff -ixon` to the bottom of the file.
* Exit vim.

###Codesniffer and Mess Detector
The package uses PHP QA Tools to check for code errors. Custom Code Sniffer and Mess Detector rulesets have been included
that are complementary to Laravel. Ofcourse these can be easily customised and are defined in the *rulesets/* file.

To utilise PHP QA some prerequisites must be installed:

* `sudo apt-get install php-pear` (if not already installed)
* `sudo pear install PHP_CodeSniffer`
* `sudo pear channel-discover pear.phpmd.org`
* `sudo pear install phpmd/PHP_PMD-1.5.0`

###Omnicomplete
The configuration uses phpcomplete-extended for additional omnicomplete settings. 
The package is useful in retrieving omnicomplete data for composer (i.e Laravel) projects although is not neccesary with ctags.
You can remove this package by deleting the Plugin from `.vimrc`, if not you will be asked to scan the composer classmaps on initially starting vim.

##Key maps
| Key | Function | Mode |
| --- | --- | --- |
| <kbd>CTRL</kbd>+<kbd>s</kbd> | Save | Normal |
| <kbd>CTRL</kbd>+<kbd>x</kbd> | Exit the current buffer | Normal |
| <kbd>CTRL</kbd>+<kbd>e</kbd> | Toggle the NERDTree | Normal |
| <kbd>v</kbd>,<kbd>s</kbd> | Open a vertical split | Normal |
| <kbd>s</kbd>,<kbd>p</kbd> | Open a horizontal split | Normal |
| <kbd>CTRL</kbd>+<kbd>w</kbd>,<kbd>CTRL</kbd>+<kbd>w</kbd> | Change active split | Normal |
| <kbd>CTRL</kbd>+<kbd>d</kbd> | Next buffer | Normal |
| <kbd>CTRL</kbd>+<kbd>a</kbd> | Previous buffer | Normal |
| <kbd>F5</kbd> | Bring up the Gundo history menu | Normal |
| <kbd>F2</kbd> | Toggle paste mode | Insert |
| `<leader>`,<kbd>d</kbd>,<kbd>b</kbd> | Add a PHP DocBlock at current line | Any |
| <kbd>TAB</kbd> | Open omnicomplete | Insert |
| <kbd>CTRL</kbd>+<kbd>e</kbd> (when omnicomplete open) | Close omnicomplete and return to first word | Insert |
| <kbd>CTRL</kbd>+<kbd>p</kbd> | Open CtrlP | Normal |
| <kbd>g</kbd>,<kbd>c</kbd>,<kbd>c</kbd> | Toggle line commented | Normal, visual | 
| <kbd>c</kbd>,<kbd>s</kbd> | Surround: Click [here](https://github.com/tpope/vim-surround) for further information | Normal, visual |
| `<leader>`,<kbd>r</kbd> | Open PHP refactoring tools | Visual mode |
##Snippets
Some blade snippets have been included in the `.vim/UltiSnips` directory. To use them type in the name of the snippet followed by 
<leader>,<kbd>s</kbd>,<kbd>n</kbd> in your Blade template. I.e to create a new form type `newform` then <kbd>\sn</kbd>. 
Run `:help UltiSnips` to get more information on snippets.

Snippets contain tabstops to allow you to easily edit information in them. To jump to the next tabstop hit <kbd>CTRL</kbd>+<kbd>d</kbd> and 
to go to the previous tabstop hit <kbd>CTRL</kbd>+<kbd>z</kbd>
##Configuration
###Leader
The leader key is set to `\` and is used in many key mappings. To change this add the line `let mapleader=` followed by the key of choice.
