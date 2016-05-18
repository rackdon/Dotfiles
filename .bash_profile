
# enables color in the terminal bash shell 
export CLICOLOR=1 
# sets up the color scheme for list
export LSCOLORS=gxfxcxdxbxegedabagacad 
# enables color for iTerm 
export TERM=xterm-color 
# Color Prompt 
export PS1="\[\e[36;1m\]\u@\[\e[32;1m\]\w> \[\e[0m\]" 

# sets up proper alias commands when called
alias glog='clear; git log'
alias gst='git status'
alias gbr='git branch'
alias gup='clear; git checkout master && git fetch && git pull && git pull--tags'
alias grh='clear; git checkout master && git reset --hard origin/master && git pull'

alias ls='ls -G'
alias ll='ls -hl'
alias la='ls -a'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; 
	killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; 
	killall Finder /System/Library/CoreServices/Finder.app'
alias gulp="node_modules/.bin/gulp"
