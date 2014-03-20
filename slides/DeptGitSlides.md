Version Control (Git)
========================================================
author: Alan Arnholt
date: 3/21/14

What is version control?
========================================================
* Definition --- Revision control, also known as version control and source control (and an aspect of software configuration management), is the management of changes to documents, computer programs, large web sites, and other collections of information. Changes are usually identified by a number or letter code, termed the "revision number", "revision level", or simply "revision". For example, an initial set of files is "revision 1". When the first change is made, the resulting set is "revision 2", and so on. Each revision is associated with a timestamp and the person making the change. Revisions can be compared, restored, and with some types of files, merged.

Why should you use version control?
======================================================

* YourNameCVFeb2014.docx

* YourNameCVMar2004.docx

* chapter1-021309.tex

* chapter1-032311.tex

* chapter1-031409.tex
 

Explain...


Goals for Today
========================================================

* Install Git
* Create a GitHub account
* Fork a GitHub repository
* Configure Git settings
* Use `push` and `pull`


Install Git
========================================================
If your machine does not have a recent version of Git,
point your browser to [http://gitscm.com](http://gitscm.com) and install the latest binary for your operating system.


Create a GitHub account
========================================================

* Use Mozilla in Walker 209B (Safari is very dated and does not work well with GitHub)

* Point your browser to [https://github.com](https://github.com)

* Click the green Sign up for GitHub button

* For a username, I suggest `firstlast`

* Use your school email so you can request private repositories later

* Click the green `Create an account` button



Git Configurations
========================================================


```bash
git config --global user.name "Your Name"
git config --global user.email "Joe@appstate.edu"
```



My Git Configurations
========================================================


```bash
git config --list  # shows your configuration
```

```
user.name=Alan Arnholt
user.email=arnholtat@appstate.edu
credential.helper=osxkeychain
color.ui=true
core.repositoryformatversion=0
core.filemode=true
core.bare=false
core.logallrefupdates=true
core.ignorecase=true
core.precomposeunicode=false
remote.origin.url=https://github.com/alanarnholt/STT4870.git
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
branch.master.remote=origin
branch.master.merge=refs/heads/master
```

