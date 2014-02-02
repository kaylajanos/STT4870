## Git - Notes
### Alan T. Arnholt





Last compiled Sunday, February 02, 2014 - 11:00:51.

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
#   (use "git add/rm <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   GitOne.html
#	modified:   GitOne.md
#	deleted:    cache/ADD_37d613968d89bfc0fc573bd5f4d62239.RData
#	deleted:    cache/ADD_37d613968d89bfc0fc573bd5f4d62239.rdb
#	deleted:    cache/ADD_37d613968d89bfc0fc573bd5f4d62239.rdx
#	deleted:    cache/LOGP2_faf1a7fcf18137324c7c98647d730ea6.RData
#	deleted:    cache/LOGP2_faf1a7fcf18137324c7c98647d730ea6.rdb
#	deleted:    cache/LOGP2_faf1a7fcf18137324c7c98647d730ea6.rdx
#	deleted:    cache/LOGP3_ad807c34590b81f628e6cb6032102919.RData
#	deleted:    cache/LOGP3_ad807c34590b81f628e6cb6032102919.rdb
#	deleted:    cache/LOGP3_ad807c34590b81f628e6cb6032102919.rdx
#	deleted:    cache/LOGP_85b7cbcb21a72630e78bd3b750ea156f.RData
#	deleted:    cache/LOGP_85b7cbcb21a72630e78bd3b750ea156f.rdb
#	deleted:    cache/LOGP_85b7cbcb21a72630e78bd3b750ea156f.rdx
#	deleted:    cache/LOG_087011b0f8f69f16e2c2e5605086c615.RData
#	deleted:    cache/LOG_087011b0f8f69f16e2c2e5605086c615.rdb
#	deleted:    cache/LOG_087011b0f8f69f16e2c2e5605086c615.rdx
#	deleted:    cache/PUSH_4a4f909daa6525f7416b0e0df208f325.RData
#	deleted:    cache/PUSH_4a4f909daa6525f7416b0e0df208f325.rdb
#	deleted:    cache/PUSH_4a4f909daa6525f7416b0e0df208f325.rdx
#	deleted:    cache/Rgraph_8ff4435448e1c897d42aaa6cf87ae77b.RData
#	deleted:    cache/Rgraph_8ff4435448e1c897d42aaa6cf87ae77b.rdb
#	deleted:    cache/Rgraph_8ff4435448e1c897d42aaa6cf87ae77b.rdx
#	deleted:    cache/STATUS2_8ac7feaeff926fc5b62fe3cb6b50f859.RData
#	deleted:    cache/STATUS2_8ac7feaeff926fc5b62fe3cb6b50f859.rdb
#	deleted:    cache/STATUS2_8ac7feaeff926fc5b62fe3cb6b50f859.rdx
#	deleted:    cache/STATUS3_12105d35cf1bc9dd32a9a4e2704fe895.RData
#	deleted:    cache/STATUS3_12105d35cf1bc9dd32a9a4e2704fe895.rdb
#	deleted:    cache/STATUS3_12105d35cf1bc9dd32a9a4e2704fe895.rdx
#	deleted:    cache/STATUS_c084c907b84567e22073c1b7e27f7062.RData
#	deleted:    cache/STATUS_c084c907b84567e22073c1b7e27f7062.rdb
#	deleted:    cache/STATUS_c084c907b84567e22073c1b7e27f7062.rdx
#	modified:   cache/__packages
#	deleted:    figure/Rgraph.png
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
[master 3d5bf25] staging all files
 4 files changed, 3 insertions(+), 4 deletions(-)
 rewrite Git/cache/STATUS_c084c907b84567e22073c1b7e27f7062.RData (100%)
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
# Changes not staged for commit:
#   (use "git add/rm <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   cache/ADD_37d613968d89bfc0fc573bd5f4d62239.RData
#	deleted:    cache/LOGP2_faf1a7fcf18137324c7c98647d730ea6.RData
#	deleted:    cache/LOGP2_faf1a7fcf18137324c7c98647d730ea6.rdb
#	deleted:    cache/LOGP2_faf1a7fcf18137324c7c98647d730ea6.rdx
#	deleted:    cache/LOGP3_ad807c34590b81f628e6cb6032102919.RData
#	deleted:    cache/LOGP3_ad807c34590b81f628e6cb6032102919.rdb
#	deleted:    cache/LOGP3_ad807c34590b81f628e6cb6032102919.rdx
#	deleted:    cache/LOGP_85b7cbcb21a72630e78bd3b750ea156f.RData
#	deleted:    cache/LOGP_85b7cbcb21a72630e78bd3b750ea156f.rdb
#	deleted:    cache/LOGP_85b7cbcb21a72630e78bd3b750ea156f.rdx
#	deleted:    cache/LOG_087011b0f8f69f16e2c2e5605086c615.RData
#	deleted:    cache/LOG_087011b0f8f69f16e2c2e5605086c615.rdb
#	deleted:    cache/LOG_087011b0f8f69f16e2c2e5605086c615.rdx
#	deleted:    cache/PUSH_4a4f909daa6525f7416b0e0df208f325.RData
#	deleted:    cache/PUSH_4a4f909daa6525f7416b0e0df208f325.rdb
#	deleted:    cache/PUSH_4a4f909daa6525f7416b0e0df208f325.rdx
#	deleted:    cache/Rgraph_8ff4435448e1c897d42aaa6cf87ae77b.RData
#	deleted:    cache/Rgraph_8ff4435448e1c897d42aaa6cf87ae77b.rdb
#	deleted:    cache/Rgraph_8ff4435448e1c897d42aaa6cf87ae77b.rdx
#	deleted:    cache/STATUS2_8ac7feaeff926fc5b62fe3cb6b50f859.RData
#	deleted:    cache/STATUS2_8ac7feaeff926fc5b62fe3cb6b50f859.rdb
#	deleted:    cache/STATUS2_8ac7feaeff926fc5b62fe3cb6b50f859.rdx
#	deleted:    cache/STATUS3_12105d35cf1bc9dd32a9a4e2704fe895.RData
#	deleted:    cache/STATUS3_12105d35cf1bc9dd32a9a4e2704fe895.rdb
#	deleted:    cache/STATUS3_12105d35cf1bc9dd32a9a4e2704fe895.rdx
#	deleted:    figure/Rgraph.png
#
no changes added to commit (use "git add" and/or "git commit -a")
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
# Changes not staged for commit:
#   (use "git add/rm <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   cache/ADD_37d613968d89bfc0fc573bd5f4d62239.RData
#	deleted:    cache/LOGP2_faf1a7fcf18137324c7c98647d730ea6.RData
#	deleted:    cache/LOGP2_faf1a7fcf18137324c7c98647d730ea6.rdb
#	deleted:    cache/LOGP2_faf1a7fcf18137324c7c98647d730ea6.rdx
#	deleted:    cache/LOGP3_ad807c34590b81f628e6cb6032102919.RData
#	deleted:    cache/LOGP3_ad807c34590b81f628e6cb6032102919.rdb
#	deleted:    cache/LOGP3_ad807c34590b81f628e6cb6032102919.rdx
#	deleted:    cache/LOGP_85b7cbcb21a72630e78bd3b750ea156f.RData
#	deleted:    cache/LOGP_85b7cbcb21a72630e78bd3b750ea156f.rdb
#	deleted:    cache/LOGP_85b7cbcb21a72630e78bd3b750ea156f.rdx
#	deleted:    cache/LOG_087011b0f8f69f16e2c2e5605086c615.RData
#	deleted:    cache/LOG_087011b0f8f69f16e2c2e5605086c615.rdb
#	deleted:    cache/LOG_087011b0f8f69f16e2c2e5605086c615.rdx
#	deleted:    cache/Rgraph_8ff4435448e1c897d42aaa6cf87ae77b.RData
#	deleted:    cache/Rgraph_8ff4435448e1c897d42aaa6cf87ae77b.rdb
#	deleted:    cache/Rgraph_8ff4435448e1c897d42aaa6cf87ae77b.rdx
#	modified:   cache/STATUS2_8ac7feaeff926fc5b62fe3cb6b50f859.RData
#	deleted:    cache/STATUS3_12105d35cf1bc9dd32a9a4e2704fe895.RData
#	deleted:    cache/STATUS3_12105d35cf1bc9dd32a9a4e2704fe895.rdb
#	deleted:    cache/STATUS3_12105d35cf1bc9dd32a9a4e2704fe895.rdx
#	deleted:    figure/Rgraph.png
#
no changes added to commit (use "git add" and/or "git commit -a")
```

Show the last three commits with

```bash
git log  -3
```

```
commit 3d5bf25b532410058b38ccdb85afa31d2e880187
Author: Alan Arnholt <arnholtat@appstate.edu>
Date:   Sun Feb 2 11:00:51 2014 -0500

    staging all files

commit c5ae08f2243ff819da31165c4e65479397908084
Author: Alan Arnholt <arnholtat@appstate.edu>
Date:   Sun Feb 2 10:57:46 2014 -0500

    update time stamp

commit f621e528e029803fa0da13f337897d3e1915979b
Author: Alan Arnholt <arnholtat@appstate.edu>
Date:   Sun Feb 2 10:42:19 2014 -0500

    update time stamp is all
```


That was ugly. Let us try some formatting.


```bash
git log --pretty=oneline -3
```

```
3d5bf25b532410058b38ccdb85afa31d2e880187 staging all files
c5ae08f2243ff819da31165c4e65479397908084 update time stamp
f621e528e029803fa0da13f337897d3e1915979b update time stamp is all
```


The previous output was to brief for my likes.  Let us try some further formatting.


```bash
git log --pretty=format:"%h %ad- %s [%an]" -3
```

```
3d5bf25 Sun Feb 2 11:00:51 2014 -0500- staging all files [Alan Arnholt]
c5ae08f Sun Feb 2 10:57:46 2014 -0500- update time stamp [Alan Arnholt]
f621e52 Sun Feb 2 10:42:19 2014 -0500- update time stamp is all [Alan Arnholt]
```


Maybe even some statistics?


```bash
git log --pretty=format:"%h %ad- %s [%an]" -3 --stat
```

```
3d5bf25 Sun Feb 2 11:00:51 2014 -0500- staging all files [Alan Arnholt]
 Git/GitOne.html                                         |   4 ++--
 Git/GitOne.md                                           |   2 +-
 Git/cache/STATUS_c084c907b84567e22073c1b7e27f7062.RData | Bin 336 -> 699 bytes
 Git/cache/__packages                                    |   1 -
 4 files changed, 3 insertions(+), 4 deletions(-)

c5ae08f Sun Feb 2 10:57:46 2014 -0500- update time stamp [Alan Arnholt]
 Git/GitOne.html | 2 +-
 Git/GitOne.md   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

f621e52 Sun Feb 2 10:42:19 2014 -0500- update time stamp is all [Alan Arnholt]
 Git/GitOne.html | 2 +-
 Git/GitOne.md   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
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
