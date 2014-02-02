## Git - Notes
### Alan T. Arnholt





Last compiled Sunday, February 02, 2014 - 10:40:10.

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
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	cache/
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
[master ccded6e] staging all files
 8 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 Git/cache/GITsetup_1e85974789856654fd6170253d9fcbe2.RData
 create mode 100644 Git/cache/GITsetup_1e85974789856654fd6170253d9fcbe2.rdb
 create mode 100644 Git/cache/GITsetup_1e85974789856654fd6170253d9fcbe2.rdx
 create mode 100644 Git/cache/STATUS_c084c907b84567e22073c1b7e27f7062.RData
 create mode 100644 Git/cache/STATUS_c084c907b84567e22073c1b7e27f7062.rdb
 create mode 100644 Git/cache/STATUS_c084c907b84567e22073c1b7e27f7062.rdx
 create mode 100644 Git/cache/__packages
```


Check the status after the last commit.

```bash
git status
```

```
# On branch master
# Your branch is ahead of 'origin/master' by 1 commit.
#   (use "git push" to publish your local commits)
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	cache/ADD_37d613968d89bfc0fc573bd5f4d62239.RData
#	cache/ADD_37d613968d89bfc0fc573bd5f4d62239.rdb
#	cache/ADD_37d613968d89bfc0fc573bd5f4d62239.rdx
nothing added to commit but untracked files present (use "git add" to track)
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
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	cache/ADD_37d613968d89bfc0fc573bd5f4d62239.RData
#	cache/ADD_37d613968d89bfc0fc573bd5f4d62239.rdb
#	cache/ADD_37d613968d89bfc0fc573bd5f4d62239.rdx
#	cache/PUSH_4a4f909daa6525f7416b0e0df208f325.RData
#	cache/PUSH_4a4f909daa6525f7416b0e0df208f325.rdb
#	cache/PUSH_4a4f909daa6525f7416b0e0df208f325.rdx
#	cache/STATUS2_8ac7feaeff926fc5b62fe3cb6b50f859.RData
#	cache/STATUS2_8ac7feaeff926fc5b62fe3cb6b50f859.rdb
#	cache/STATUS2_8ac7feaeff926fc5b62fe3cb6b50f859.rdx
nothing added to commit but untracked files present (use "git add" to track)
```

Show the last three commits with

```bash
git log  -3
```

```
commit ccded6e86105504b25f7a67143f7cf998ef6a4bf
Author: Alan Arnholt <arnholtat@appstate.edu>
Date:   Sun Feb 2 07:15:26 2014 -0500

    staging all files

commit 4ce278f591a4b9cc2118b681d0d38c9d2d332cb9
Author: Alan Arnholt <arnholtat@appstate.edu>
Date:   Mon Jan 27 17:01:46 2014 -0500

    Brian's fix

commit 2709296611a0c634f5e3146f25c4d080c59cac8d
Merge: c0a7e73 477f655
Author: Alan Arnholt <arnholtat@appstate.edu>
Date:   Mon Jan 27 16:59:57 2014 -0500

    update?
    
    Merge branch 'master' of https://github.com/alanarnholt/STT4870
    
    Conflicts:
    	README.md
```


That was ugly. Let us try some formatting.


```bash
git log --pretty=oneline -3
```

```
ccded6e86105504b25f7a67143f7cf998ef6a4bf staging all files
4ce278f591a4b9cc2118b681d0d38c9d2d332cb9 Brian's fix
2709296611a0c634f5e3146f25c4d080c59cac8d update?
```


The previous output was to brief for my likes.  Let us try some further formatting.


```bash
git log --pretty=format:"%h %ad- %s [%an]" -3
```

```
ccded6e Sun Feb 2 07:15:26 2014 -0500- staging all files [Alan Arnholt]
4ce278f Mon Jan 27 17:01:46 2014 -0500- Brian's fix [Alan Arnholt]
2709296 Mon Jan 27 16:59:57 2014 -0500- update? [Alan Arnholt]
```


Maybe even some statistics?


```bash
git log --pretty=format:"%h %ad- %s [%an]" -3 --stat
```

```
ccded6e Sun Feb 2 07:15:26 2014 -0500- staging all files [Alan Arnholt]
 Git/GitOne.Rmd                                            |   2 +-
 Git/cache/GITsetup_1e85974789856654fd6170253d9fcbe2.RData | Bin 0 -> 199 bytes
 Git/cache/GITsetup_1e85974789856654fd6170253d9fcbe2.rdb   |   0
 Git/cache/GITsetup_1e85974789856654fd6170253d9fcbe2.rdx   | Bin 0 -> 113 bytes
 Git/cache/STATUS_c084c907b84567e22073c1b7e27f7062.RData   | Bin 0 -> 336 bytes
 Git/cache/STATUS_c084c907b84567e22073c1b7e27f7062.rdb     |   0
 Git/cache/STATUS_c084c907b84567e22073c1b7e27f7062.rdx     | Bin 0 -> 113 bytes
 Git/cache/__packages                                      |   2 ++
 8 files changed, 3 insertions(+), 1 deletion(-)

4ce278f Mon Jan 27 17:01:46 2014 -0500- Brian's fix [Alan Arnholt]
 README.md | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

2709296 Mon Jan 27 16:59:57 2014 -0500- update? [Alan Arnholt]
```


Now, just to show how cool this is, we will mix in a little `R`.


```r
library(ggplot2)
ggplot(data = CO2, aes(x = Type, y = uptake, fill = Type)) + geom_boxplot() + 
    facet_grid(Treatment ~ .) + theme_bw()
```

<img src="figure/Rgraph.png" title="plot of chunk Rgraph" alt="plot of chunk Rgraph" style="display: block; margin: auto;" />


### So you want to collaborate?

At this point, you have forked a repo and would like to contribute to
someone's project.  A great place to start is by reading [https://help.github.com/articles/using-pull-requests](https://help.github.com/articles/using-pull-requests).
