#!/bin/bash
GIT_PROMPT_FILE="/usr/share/git-core/contrib/completion/git-prompt.sh"

git config --global color.ui true
git config --global core.editor vim
git config --global alias.lol 'log --oneline --decorate --graph --all'
git config --global alias.lg 'log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset" --abbrev-commit --date=relative'
git config --global diff.tool vimdiff


if [[ -f $GIT_PROMPT_FILE && ! -f ~/.git-prompt.sh ]]; then
  cp $GIT_PROMPT_FILE ~/.git-prompt.sh
  cat >> ~/.bashrc <<'_EOF_'
# Git configurations
. ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE="true"
GIT_PS1_SHOWSTASHSTATE="true"
GIT_PS1_SHOWUNTRACKEDFILES="true"
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="true"
unset PS1
PROMPT_COMMAND='__git_ps1 "${PSUSER}[\u${PSHOST}@\h${PSDIR}:\w]${RESET}" "\\\$ "'
_EOF_
fi
