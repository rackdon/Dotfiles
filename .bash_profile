complete -C aws_completer aws
eval "$(docker-machine env default)"
# enables color in the terminal bash shell 
export CLICOLOR=1 
# sets up the color scheme for list
export LSCOLORS=gxfxcxdxbxegedabagacad 
# enables color for iTerm 
export TERM=xterm-color 
# Color Prompt 
export PS1="\[\e[36;1m\]\u@\[\e[32;1m\]\w> \[\e[0m\]" 

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; 
	killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; 
	killall Finder /System/Library/CoreServices/Finder.app'
alias gulp="node_modules/.bin/gulp"
alias rabbitmq-server='/usr/local/Cellar/rabbitmq/3.6.1/sbin/rabbitmq-server'
alias glog='clear; git log'
alias gst='git status'
alias gbr='git branch'
alias gch='git checkout'
alias gup='clear; git checkout master && git fetch && git pull && git pull--tags'
alias grh='clear; git checkout master && git reset --hard origin/master && git pull'
alias grhs="clear; git submodule foreach 'git checkout master && git reset --hard origin/master && git pull'"
alias gsts='git submodule foreach git status'

GERRIT_USER=""
SLACK_NAME=""
SLACK_MESSAGE=""
SLACK_URL=""
REGEX_URL=""

function slack-notifier {
  link=$(eval "echo \"$1\" | grep http | sed 's/remote\:[[:space:]]*http\:\/\/localhost\:[[:digit:]]*/http\:\/\/$REGEX_URL\/#\/c/'")
  link=${link%???} #It's neccesary clean the last three characters for Slack API.
  if [ ! -z "$link" ]; then
    review=$SLACK_MESSAGE" "${link}
        eval "curl -X POST --data-urlencode 'payload={\"text\": \"$review\",
        \"channel\": \"#reviews\", \"username\": \"$SLACK_NAME\"}'https://hooks.slack.com/services/$SLACK_URL"
    fi
}

function review () {
    local branch="master"
    if [[ $1 = "help" ]]; then
        echo "Usage: review [--branch=<BRANCH>] [--reviewer=<USER> [--cc=<USER>]]"
    else
        for arg in "$@"
        do
            case "$arg" in
                --branch=*) local branch=${arg:9}
                ;;
                --reviewer=*) local reviewer=${arg:11}
                ;;
                --cc=*) local cc=${arg:5}
            esac
        done
        if [ -n "$reviewer" ]; then
            local receive_pack_cmd="git receive-pack --reviewer=$reviewer"
            if [ -n "$cc" ]; then
                receive_pack_cmd="$receive_pack_cmd --cc=$cc"
            fi
        fi
        local git_cmd="git push origin HEAD:refs/for/$branch"
        if [ -n "$receive_pack_cmd" ]; then
            git_cmd="git push --receive-pack '$receive_pack_cmd' origin HEAD:refs/for/$branch"
        fi
        response=$(eval "$git_cmd 2>&1")
        echo "$response"
        slack-notifier "$response"
    fi
}
