to install and set up as I have issue:

```
[ you @ your_machine ~ ]$ git init
[ you @ your_machine ~ ]$ git remote add origin https://github.com/neilus/dotfiles.git
[ you @ your_machine ~ ]$ mv -f .bash_profile .bash_profile-bak
[ you @ your_machine ~ ]$ mv -f .bashrc .bashrc-bak
[ you @ your_machine ~ ]$ mv -f .vimrc .vimrc-bak
[ you @ your_machine ~ ]$ mv -f .emacs .emacs-bak
[ you @ your_machine ~ ]$ mv -f .git-completion.sh .git-completion.sh-bak
[ you @ your_machine ~ ]$ mv -f .git-prompt .git-prompt-bak
[ you @ your_machine ~ ]$ mv -f .gitconfig .gitconfig-bak
[ you @ your_machine ~ ]$ mv -f .bash_profile .bash_profile-bak
[ you @ your_machine ~ ]$ git pull --all -f # it will complain for .bashrc, and
[ you @ your_machine ~ ]$ git checkout master  # maybe other files which you already
                          # have back them up, and erase them from your home
[ you @ your_machine ~ ]$ git submodule update --init
```
After that you should set up git, especially to overwrite my user.name and
user.email settings :). To do so issue the following commands with your
settings:

```
git config --global user.name "Your-First-Name Lastname"
git config --global user.email "youraddress@yourdomain.com
```

According to this setup you need to have gvim installed for proper copy/paste
and mouse cursor handling. If you just want to ignore this, then you might
comment out the vim alias in the .bashrc file.

So at this point you might start vim to install the additional
plugins:
```
[ you @ your_machine ~ ]$  vim -c BundleInstall!
```
when completed, exit vim and do the following to have semantic lexer for C-ish
languages. Note that you also have to have *clang, llvm, python 2.7 libraries,
mono-xbuild  and cmake* installed:

```
[ you @ your_machine ~ ]$ cd ~/.vim/bundle/YouCompleteMe/
[ you @ your_machine YouCompleteMe ]$ ./install.sh --clang-completer
--omnisharp-completer
```

## Cloud9
setting up cloud 9 you should have node.js, npm and libxml2-dev installed.
If you have packagekit-tools installed it should look something like this:

```
[ you @ your_machine ~ ]$ cd .local/cloud9
[ you @ your_machine cloud9 ]$ npm install
[ you @ your_machine ~ ]$ cd
[ you @ your_machine ~ ]$ cloud9.sh -w <workspace directory>
```
Where the workspace directory is the directory where you have your files you
want to edit.

For more information about the Cloud9 IDE goto https://github.com/ajaxorg/cloud9

If I'm missing something please send me a bug report at this github repository:
https://github.com/neilus/dotfiles/issues

All this brought to you under the terms of the M.I.T. Licence

