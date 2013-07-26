to install and set up as I have issue:

```
#!bash
[ you @ your_machine ~ ]$ git init
[ you @ your_machine ~ ]$ git remote add origin git@github.com:neilus/dotfiles.git
[ you @ your_machine ~ ]$ git stash
[ you @ your_machine ~ ]$ git pull --all
[ you @ your_machine ~ ]$ git submodule init
[ you @ your_machine ~ ]$ git submodule update
```

If you don't have a github account set up at your_machine, then use the https
url instead of the ssh, so the command will be like so:
```
#!bash
[ you @ your_machine ~ ]$ git remote add origin https://github.com/neilus/dotfiles.git
```

If I'm missing something please send me a bug report at this github repository:
https://github.com/neilus/dotfiles/issues

All this brought to you under the terms of the M.I.T. Licence

