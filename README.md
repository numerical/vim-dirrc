#'dirrc' Plugin

This is a simple plugin that loads directory tailored '.vimrc' files

##Variables

###g:dirrc\_resource\_name
Defines the name of the file to look in local directories
Default: _'.vimrc'_

###g:dirrc\_security
Defines the security level of dircc.
Possible values are 1 if you would like dircc to ask before it loads a file
and 0 for automatic loading
Default: 1

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
knowing it. (hattip: daniel@binaryparadox.com)

