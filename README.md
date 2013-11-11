to install and set up as I have issue:

```
[ you @ your_machine ~ ]$ git init
[ you @ your_machine ~ ]$ git remote add origin https://github.com/neilus/dotfiles.git
[ you @ your_machine ~ ]$ git pull --all -f # it will complain for .bashrc, and
                                  # maybe other files which you already have
                                  # back them up, and erase them from your home
[ you @ your_machine ~ ]$ git submodule update --init
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

If I'm missing something please send me a bug report at this github repository:
https://github.com/neilus/dotfiles/issues

All this brought to you under the terms of the M.I.T. Licence

