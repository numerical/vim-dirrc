#'dirrc' Plugin

This is a simple plugin that loads directory tailored '.vimrc' files

##Example

If you open a file in ~/projs/someproj/src/
dirrc will load in this order:
* ~/projs/.vimrc
* ~/projs/someproj/.vimrc
* ~/projs/someproj/src/.vimrc

Assuming of course they exist

##Warning

If you install this plugin make sure you know where all .vimrc files come from
An attacker could theoretically cause you to run shell commands without you
knowing it. (hattip: Dan)
