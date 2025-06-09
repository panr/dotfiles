export DISPLAY=:0
export EDITOR="vim"
export LANG="en_US.UTF-8"

bindkey \^U backward-kill-line

export PATH="$HOME/bin:/bin:/usr/bin:/usr/local/bin:$PATH"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# Go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
#export GOROOT=/opt/homebrew/
export GOPROXY="https://proxy.golang.org,direct"
export PATH=$PATH:$GOBIN:$GOROOT/bin
# Ruby
export PATH="/opt/homebrew/lib/ruby/gems/3.0.0/bin:$PATH"
# DOOM Emacs
export PATH="$PATH:$HOME/.config/emacs/bin"

if [ -f ~/.commands ]; then source ~/.commands; fi
if [ -f ~/.aliases ]; then source ~/.aliases; fi
if [ -f ~/.homebrew ]; then source ~/.homebrew; fi

# Quick custom prompt
zstyle ":completion:*:default" menu select
setopt prompt_subst
git_prompt() {
  BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\(.*\)/\1/')
  if [ ! -z $BRANCH ]; then
    echo -n " %F{green}($(echo $BRANCH | sed 's/ //g'))%f"

    if [ ! -z "$(git status --short)" ]; then
      echo " %F{yellow}●%f"
    fi
  fi
}
PS1='%(?.%F{green}▶︎.%F{red}▶︎)%f %n@%m %1~$(git_prompt) $ '

LSCOLORS="Hxfxcxdxbxegedabagacad"
LS_COLORS="di=1;37:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
export LSCOLORS
export LS_COLORS

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt INC_APPEND_HISTORY     # Immediately append to history file.
setopt EXTENDED_HISTORY       # Record timestamp in history.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS       # Dont record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt HIST_IGNORE_SPACE      # Dont record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS      # Dont write duplicate entries in the history file.
unsetopt SHARE_HISTORY          # Share history between all sessions.
unsetopt HIST_VERIFY          # Execute commands using history (e.g.: using !$) immediately

