## Git - Notes
### Alan T. Arnholt







Last compiled Sunday, March 16, 2014 - 14:46:55.

What is version control, and why should you use it?  Version control is a way to track files over time.  By using version control, you will be able to retrace your steps to
a previous working (read un-hosed) version of your files.  You may be using a form of version control now with files named like the following:

* YourNameCVJanuary2014.docx
* YourNameCVMarch2014.docx
* chapter1-012412.tex
* chapter2-032312.tex

You may even back up your files for major projects in many different places.  When working on book projects in the past, I would back up my files on three different 
local machines and two servers.  That works fine until you start using the files from one location and forget that you updated the files on another machine, and you are using an old version of a file for new updates.  Now you have new material on old files and may have overwritten several weeks of work.  Expletives follow, and you set to "un-hosing" your work which may take longer than it took to write the original document.  Is this a real scenario?  Yes, and the problem only grows exponentially when working with colleagues who all have access to the same files on a major project.

I now use version control, specifically Git, for virtually all of my work.  Notes for classes I am teaching have their own repositories (repos), and students and other interested parties can clone my repos.  If you have material that you would like to remain private, you can set up private repositories.  Thankfully, I have not lost a single file I could not recover since switching my work to Git.  

One last thought before we talk about actually installing and using Git.  You may be thinking, I have never lost a file because I back up all of my files on an external hardrive.  Great; however, suppose you lose your machine and external hard drive due to a catastrophic event.  Now what?  Well, if you are not using some form of version control, your work is most likely gone for good. If you were using version control, you just need to set up a new machine and continue your work where you left off.


### Downloading Git

Download and install the lastest version of [Git.](http://git-scm.com/downloads)

<img class=center src="./images/SGitDownload.png" height='480'/>

### Mac Users
Install the downloaded file by clicking on the downloaded `*.dmg` file then clicking on the `*.pkg` file. 

<img class=center src="./images/MacGitDownload.png" height='200'/>

If you get a message indicating the file is from an untrusted source, ignore the warning and click on the **Open** button.  If there is no option to **Open**, hold down the CTRL key, select `*.pkg` file, then choose *Open With -> Installer (default)*.

### Windows users

Once the download is complete, right click on the downloaded file to install it as an 
administrator.  Use the default options at each step of the installation if you are 
unsure of what you are doing.  When the installation arrives at the screen adjusting your 
PATH environment, click in the circle to the left of 
**Run Git from the Windows Command Prompt**.
You may need to add the path to where the `bash.exe` resides manually.  Run the 
following at the `R` prompt to make sure `R` knows where to find `bash.`  Note that the 
path below will be dependent on the operating system you are using.


```r
Sys.which("bash")
```

```
       bash 
"/bin/bash" 
```

If the output does not specify the path to `bash,` the path to `bash` is not properly configured.

To interact with Git, find the program named Git Bash.  Git Bash is the command line environment Windows uses to interact with Git.  Git Bash should be located in the Git directory within your Start Menu, provided you performed a default installation.


## Initial Setup

If you have never used Git before, you need to do some setup first.  Run the following
commands so that Git knows your name and email.  The commands are all issued in the
Terminal (Mac) or at the command prompt of Git Bash (Windows).  The Terminal 
application is usually found in `/applications/Utilities.` A quick way to open a 
**terminal** window is by clicking on the magnifying glass icon and typing *terminal* in spotlight.  

<img class=center src="./images/Spotlight.png" height='200'/>

### Mac Users
By clicking on the Terminal application, a Terminal window will open.

<img class=center src="./images/TerminalWindow.png" height='150'/>

### Windows Users
To open Git Bash, click on the *Windows icon -> Git -> Git Bash*.  The program is most likely located in the Git directory within your Start Menu (or the directory into which Git was installed).

<img class=center src="./images/WindowsProgramGitBash.png" height='400'/>

By clicking on the Git Bash icon, a window similar to the one below will open.

<img class=center src="./images/GitBashWindow.png" height='150'/>

### Run these commands


```bash
git config --global user.name "Your Name"
git config --global user.email "your_email@whatever.com"
git config --global color.ui true
```


If you do not want to type your username and password every time you work with a remote server, you will need to install the credential helper.  See the article [Set Up Git](https://help.github.com/articles/set-up-git#platform-all) for additional details on setting up the credential helper.

To confirm your username and email, type `git config --list` at the $ prompt.


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


From the `credential.helper` line of the previous output, one can see the 
`credential.helper` is being used.  Now that Git is set up on your computer, we provide instructions for setting up a remote repository on GitHub.

### What is GitHub?

"GitHub is a web-based hosting service for software development projects that use 
the Git revision control system. GitHub offers both paid plans for private 
repositories and free accounts for open source projects. The site was launched 
in 2008 by Tom Preston-Werner, Chris Wanstrath, and PJ Hyett."
[http://en.wikipedia.org/wiki/GitHub](http://en.wikipedia.org/wiki/GitHub)

Qualified faculty members can request free private accounts to use with their classes.
To request a discount, which actually pays the whole price for 10 private repositories 
for qualified faculty, click on the request a discount at 
[https://education.github.com](https://education.github.com).  A step-by-step guide 
for setting up your GitHub organization for classroom use can be found at 
[https://education.github.com/guide](https://education.github.com/guide).   Free private repositories for anyone can be created at 
[https://bitbucket.org](https://bitbucket.org).  Bitbucket, like GitHub, is a web 
based hosting service that uses the Git revision control system.

## Creating a GitHub Account

Point your browser to [https://github.com](https://github.com);
type a username in the `Pick a username` box (please use `firstlast`, for example my 
username is `alanarnholt`); enter your email (use your school email) in the 
`Your email` box; type in your password in the `Create a password` box. Then, 
click the `Sign up for GitHub` box, and you will have a GitHub account.  You should 
use the same name you used when you set up your `user.name` and `user.email` on your 
local machine.


### Creating a GitHub Repository

In order to push your local work to a remote repository, you will first need to create
the remote repository. Log in to your GitHub account; click the `New repository` button;
then, give your repository a name and optionally a description.  When you finish, click 
the `Create repository` button, and your GitHub repository will be created.  You should click in the box `Initialize this repository with a README` if you want GitHub to create a markdown README file.  
![AlansGitRepo](./images/CreateGitRepo.png)


This document is stored in the repository [https://github.com/alanarnholt/STT4870](https://github.com/alanarnholt/STT4870) in the folder [https://github.com/alanarnholt/STT4870/Git](https://github.com/alanarnholt/STT4870/Git).


## Local Repositories

Once you have your remote repository created on GitHub, you will need to create a local
copy of the remote repository on your computer so that you can make changes locally. 
It is possible to set up a local repository using the command line or using GUI (drop, drag, etc.) commands.  We start by first looking at typed commands.  Then, we examine a 
GUI to Git.   

Open either a Terminal (Mac) or Git Bash (Windows).  Create a directory on your computer where you will store your copy of the GitHub 
(remote) repository.


```bash
mkdir ~/TestProject
```


The tilde (~) refers to your home directory.  In other words, `~/TestProject`
will create a directory called `TestProject` in your home directory.  Navigate 
to the new directory by typing


```bash
cd ~/TestProject
```


Once you have a local directory with files you
would like to place under version control, use the `git init` command from your working
directory to track your files. 



```bash
git init
```


Now, we are ready to point our local repository to the remote repository on GitHub by typing


```bash
git remote add origin https://github.com/your-user-name/TestProject.git
```


The last line needs some explanation!  The `add` creates the *new remote*; the `origin` is the name for the remote; and the url is the path to the remote.


If you are working with a new repository and do not have an existing version on 
your computer, you need to "clone" the GitHub repo to your computer.  From the working directory of your local machine, type:


```bash
git clone https://github.com/your-user-name/TestProject.git
```


I keep my repositories in a folder called *git_repositories* that
is a subfolder of my *USERNAME* directory.   If you clone a remote repository 
to your machine, you will not need to initialize your directory.

### Forking  a Repo
Another common way to clone a repo is by first "forking" someone else's repo.   Forking a repo creates a remote (GitHub) copy of the forked repo.   To work on the forked repo, you first must clone the remote fork to your local  machine.  When a repository is cloned, it has a default remote called `origin` that points to your fork on GitHub, not the original repository from which it was forked.  This means that updates the orignal repo owner makes will not automatically be added to your forked repo.

To keep track of this repo, you need to add another remote named `upstream.`  This can be done by typing


```bash
git remote add upstream https://github.com/alanarnholt/STT4870.git
```


To pull in changes not present in your local repository without modifying your
files, type


```bash
git fetch upstream  
```


When you fetch the upstream repository,  the upstream branches are stored
in your local repository in a local branch named `upstream/master.`  Next, you need to merge the changes into your local branch to bring your local branch in sync with the upstream branch without losing any local changes.  Make sure you are on the master branch by typing `git checkout master.`  Then, enter `git merge upstream/master.`  Once your local branch is in sync with the upstream remote, you will want to push your local changes back to your forked repo on GitHub by typing `git push.` 

Another approach is to use


```bash
git pull upstream master
```


What is the difference?




## GUI approach with RStudio

One way to clone this repo using `RStudio` is  to click on File -> New Project 

![NewProject](./images/NewProject.png)

Click Version Control, and a new window such as the one below will appear where you will select Git.

![VersionControl](./images/VersionControl.png)

In the next window that appears, which is shown below, enter the URL for the repository you are cloning.  Enter a project name, and specify where you want the project to reside on your computer.  When you are finished, click the `Create Project` button; and you will have cloned a remote repository.

![ProjectVersionControl](./images/ProjectVersionControl.png)


To check the current status of your repository type:

```bash
git status
```

```
On branch master
Your branch is up-to-date with 'origin/master'.

nothing to commit, working directory clean
```

The `git status` shows us what files are not staged for a commit.  Before files can be
committed, they must be added to the staging area.  Files are added to the stating area
with the command `git add file_name.`  To add all files in the working directory, one
can use `git add .` (The command includes the period.)  Next, all files are added to the staging area, and a snapshot is 
taken of the commit with the message "staging all files."

```bash
git add .
git commit  -m "staging all files"
```

```
On branch master
Your branch is up-to-date with 'origin/master'.

nothing to commit, working directory clean
```


Check the status after the last commit.

```bash
git status
```

```
On branch master
Your branch is up-to-date with 'origin/master'.

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
Your branch is up-to-date with 'origin/master'.

nothing to commit, working directory clean
```

Show the last three commits with

```bash
git log  -3
```

```
commit 995bc3012ed275580d633e1890cd97d597d6d5c6
Author: Alan Arnholt <arnholtat@appstate.edu>
Date:   Sun Mar 16 12:35:30 2014 -0400

    Fix punctuation and spelling

commit c20aa670ad25fade85d262efe07fccc1ad21f3e0
Author: Alan Arnholt <arnholtat@appstate.edu>
Date:   Sun Mar 16 12:30:25 2014 -0400

    staging all files

commit 0a7fa5235cd2b94976f5be0d47fabbf35feb620e
Author: Alan Arnholt <arnholtat@appstate.edu>
Date:   Sun Mar 16 12:27:28 2014 -0400

    staging all files
```


That was ugly. Let us try some formatting.


```bash
git log --pretty=oneline -3
```

```
995bc3012ed275580d633e1890cd97d597d6d5c6 Fix punctuation and spelling
c20aa670ad25fade85d262efe07fccc1ad21f3e0 staging all files
0a7fa5235cd2b94976f5be0d47fabbf35feb620e staging all files
```


The previous output was too brief to suit me.  Let us try some further formatting.


```bash
git log --pretty=format:"%h %ad- %s [%an]" -3
```

```
995bc30 Sun Mar 16 12:35:30 2014 -0400- Fix punctuation and spelling [Alan Arnholt]
c20aa67 Sun Mar 16 12:30:25 2014 -0400- staging all files [Alan Arnholt]
0a7fa52 Sun Mar 16 12:27:28 2014 -0400- staging all files [Alan Arnholt]
```


Maybe even some statistics?


```bash
git log --pretty=format:"%h %ad- %s [%an]" -3 --stat
```

```
995bc30 Sun Mar 16 12:35:30 2014 -0400- Fix punctuation and spelling [Alan Arnholt]
 Git/GitOne.html | 49 +++++++++++++++++++++++++------------------------
 Git/GitOne.md   | 43 ++++++++++++++++++++++---------------------
 2 files changed, 47 insertions(+), 45 deletions(-)

c20aa67 Sun Mar 16 12:30:25 2014 -0400- staging all files [Alan Arnholt]
 Git/GitOne.Rmd  |   4 +-
 Git/GitOne.html | 117 +++++++++++++++++++++++++++++---------------------------
 Git/GitOne.md   | 111 +++++++++++++++++++++++++++--------------------------
 3 files changed, 119 insertions(+), 113 deletions(-)

0a7fa52 Sun Mar 16 12:27:28 2014 -0400- staging all files [Alan Arnholt]
 Git/GitOne.Rmd  | 71 ++++++++++++++++++++++++++++-----------------------------
 Git/GitOne.html | 43 +++++++++++++++++-----------------
 Git/GitOne.md   | 35 ++++++++++++++--------------
 3 files changed, 75 insertions(+), 74 deletions(-)
```


Now, just to show how cool this is, we will mix in a little `R.`


```r
library(ggplot2)
ggplot(data = CO2, aes(x = Type, y = uptake, fill = Type)) + 
  geom_boxplot() +
  facet_grid(Treatment~.) +
  theme_bw()
```

<img src="figure/Rgraph.png" title="plot of chunk Rgraph" alt="plot of chunk Rgraph" style="display: block; margin: auto;" />


I love graphs!  The following graph created with `ggplot2` uses Greek letters in
the facet panels.  

<img src="figure/ggplot2Graphs.png" title="plot of chunk ggplot2Graphs" alt="plot of chunk ggplot2Graphs" style="display: block; margin: auto;" />


### So you want to collaborate?

At this point, you have forked a repo and would like to contribute to
someone's project.  A great place to start is by reading [https://help.github.com/articles/using-pull-requests](https://help.github.com/articles/using-pull-requests).
