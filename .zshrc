# If you come from bash you might have to change your $PATH.
# Yep I had to uncomment the below - Mirek
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/mirek/.oh-my-zsh

# Amazon elastic beanstalk CLI ("eb")
export PATH=~/Library/Python/2.7/bin:$PATH

# Installing mysql using the .dmg doesn't update the path, crazy
export PATH=/usr/local/mysql/bin:$PATH

# I updated node using "npm n" and now shit don't work
export PATH=/usr/local/Cellar/node/12.4.0/bin:$PATH


# Android tools
export PATH=/Users/mirek/Library/Android/sdk/platform-tools:$PATH

# Make gem happy
# https://github.com/rbenv/rbenv/issues/1267
export GEM_HOME="$HOME/.gem"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="alanpeabody"

# Don't treat ^s as a control flow char. Let's us forward search for certain remote shells.
# See https://stackoverflow.com/questions/791765/unable-to-forward-search-bash-history-similarly-as-with-ctrl-r/791800#791800
stty -ixon

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  sublime
  z
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"o

#####################
# Local dictionary
#####################
learn() {
    echo "Learn word '$1'?"
    read "?Press enter to continue"
    echo "Adding..."
    echo "$1" >> ~/Library/Spelling/LocalDictionary
    echo "Sorting..."
    sort --ignore-case -o ~/Library/Spelling/LocalDictionary ~/Library/Spelling/LocalDictionary
    echo "Killing AppleSpell..."
    killall -9 AppleSpell
    echo "Done"
}

#####################
# Git
#####################
alias gcom="git commit -am 'auto-commit'"
alias gdev="git stash | grep 'No local changes' && git checkout develop && git pull --rebase origin develop || (git checkout develop && git pull --rebase origin develop && git stash pop)"

gnew() {
    git checkout -b mirek/"$1"
}


#####################
# Rynly
#####################

alias goRYN="cd ~/workspace/rynly/rynly.web"

# Connect to databases
alias mongouat="mongo 'mongodb+srv://rynlyuatdatabase-mnn1v.gcp.mongodb.net/rynlyuat' -u mirek_read_only -p`cat ~/.ssh/rynly/rynly_atlasdb_mirek_read_only`"
alias mongouatwrite="mongo 'mongodb+srv://rynlyuatdatabase-mnn1v.gcp.mongodb.net/rynlyuat' -u mirek_read_write -p`cat ~/.ssh/rynly/rynly_atlasdb_mirek_read_write`"

alias mongoqa="mongo 'mongodb+srv://rynlyqadatabase-mnn1v.gcp.mongodb.net/rynlyqa' -u mirek_read_only -p`cat ~/.ssh/rynly/rynly_atlasdb_mirek_read_only`"
alias mongoqawrite="mongo 'mongodb+srv://rynlyqadatabase-mnn1v.gcp.mongodb.net/rynlyqa' -u mirek_read_write -p`cat ~/.ssh/rynly/rynly_atlasdb_mirek_read_write`"

alias mongotest="mongo 'mongodb+srv://rynlytest-ehkoq.gcp.mongodb.net/rynlytestdb'  -u mirek_test_admin -p`cat ~/.ssh/rynly/rynly_atlasdb_mirek_test_admin`"

alias mongodemo="mongo 'mongodb+srv://rynlydemodatabase-k05la.gcp.mongodb.net/rynlydemo' -u mirek_read_only -p`cat ~/.ssh/rynly/rynly_atlasdb_mirek_read_only`"
alias mongodemowrite="mongo 'mongodb+srv://rynlydemodatabase-k05la.gcp.mongodb.net/rynlydemo' -u mirek_read_write -p`cat ~/.ssh/rynly/rynly_atlasdb_mirek_read_write`"

alias mongosunshine="mongo 'mongodb+srv://sunshinedivision.ejrut.gcp.mongodb.net/rynlysunshinedivision' -u mirek_read_only -p`cat ~/.ssh/rynly/rynly_atlasdb_mirek_read_only`"
alias mongosunshinewrite="mongo 'mongodb+srv://sunshinedivision.ejrut.gcp.mongodb.net/rynlysunshinedivision' -u mirek_read_write -p`cat ~/.ssh/rynly/rynly_atlasdb_mirek_read_write`"

alias mongoplatform1="mongo 'mongodb+srv://platform1.fpstb.mongodb.net/rynlyplatform1' -u mirek_read_only -p`cat ~/.ssh/rynly/rynly_atlasdb_mirek_read_only`"
alias mongoplatform1write="mongo 'mongodb+srv://platform1.fpstb.mongodb.net/rynlyplatform1' -u mirek_read_write -p`cat ~/.ssh/rynly/rynly_atlasdb_mirek_read_write`"

alias mongoproduction="mongo 'mongodb+srv://rynlyproductiondatabase-mnn1v.gcp.mongodb.net/rynlyproduction' -u mirek_read_only -p`cat ~/.ssh/rynly/rynly_atlasdb_mirek_read_only`"
alias mongoproductionwrite="mongo 'mongodb+srv://rynlyproductiondatabase-mnn1v.gcp.mongodb.net/rynlyproduction' -u mirek_read_write -p`cat ~/.ssh/rynly/rynly_atlasdb_mirek_read_write`"

# Dump databases
alias dumpprod='mongodump --ssl -d rynlyproduction -h rynlyproductiondatabase-shard-0/rynlyproductiondatabase-shard-00-00-mnn1v.gcp.mongodb.net:27017 -u mirek_read_only -p`cat ~/.ssh/rynly/rynly_atlasdb_mirek_read_only` --authenticationDatabase admin -o ~/rynly_db_dumps/rynlyproduction_`date '+%Y_%m_%d'`'
alias dumpuat='mongodump --ssl -d rynlyuat -h rynlyuatdatabase-shard-0/rynlyuatdatabase-shard-00-00-mnn1v.gcp.mongodb.net:27017 -u mirek_read_only -p`cat ~/.ssh/rynly/rynly_atlasdb_mirek_read_only` --authenticationDatabase admin -o ~/rynly_db_dumps/rynlyuat_`date '+%Y_%m_%d'`'
alias dumpqa='mongodump --ssl -d rynlyqa -h rynlyqadatabase-shard-0/rynlyqadatabase-shard-00-00-mnn1v.gcp.mongodb.net:27017 -u mirek_read_only -p`cat ~/.ssh/rynly/rynly_atlasdb_mirek_read_only` --authenticationDatabase admin -o ~/rynly_db_dumps/rynlyqa_`date '+%Y_%m_%d'`'

alias dumplocalprod='mongodump -d rynlyproduction -o ~/rynly_db_dumps/rynlylocalproduction_`date '+%Y_%m_%d'`'
alias dumplocaluat='mongodump -d rynlyuat -o ~/rynly_db_dumps/rynlylocaluat_`date '+%Y_%m_%d'`'
alias dumplocalqa='mongodump -d rynlyqa -o ~/rynly_db_dumps/rynlylocalqa_`date '+%Y_%m_%d'`'

# Pass a folder prefix as the firm argment and the name of the db as the second (e.g. 'restoreDatabase rynlylocalproduction rynlyproduction'
restoreDatabase() {
    LATEST_FOLDER=`ls -lrt ~/rynly_db_dumps | grep $1 | tail -n 1 | awk '{print $NF}'`
    echo $LATEST_FOLDER
    mongorestore --drop -d $2 ~/rynly_db_dumps/$LATEST_FOLDER/$2
}

# Restore databases
alias restoreprod='restoreDatabase rynlyproduction rynlyproduction'
alias restoreuat='restoreDatabase rynlyuat rynlyuat'
alias restoreqa='mongorestore rynlyqa rynlyqa'

alias restorelocalprod='restoreDatabase rynlylocalproduction rynlyproduction'
alias restorelocaluat='restoreDatabase rynlylocaluat rynlyuat'
alias restorelocalqa='mongorestore rynlylocalqa rynlyqa'

# Live log stream
alias logprod="curl -u \\\$rynlyproduction:`cat ~/.ssh/rynly/logstream/prodtoken` https://rynlyproduction.scm.azurewebsites.net/api/logstream"
alias loguat="curl -u \\\$rynlyuat:`cat ~/.ssh/rynly/logstream/uattoken` https://rynlyuat.scm.azurewebsites.net/api/logstream"
alias logqa="curl -u \\\$rynlyqa:`cat ~/.ssh/rynly/logstream/qatoken` https://rynlyqa.scm.azurewebsites.net/api/logstream"


############
# Keylogging
############

print_klog_dest() { echo "written to /var/log/keystroke.log"; }

sneaky_keylogger() {
    trap 'print_klog_dest' SIGINT
    echo 'KLOG running, dont forget to kill'
    sudo keylogger > /dev/null
    trap - SIGINT
}

alias klog=sneaky_keylogger


#####################
# Pausing steam games
#####################

pause_pid() {
    echo "About to pause $1"
    kill -STOP $1
}

# pass the PID as the arg
resume_pid() {
    echo "About to resume $1"
    kill -CONT $1
}

# echos the PIDs as a string (bash / zsh functions can't return arrays)
echo_steam_pids() {
    echo `ps aux | grep -i Steam | grep -v grep | grep -v ipcserver | awk '{print $2}'`
}

pause_steam() {
    # zsh doesn't do word splitting like bash
    # see https://stackoverflow.com/questions/23157613/how-to-iterate-through-string-one-word-at-a-time-in-zsh
    echo "Pausing steam"
    local pids=$(echo_steam_pids)
    local pid
    for pid in ${(z)pids}; do
        pause_pid $pid
    done
}

resume_steam() {
    echo "Resume steam"
    local pids=$(echo_steam_pids)
    local pid
    for pid in ${(z)pids}; do
        resume_pid $pid
    done
}

echo_divinity_pid() {
    echo `ps aux | grep Divinity | grep -v grep | awk '{print $2}'`
} 

test_divinity_running() {
    if [ -z `echo_divinity_pid` ]; then
        echo "Divinity isn't running, quiting"
        return 1
    else
        echo "Divinity running, presumably about to pause / resume"
    fi
}

pause_divinity() {
    test_divinity_running && pause_pid `echo_divinity_pid` && pause_steam
}

resume_divinity() {
    test_divinity_running && resume_pid `echo_divinity_pid` && resume_steam 
}

# these aliases need to wrap a function so that we don't hard-code the divinity pid
alias pdiv=pause_divinity
alias rdiv=resume_divinity

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mirek/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mirek/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mirek/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mirek/google-cloud-sdk/completion.zsh.inc'; fi
