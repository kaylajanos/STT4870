## Git - Notes
### Alan T. Arnholt





Last compiled Monday, January 27, 2014 - 14:16:05..

Download and install the lastest version of [Git.](http://git-scm.com/downloads)






If you have never used git before, you need to do some setup first.  Run the following
commands so that git knows your name and email.  The commands are all issued in the
Terminal (MAC) or at the command prompt of Git Bash (Windows).  The Terminal 
application is usually found in `/applications/Utilities`.  To open Git Bash, click on the 
Windows icon -> ??? finish this in class.  The third line adds pretty command line colors.  



```bash
git config --global user.name "Your Name"
git config --global user.email "your_email@whatever.com"
git config --global color.ui true
```


If you do not want to type your username and password every time you work with a remote server, you will to install the credential helper.  See the article [Set Up Git](https://help.github.com/articles/set-up-git#platform-all) for additional details on setting up the credential helper.



### Creating a GitHub Account

Point your browser to [https://github.com](https://github.com),
type a username in the `Pick a username` box (please use `firstlast`, for example my username is `alanarnholt`), enter your email (use your school email) in the `Your email` box, type in your password in the `Create a password` box. Then, click the `Sign up for GitHub` box and you will have a GitHub account.


### Creating a GitHub Repository

In order to push your local work to a remote repository, you will first need to create
the remote repository. Log into your GitHub account, click the `New repository` button,
then give your repository a name and optionally a description.  When you finish, click 
the `Create repository` button and your GitHub repository will be created.  
![AlansGitRepo](./images/CreateGitRepo.png)


This document is stored in the repository [https://github.com/alanarnholt/STT4870](https://github.com/alanarnholt/STT4870) in the folder [https://github.com/alanarnholt/STT4870/Git](https://github.com/alanarnholt/STT4870/Git). 

## Local Repositories

It is possible to set up a local repository using GUI (drop, drag, etc.) commands or to
use the command line.  I keep my repositories in a folder called *git_repositories* that
is a subfolder of my *USERNAME* directory.  Once you have a local folder with files you
would like to place under version control, use the `git init` command from your working
directory to track your files.  If you clone a remote repository to your machine, you 
will not need to initialize your directory.  One way to clone this repo using `RStudio` is 
to click on File -> New Project 

![NewProject](./images/NewProject.png)

Click Version Control and a new window such as the one below will appear where you will select Git.

![VersionControl](./images/VersionControl.png)

In the next window that appears, which is shown below, enter the URL for the repository you are cloning.  Enter a project name and specify where you want the project to reside on your computer.  When you are finished, click the `Create Project` button and you will have cloned a remote repository.

![ProjectVersionControl](./images/ProjectVersionControl.png)


To check the current status of your repository type:

```bash
git status
```

```
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   GitOne.Rmd
#
no changes added to commit (use "git add" and/or "git commit -a")
```

The `git status` shows us what files are not staged for a commit.  Before files can be
committed, they must be added to the staging area.  Files are added to the stating area
with the command `git add file_name`.  To add all files in the working directory, one
can use `git add .`  Next all files are added to the staging area and a snapshot is 
taken of the commit with the message "staging all files".

```bash
git add .
git commit  -m "staging all files"
```

```
[master 6112724] staging all files
 1 file changed, 1 insertion(+), 1 deletion(-)
```


Check the status after the last commit.

```bash
git status
```

```
# On branch master
# Your branch is ahead of 'origin/master' by 1 commit.
#
nothing to commit (working directory clean)
```

Push changes to the remote repository. 

```bash
git push
```

See if there is anything left to do.

```bash
git status
```

```
# On branch master
nothing to commit (working directory clean)
```

Show the last three commits with

```bash
git log  -3
```

```
commit 6112724bfa87e9e1653aced641f7db61e83cb446
Author: Alan Arnholt <arnholtat@appstate.edu>
Date:   Mon Jan 27 14:16:05 2014 -0500

    staging all files

commit 32f0929b929ee664de54f1eea73ccf1e605ad700
Author: Alan Arnholt <arnholtat@appstate.edu>
Date:   Mon Jan 27 14:13:05 2014 -0500

    trying on windows

commit c81aca380cc96dcc233b455db3430cbd43669493
Author: Alan Arnholt <arnholtat@appstate.edu>
Date:   Mon Jan 27 12:11:46 2014 -0500

    git material
```


That was ugly. Let us try some formatting.


```bash
git log --pretty=oneline -3
```

```
6112724bfa87e9e1653aced641f7db61e83cb446 staging all files
32f0929b929ee664de54f1eea73ccf1e605ad700 trying on windows
c81aca380cc96dcc233b455db3430cbd43669493 git material
```


The previous output was to brief for my likes.  Let us try some further formatting.


```bash
git log --pretty=format:"%h %ad- %s [%an]" -3
```

```
6112724 Mon Jan 27 14:16:05 2014 -0500- staging all files [Alan Arnholt]
32f0929 Mon Jan 27 14:13:05 2014 -0500- trying on windows [Alan Arnholt]
c81aca3 Mon Jan 27 12:11:46 2014 -0500- git material [Alan Arnholt]
```


Maybe even some statistics?


```bash
git log --pretty=format:"%h %ad- %s [%an]" -3 --stat
```

```
6112724 Mon Jan 27 14:16:05 2014 -0500- staging all files [Alan Arnholt]
 Git/GitOne.Rmd | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

32f0929 Mon Jan 27 14:13:05 2014 -0500- trying on windows [Alan Arnholt]
 Git/GitOne.Rmd |   2 +-
 Git/GitOne.md  | 140 +--------------------------------------------------------
 2 files changed, 2 insertions(+), 140 deletions(-)

c81aca3 Mon Jan 27 12:11:46 2014 -0500- git material [Alan Arnholt]
 Git/GitOne.html       | 373 ++++++++++++++++++++++++++++++++++++++++++++++++++
 Git/GitOne.md         | 232 +++++++++++++++++++++++++++++++
 Git/figure/Rgraph.png | Bin 0 -> 9406 bytes
 3 files changed, 605 insertions(+)
```


Now, just to show how cool this is, we will mix in a little `R`.


```r
library(ggplot2)
ggplot(data = CO2, aes(x = Type, y = uptake)) + geom_boxplot()
```

<img src="figure/Rgraph.png" title="plot of chunk Rgraph" alt="plot of chunk Rgraph" style="display: block; margin: auto;" />

