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
alias dumpdemo='mongodump --ssl -d rynlydemo -h rynlydemodatabase-shard-00-01.k05la.gcp.mongodb.net:27017 -u mirek_read_only -p`cat ~/.ssh/rynly/rynly_atlasdb_mirek_read_only` --authenticationDatabase admin -o ~/rynly_db_dumps/rynlydemo_`date '+%Y_%m_%d'`'
alias dumpsunshine='mongodump --ssl -d rynlysunshinedivision -h atlas-dq1kta-shard-0/sunshinedivision-shard-00-00.ejrut.gcp.mongodb.net:27017 -u mirek_read_only -p`cat ~/.ssh/rynly/rynly_atlasdb_mirek_read_only` --authenticationDatabase admin -o ~/rynly_db_dumps/rynlysunshinedivision_`date '+%Y_%m_%d'`'
alias dumpplatform1='mongodump --ssl -d rynlyplatform1 -h platform1-shard-00-00.fpstb.mongodb.net:27017 -u mirek_read_only -p`cat ~/.ssh/rynly/rynly_atlasdb_mirek_read_only` --authenticationDatabase admin -o ~/rynly_db_dumps/rynlyplatform1_`date '+%Y_%m_%d'`'

alias dumplocalprod='mongodump -d rynlyproduction -o ~/rynly_db_dumps/rynlyproduction_`date '+%Y_%m_%d'`'
alias dumplocaldemo='mongodump -d rynlydemo -o ~/rynly_db_dumps/rynlydemo_`date '+%Y_%m_%d'`'
alias dumplocaluat='mongodump -d rynlyuat -o ~/rynly_db_dumps/rynlyuat_`date '+%Y_%m_%d'`'
alias dumplocalqa='mongodump -d rynlyqa -o ~/rynly_db_dumps/rynlyqa_`date '+%Y_%m_%d'`'

# Restore databases
alias restoreprod='mongorestore --drop -d rynlyproduction ~/rynly_db_dumps/rynlyproduction_`date "+%Y_%m_%d"`/rynlyproduction'
alias restoreuat='mongorestore --drop -d rynlyuat ~/rynly_db_dumps/rynlyuat_`date "+%Y_%m_%d"`/rynlyuat'
alias restoreqa='mongorestore --drop -d rynlyqa ~/rynly_db_dumps/rynlyqa_`date "+%Y_%m_%d"`/rynlyqa'
alias restoredemo='mongorestore --drop -d rynlydemo ~/rynly_db_dumps/rynlydemo_`date "+%Y_%m_%d"`/rynlydemo'
alias restoresunshine='mongorestore --drop -d rynlysunshinedivision ~/rynly_db_dumps/rynlysunshinedivision_`date "+%Y_%m_%d"`/rynlysunshinedivision'
alias restoreplatform1='mongorestore --drop -d rynlyplatform1 ~/rynly_db_dumps/rynlyplatform1_`date "+%Y_%m_%d"`/rynlyplatform1'

# Live log stream
alias logprod="curl -u \\\$rynlyproduction:[REMOVED] https://rynlyproduction.scm.azurewebsites.net/api/logstream"


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
