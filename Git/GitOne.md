## Git - Notes
### Alan T. Arnholt







Last compiled Friday, March 14, 2014 - 11:19:58.

What is version control and why should you use it?  Version control is a way to track files over time.  By using version control you will be able to retrace your steps to
a previous working (read un-hosed) version of your files.  You may be using a form of version control now with files named like the following:

* YourNameCVJanuary2014.docx
* YourNameCVMarch2014.docx
* chapter1-012412.tex
* chapter2-032312.tex

You may even back up your files for major projects in many different places.  When working on book projects in the past, I would back up my files on three different 
local machines and two servers.  That works fine until you start using the files from one location and forget that you updated the files on another machine and you are using an old version of a file for new updates.  Now you have new material on old files and may have overwritten several weeks of work.  Expletives follow and you set to "un-hosing" your work which may take longer than it took to write the original document.  Is this a real scenario?  Yes, and the problem only grows exponentially when working with colleagues who all have access to the same files on a major project.

I now use version control, specifically Git for virtually all of my work.  Notes for classes I am teaching have their own repositories (repos) and students and other interested parties can clone my repos.  If you have material that you would like to remain private, you can set up private repositories.  Thankfully, I have not lost a single file I could not recover since switching my work to Git.  

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
unsure what you are doing.  When the installation arrives at the screen adjusting your 
PATH environment, click in the circle to the left of 
**Run Git from the Windows Command Prompt**.
You may need to manually add the path to where the `bash.exe` resides.  Run the 
following at the `R` prompt to make sure `R` knows where to find `bash`.  Note that the 
path below will be dependent on the operating system you are using.


```r
Sys.which("bash")
```

```
       bash 
"/bin/bash" 
```

If the output does not specify the path to `bash`, the path to `bash` is not properly configured.

To interact with Git, find the program named Git Bash.  Git Bash is the command line environment Windows uses to interact with Git.  Git Bash should be located in the Git directory within your Start Menu provided you performed a default installation.


## Initial Setup

If you have never used git before, you need to do some setup first.  Run the following
commands so that Git knows your name and email.  The commands are all issued in the
Terminal (Mac) or at the command prompt of Git Bash (Windows).  The Terminal 
application is usually found in `/applications/Utilities`. A quick way to open a 
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


If you do not want to type your username and password every time you work with a remote server, you will to install the credential helper.  See the article [Set Up Git](https://help.github.com/articles/set-up-git#platform-all) for additional details on setting up the credential helper.

To confirm your username and email, type `git config --list` at the $ prompt.


```bash
git config --list
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


From the third line of the previous output, one can see the 
`credential.helper` is being used.  Now that Git is set up on your computer, we provide instructions for setting up a remote repository on GitHub.

### What is GitHub?

"GitHub is a web-based hosting service for software development projects that use 
the Git revision control system. GitHub offers both paid plans for private 
repositories, and free accounts for open source projects. The site was launched 
in 2008 by Tom Preston-Werner, Chris Wanstrath, and PJ Hyett."
[http://en.wikipedia.org/wiki/GitHub](http://en.wikipedia.org/wiki/GitHub)

Qualified faculty members can request free private accounts to use with their classes.
To request a discount, which actually pays the whole price for 10 private repositories 
for qualified faculty, click on the request a discount at 
[https://education.github.com](https://education.github.com).  A step-by-step guide 
for setting up your GitHub organization for classroom use can be found at 
[https://education.github.com/guide](https://education.github.com/guide).  
Free private repositories for anyone can be created at 
[https://bitbucket.org](https://bitbucket.org).  Bitbucket, like GitHub, is a web 
based hosting service that uses the Git revision control system.

## Creating a GitHub Account

Point your browser to [https://github.com](https://github.com),
type a username in the `Pick a username` box (please use `firstlast`, for example my 
username is `alanarnholt`), enter your email (use your school email) in the 
`Your email` box, type in your password in the `Create a password` box. Then, 
click the `Sign up for GitHub` box and you will have a GitHub account.  You should 
use the same name you used when you set up your `user.name` and `user.email` on your 
local machine.


### Creating a GitHub Repository

In order to push your local work to a remote repository, you will first need to create
the remote repository. Log in to your GitHub account, click the `New repository` button,
then give your repository a name and optionally a description.  When you finish, click 
the `Create repository` button, and your GitHub repository will be created.  You should click in the box `Initialize this repository with a README` if you want GitHub to create a markdown README file.  
![AlansGitRepo](./images/CreateGitRepo.png)


This document is stored in the repository [https://github.com/alanarnholt/STT4870](https://github.com/alanarnholt/STT4870) in the folder [https://github.com/alanarnholt/STT4870/Git](https://github.com/alanarnholt/STT4870/Git).


## Local Repositories

Once you have your remote repository created on GitHub, you will need to create a local
copy of the remote repository on your computer so that you can make changes locally. 
It is possible to set up a local repository using the command line or using GUI (drop, drag, etc.) commands.  We will start by first looking at typed command then looking at a GUI interface for Git.   

Open either a Terminal (Mac) or Git Bash (Windows).  
Create a directory on your computer where you will store your copy of the GitHub 
(remote) repository.


```bash
mkdir ~/PathToYourLocalRepo
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


Now we are ready to point our local repository to the remote repository on Github by typing


```bash
git remote add origin https://github.com/your-user-name/TestProject.git
```























