## Git - Notes
### Alan T. Arnholt







Last compiled Tuesday, February 04, 2014 - 8:45:22 PM.

Download and install the lastest version of [Git.](http://git-scm.com/downloads)

<img class=center src="./images/GitDownload.png" height='480'/>

## Mac Users
Install the downloaded file by clicking on the downloaded `*.dmg` file then clicking on the `*.pkg` file. 

<img class=center src="./images/MacGitDownload.png" height='200'/>

If you get a message indicating the file is from an untrusted source, ignore the warning and click on the **Open** button.  If there is no option to **Open**, hold down the CTRL key, select `*.pkg` file, then choose *Open With -> Installer (default)*.

## Windows users

Once the download is complete, right click on the downloaded file to install it as an 
administrator.  Use the default options at each step of the installation if you are unsure 
what you are doing.  When the installation arrives at the screen adjusting your PATH 
environment, click in the circle to the left of **Run Git from the Windows Command Prompt**.
You may need to manually add the path to where the `bash.exe` resides.  Run the 
following at the `R` prompt to make sure `R` knows where to find `bash`.


```r
Sys.which("bash")
```

```
                              bash 
"C:\\PROGRA~2\\Git\\bin\\bash.exe" 
```

If the output does not specify the path to `bash`, the path to `bash` is not properly configured.


## Initial Setup

If you have never used git before, you need to do some setup first.  Run the following
commands so that git knows your name and email.  The commands are all issued in the
Terminal (Mac) or at the command prompt of Git Bash (Windows).  The Terminal 
application is usually found in `/applications/Utilities`. A quick way to open a 
**terminal** window is by clicking on the magnifying glass icon and typing *terminal* in spotlight.  

<img class=center src="./images/Spotlight.png" height='200'/>

By clicking on the Terminal application, a Terminal window will open.

<img class=center src="./images/TerminalWindow.png" height='150'/>

To open Git Bash, click on the *Windows icon -> Git -> Git Bash*.  The program is most likely located in the Git directory within your Start Menu (or the directory into which Git was installed).

<img class=center src="./images/WindowsProgramGitBash.png" height='400'/>

By clicking on the Git Bash icon, a window similar to the one below will open.

<img class=center src="./images/GitBashWindow.png" height='150'/>

## Run these commands


```bash
git config --global user.name "Your Name"
git config --global user.email "your_email@whatever.com"
git config --global color.ui true
```


If you do not want to type your username and password every time you work with a remote server, you will to install the credential helper.  See the article [Set Up Git](https://help.github.com/articles/set-up-git#platform-all) for additional details on setting up the credential helper.

To confirm your username and email, type `git config --list` at the $ prompt.


```bash
git config --list
```

```
core.symlinks=false
core.autocrlf=true
color.diff=auto
color.status=auto
color.branch=auto
color.interactive=true
pack.packsizelimit=2g
help.format=html
http.sslcainfo=/bin/curl-ca-bundle.crt
sendemail.smtpserver=/bin/msmtp.exe
diff.astextplain.textconv=astextplain
rebase.autosquash=true
user.name=Alan Arnholt
user.email=arnholtat@appstate.edu
core.repositoryformatversion=0
core.filemode=false
core.bare=false
core.logallrefupdates=true
core.symlinks=false
core.ignorecase=true
core.hidedotfiles=dotGitOnly
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
remote.origin.url=https://github.com/alanarnholt/STT4870.git
branch.master.remote=origin
branch.master.merge=refs/heads/master
```


From the third line of the previous output, one can see the `credential.helper` is 
being used (when I run this with OSX, but not from home.) 

### Creating a GitHub Account

Point your browser to [https://github.com](https://github.com),
type a username in the `Pick a username` box (please use `firstlast`, for example my username is `alanarnholt`), enter your email (use your school email) in the `Your email` box, type in your password in the `Create a password` box. Then, click the `Sign up for GitHub` box and you will have a GitHub account.


### Creating a GitHub Repository

In order to push your local work to a remote repository, you will first need to create
the remote repository. Log in to your GitHub account, click the `New repository` button,
then give your repository a name and optionally a description.  When you finish, click 
the `Create repository` button, and your GitHub repository will be created.  
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
On branch master
Your branch is ahead of 'origin/master' by 2 commits.
  (use "git push" to publish your local commits)

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   GitOne.Rmd
	modified:   GitOne.html
	modified:   GitOne.md
	modified:   figure/ggplot2Graphs.png

no changes added to commit (use "git add" and/or "git commit -a")
```

The `git status` shows us what files are not staged for a commit.  Before files can be
committed, they must be added to the staging area.  Files are added to the stating area
with the command `git add file_name`.  To add all files in the working directory, one
can use `git add .`  Next, all files are added to the staging area, and a snapshot is 
taken of the commit with the message "staging all files."

```bash
git add .
git commit  -m "staging all files"
```

```
[master 9f34531] staging all files
 4 files changed, 85 insertions(+), 45 deletions(-)
 rewrite Git/figure/ggplot2Graphs.png (99%)
```


Check the status after the last commit.

```bash
git status
```

```
On branch master
Your branch is ahead of 'origin/master' by 3 commits.
  (use "git push" to publish your local commits)

nothing to commit, working directory clean
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
On branch master
Your branch is ahead of 'origin/master' by 3 commits.
  (use "git push" to publish your local commits)

nothing to commit, working directory clean
```

Show the last three commits with

```bash
git log  -3
```

```
commit 9f345316fb7a42140f106cb28dcc3ff5f6843776
Author: Alan Arnholt <arnholtat@appstate.edu>
Date:   Tue Feb 4 20:45:22 2014 -0500

    staging all files

commit 9c783ea910108bbbbad5d379c98cde558e19bf4e
Author: Alan Arnholt <arnholtat@appstate.edu>
Date:   Tue Feb 4 20:43:45 2014 -0500

    staging all files

commit 45a14d5cec5e7dd77b9f3a06eb6382c35689c5f0
Author: Alan Arnholt <arnholtat@appstate.edu>
Date:   Tue Feb 4 20:43:11 2014 -0500

    staging all files
```


That was ugly. Let us try some formatting.


```bash
git log --pretty=oneline -3
```

```
9f345316fb7a42140f106cb28dcc3ff5f6843776 staging all files
9c783ea910108bbbbad5d379c98cde558e19bf4e staging all files
45a14d5cec5e7dd77b9f3a06eb6382c35689c5f0 staging all files
```


The previous output was to brief to suit me.  Let us try some further formatting.


```bash
git log --pretty=format:"%h %ad- %s [%an]" -3
```

```
9f34531 Tue Feb 4 20:45:22 2014 -0500- staging all files [Alan Arnholt]
9c783ea Tue Feb 4 20:43:45 2014 -0500- staging all files [Alan Arnholt]
45a14d5 Tue Feb 4 20:43:11 2014 -0500- staging all files [Alan Arnholt]
```


Maybe even some statistics?


```bash
git log --pretty=format:"%h %ad- %s [%an]" -3 --stat
```

```
9f34531 Tue Feb 4 20:45:22 2014 -0500- staging all files [Alan Arnholt]
 Git/GitOne.Rmd               |   4 +--
 Git/GitOne.html              |  68 ++++++++++++++++++++++++++++---------------
 Git/GitOne.md                |  58 ++++++++++++++++++++++++------------
 Git/figure/ggplot2Graphs.png | Bin 6492 -> 6426 bytes
 4 files changed, 85 insertions(+), 45 deletions(-)

9c783ea Tue Feb 4 20:43:45 2014 -0500- staging all files [Alan Arnholt]
 Git/GitOne.Rmd                                     |   2 +-
 Git/GitOne.html                                    |  79 +++++++++++----------
 Git/GitOne.md                                      |  72 +++++++++++--------
 ...ashCheck_3a4552886a749e14bd443de33a754ec2.RData | Bin 0 -> 176 bytes
 .../BashCheck_3a4552886a749e14bd443de33a754ec2.rdb |   0
 .../BashCheck_3a4552886a749e14bd443de33a754ec2.rdx | Bin 0 -> 113 bytes
 Git/figure/ggplot2Graphs.png                       | Bin 6426 -> 6492 bytes
 7 files changed, 85 insertions(+), 68 deletions(-)

45a14d5 Tue Feb 4 20:43:11 2014 -0500- staging all files [Alan Arnholt]
 Git/GitOne.Rmd | 7 +++++++
 1 file changed, 7 insertions(+)
```


Now, just to show how cool this is, we will mix in a little `R`.


```r
library(ggplot2)
ggplot(data = CO2, aes(x = Type, y = uptake, fill = Type)) + geom_boxplot() + 
    facet_grid(Treatment ~ .) + theme_bw()
```

<img src="figure/Rgraph.png" title="plot of chunk Rgraph" alt="plot of chunk Rgraph" style="display: block; margin: auto;" />


I love graphs!  The following graph created with `ggplot2` uses Greek letters in
the facet panels.  

<img src="figure/ggplot2Graphs.png" title="plot of chunk ggplot2Graphs" alt="plot of chunk ggplot2Graphs" style="display: block; margin: auto;" />


### So you want to collaborate?

At this point, you have forked a repo and would like to contribute to
someone's project.  A great place to start is by reading [https://help.github.com/articles/using-pull-requests](https://help.github.com/articles/using-pull-requests).
