Version Control (Git)
========================================================
author: Alan Arnholt
date: 3/21/14

Goals for Today
========================================================

* Install Git
* Configure Git settings
* Create a GitHub account
* Fork a GitHub repository
* Use `push` and `pull`


Install Git
========================================================
If your machine does not have a recent version of Git,
point your browser to [http://gitscm.com](http://gitscm.com) and install the latest binary for your operating system.

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

