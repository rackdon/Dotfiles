# enables color in the terminal bash shell 
export CLICOLOR=1 
# sets up the color scheme for list
export LSCOLORS=gxfxcxdxbxegedabagacad 
# enables color for iTerm 
export TERM=xterm-color 
# Color Prompt 
export PS1="\[\e[36;1m\]\u@\[\e[32;1m\]\w> \[\e[0m\]" 

GERRIT_USER="rackdon"
SLACK_NAME="ricardo"
SLACK_MESSAGE="apply Ricardo use strict or not, that is the question... :thinking_face:\n"
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
