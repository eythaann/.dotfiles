function gitclone () {
    git clone "ssh://git@altssh.bitbucket.org:443/frontierseven/$1"
}

ONEDRIVE_DEV_BACKUP_ROUTE="/mnt/c/Users/dlmqc/OneDrive/debian-backup"
function pushToOneDrive () {
    cd $ONEDRIVE_DEV_BACKUP_ROUTE
    zip -rq "backup_$(date +'%Y%m%d_%H%M%S').zip" ./ -x "*.zip"
    cd ~

    rsync -a ~/.bashrc $ONEDRIVE_DEV_BACKUP_ROUTE
    rsync -a ~/initialConfiguration.txt $ONEDRIVE_DEV_BACKUP_ROUTE

    rsync -a ~/.ohMyPoshTheme.omp.json $ONEDRIVE_DEV_BACKUP_ROUTE
    rsync -a ~/cv $ONEDRIVE_DEV_BACKUP_ROUTE
    rsync -a ~/palete-colors $ONEDRIVE_DEV_BACKUP_ROUTE
    rsync -a ~/CSV-exporter $ONEDRIVE_DEV_BACKUP_ROUTE

    echo "Push Completed ☁️⬆️"
}

function pullOfOneDrive () {
    rsync -a --exclude="*.zip" "$ONEDRIVE_DEV_BACKUP_ROUTE/" ~
    echo "Pull Completed ☁️⬇️"
}

function yis() {
    if [ ! -f "./package.json" ]; then
        echo "package.json don't found"
        return
    fi

    if [ -f "./.nvmrc" ]; then
        echo -e "\e[1;32mChanging node version\e[0m"
        nvm install
    fi

    yarn install
    echo -e "\e[1;36mOpening VS Code\e[0m"
    code .
    echo ''

    PACKAGE_NAME=$(cut -d "=" -f 2 <<< $(npm run env | grep "npm_package_name"))
    if [ "$PACKAGE_NAME" == "f7-frontend-react" ]; then
        APP_DOMAIN=.dev.sightx.io
        ADMIN_DOMAIN=.dev-admin.sightx.io
        APP_ENV=staging

        case "$1" in
        -t | -s | --test | --staging)
            APP_DOMAIN=.staging.sightx.io
            ADMIN_DOMAIN=.staging-admin.sightx.io
            APP_ENV=staging
            ;;
        -d | --dev)
            APP_ENV=development
            ;;
        -p | --prod)
            APP_DOMAIN=.sightx.io
            ADMIN_DOMAIN=.admin.sightx.io
            APP_ENV=prod
            ;;
        --plg)
            APP_DOMAIN=-plg.feature.sightx.io
            ADMIN_DOMAIN=.plg-admin.sightx.io
            APP_ENV=plg
            ;;
        --plge)
            APP_DOMAIN=-plgexternal.feature.sightx.io
            ADMIN_DOMAIN=.plgexternal-admin.sightx.io
            APP_ENV=plgexternal
            ;;
        -m)
            APP_DOMAIN=-methodologies.feature.sightx.io
            #ADMIN_DOMAIN=.methodologies-admin.sightx.io
            APP_ENV=methodologies
            ;;
        esac

        sed -i "s/REACT_APP_ENV=.*/REACT_APP_ENV=${APP_ENV}/" ./.env
        sed -i "s/REACT_APP_DOMAIN=.*/REACT_APP_DOMAIN=${APP_DOMAIN}/" ./.env
        sed -i "s/REACT_APP_ADMIN_APP_DOMAIN=.*/REACT_APP_ADMIN_APP_DOMAIN=${ADMIN_DOMAIN}/" ./.env
    fi

    yarn start
}

######################### ls #########################
# ls aliases
alias ls='exa -F'
alias ll='exa -alF --icons'

######################### git #########################
# git autoCompletion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# git aliases
alias gf='git fetch'

alias gp='git pull'

alias gsc='git switch -c'

alias gst='git stash'

alias gc='git commit'
alias gca='git commit --amend --no-edit'
alias gcm='git commit -m'

alias grs='git reset --soft'
alias grh='git reset --hard'

alias gps='git push origin HEAD'
alias gpsf='git push origin HEAD --no-verify -f'

######################### yarn #########################
# yarn global use
#export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

######################### deno #########################
export PATH="$HOME/.deno/bin:$PATH"

######################### nvm ##########################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -f "./.nvmrc" ]; then
    nvm use
fi

######################### own settings #########################
alias settings='code ~/.bashrc'
alias reload='source ~/.bashrc'
bind 'TAB:menu-complete'

export PATH="$HOME/.bin:$PATH"

# TODO check if it is necesary or not
#[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path bash)"

# the nex function add a line between commands
export lastExecuteCommand=''
print_space_between_commands () {
    if [ -n "$COMP_LINE" ]; then 
        return
    fi

    exclude_commands=("source" "clear" "cd" "[ -d")
    for cmd in "${exclude_commands[@]}"; do
        if [[ "$BASH_COMMAND" == $cmd* ]]; then
            lastExecuteCommand=$BASH_COMMAND
            return
        fi
    done

    if [ "$BASH_COMMAND" = "_omp_hook" ] && ([ "$lastExecuteCommand" = "clear" ] || [[ "$lastExecuteCommand" == "[ -d"* ]]); then 
        return
    fi

    lastExecuteCommand=$BASH_COMMAND
    echo
}

print_line () {
    if [ "$BASH_COMMAND" = "_omp_hook" ]; then 
        # Print the horizontal line
        cols=$(tput cols)
        printf '\n\e[90m%*s\e[0m\n\n' $cols | tr ' ' '-'
    fi
}
trap 'print_line' DEBUG

########################### terminal styles #########################
eval "$(oh-my-posh init bash --config ~/.dotfiles/ohMyPoshTheme.omp.json)"
clear